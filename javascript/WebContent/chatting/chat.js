var chat = {};

chat.LOGIN_SUCCESS = 0x01;
chat.LOGIN_ERROR = 0x02;
chat.MESSAGE_LOADED_SUCCESS = 0x04;
chat.MESSAGE_LOADED_ERROR = 0x08;
chat.MESSAGE_SENDED_SUCCESS = 0x10;
chat.MESSAGE_SENDED_ERROR = 0x10;
chat.LOGOUT_SUCCESS = 0x40;
chat.LOGOUT_ERROR = 0x80;

chat.ChatModel = function() { //모델
	this.nickName = null;
	this.lastMsgId = 0;
	this.listeners = new Array();
	
	this.loadMessageTimer = null;
}
chat.ChatModel.prototype = {
	getNickName: function() {
		return this.nickName;
	},
	login: function(nickName) {
		// ä�� ������ �α����Ѵ�.
		var params = "nickName="+encodeURIComponent(nickName);
		new ajax.xhr.Request("login.jsp", params, 
			this.logedIn, "POST", this);
	},
	logedIn: function(req) {
		if (req.readyState == 4) {
			if (req.status == 200) {
				var xmlDoc = req.responseXML;
				this.nickName = xmlDoc.getElementsByTagName("nickName")
				                       .item(0).firstChild.nodeValue;
				
				this.notify(chat.LOGIN_SUCCESS); //로그인 닉네임바꼈으니까 UI에서 변경하라고 알려줌
				this.loadMessage();
			} else {
				this.notify(chat.LOGIN_ERROR, req.status);
			}
		}
	},
	logout: function() {
		// ä�� �������� �α׾ƿ��Ѵ�.
		var params = "nickName="+encodeURIComponent(this.nickName);
		new ajax.xhr.Request("logout.jsp", params, 
			this.logedOut, "POST", this);
	},
	logedOut: function(req) {
		if (req.readyState == 4) {
			if (req.status == 200) {
				this.notify(chat.LOGOUT_SUCCESS);
			} else {
				this.notify(chat.LOGOUT_ERROR, req.status);
			}
		}
	},
	loadMessage: function() {
		if (this.loadMessageTimer != null) {
			clearTimeout(this.loadMessageTimer);
		}
		var params = "lastMsgId="+this.lastMsgId;
		new ajax.xhr.Request("loadMessage.jsp", params, 
			this.loadedMessage, "POST", this);
	},
	loadedMessage: function(req) {
		if (req.readyState == 4) {
			if (req.status == 200) {
				var xmlDoc = req.responseXML;
				var code = xmlDoc.getElementsByTagName("code")
				                 .item(0).firstChild.nodeValue;
				if (code == 'success') {
					var lastMsgId = parseInt(
						xmlDoc.getElementsByTagName("lastMsgId")
						      .item(0).firstChild.nodeValue
					);
					if (lastMsgId != 0) {
						this.lastMsgId = lastMsgId;
					}
					var msgs = new Array();
					var messageTags = xmlDoc.getElementsByTagName("message");
					for (var i = 0 ; i < messageTags.length ; i++) {
						msgs[msgs.length] = messageTags.item(i)
						                    .firstChild.nodeValue;
					}
					
					this.notify(chat.MESSAGE_LOADED_SUCCESS, msgs);
					
					var model = this;
					var reloadFunc = function() {
						model.loadMessage.apply(model);
					}
					this.loadMessageTimer = setTimeout(reloadFunc, 500);
				} else {
					this.notify(chat.MESSAGE_LOADED_ERROR, "����");
				}
			} else {
				this.nofify(chat.MESSAGE_LOADED_ERROR, req.status);
			}
		}
	},
	sendMessage: function(msg) {
		// �޽����� ����Ѵ�.
		var params = "nickName="+encodeURIComponent(this.nickName)+
		             "&msg="+encodeURIComponent(msg);
		new ajax.xhr.Request("sendMessage.jsp", params, 
			this.messageSended, "POST", this);
	},
	messageSended: function(req) {
		if (req.readyState == 4) {
			if (req.status == 200) {
				this.notify(chat.MESSAGE_SENDED_SUCCESS); //UI 바꿔라고 컨트롤러에 통지
			} else {
				this.notify(chat.MESSAGE_SENDED_ERROR, req.status);
			}
		}
	},
	addListener: function(listener) {
		this.listeners[this.listeners.length] = listener;
	},
	removeListener: function(listener) {
		var tempListeners = new Array();
		for (var i = 0 ; i < this.listeners.length ; i++) {
			if (this.listeners[i] != listener) {
				tempListeners.add(this.listeners[i]);
			}
		}
		this.listeners = tempListeners;
	},
	notify: function(type, msgs) { //등록된 옵저버(listener)한테 UI변경하라고 함
		for (var i = 0 ; i < this.listeners.length ; i++) {
			this.listeners[i].actionPerformed(type, msgs);
		}
	}
}

chat.Chat = function() { //컨트롤러
	this.chatModel = new chat.ChatModel();
	this.chatUI = new chat.ChatUI();
	
	this.chatModel.addListener(this); //옵저버 등록
	this.chatUI.setChat(this); //옵저버 등록
	
	this.chatUI.render();
}
chat.Chat.prototype = {
	login: function(nickName) {
		this.chatModel.login(nickName);
	},
	logout: function() {
		this.chatModel.logout();
	},
	actionPerformed: function(type, msgs) {
		if (type == chat.LOGIN_SUCCESS) {
			this.chatUI.processLoginSuccess();
		} else if (type == chat.LOGIN_ERROR) {
			this.chatUI.processError(type, msgs);
		} else if (type == chat.MESSAGE_LOADED_SUCCESS) {
			for (var i = 0 ; i < msgs.length ; i++) {
				this.chatUI.appendMessage(msgs[i]);
			}
		} else if (type == chat.MESSAGE_LOADED_ERROR) {
			this.chatUI.processError(type, msgs);
		} else if (type == chat.MESSAGE_SENDED_SUCCESS) {
			
		} else if (type == chat.MESSAGE_SENDED_ERROR) {
			this.chatUI.processError(type, msgs);
		} else if (type == chat.LOGOUT_SUCCESS) {
			this.chatUI.processLogoutSuccess();
		} else if (type == chat.LOGOUT_ERROR) {
			this.chatUI.processError(type, msgs);
		}
	},
	sendMessage: function(message) {
		this.chatModel.sendMessage(message); //모델에 바꼈다고 알림
	}
}

chat.ChatUI = function() {
	this.chat = null;
	
	this.loginWinDiv = null;
	this.nickNameInput = null;
	
	this.chatWinDiv = null;
	this.chatArea = null;
	this.messageInput = null;
}
chat.ChatUI.prototype = { //채팅창 디자인 변경할려면 UI변경
	setChat: function(chat) {
		this.chat = chat;
	},
	render: function() {
		this.makeLoginWindow();
		this.makeChatWindow();
	},
	makeLoginWindow: function() {
		var loginWinDiv = document.createElement("div");
		var nickNameInput = document.createElement("input");
		nickNameInput.type = "text";
		nickNameInput.size = "10";
	
		var loginBtn = document.createElement("input");
		loginBtn.type = "button";
		loginBtn.value = "로그인";


		loginWinDiv.appendChild(nickNameInput);
		loginWinDiv.appendChild(loginBtn);

		loginWinDiv.style.border = "1px solid #000"; //여기 디자인 변경
		loginWinDiv.style.position = 'absolute';
		loginWinDiv.style.width = '400px';
		loginWinDiv.style.height = '400px';
		loginWinDiv.style.left = '400px';
		loginWinDiv.style.top = '300px';
		
		document.body.appendChild(loginWinDiv);
		
		ajax.Event.addListener(loginBtn, "click",
			ajax.Event.bindAsListener(this.doClickOnLoginBtn, this));
		
		this.nickNameInput = nickNameInput;
		this.loginWinDiv = loginWinDiv;
	},
	makeChatWindow: function() {
		var chatWinDiv = document.createElement("div");
		
		var chatArea = document.createElement("div");
		chatArea.style.overflow = 'scroll';
		chatArea.style.height = '350px';
		
		var messageInput = document.createElement("input"); //텍스트필드 <input type="text"/>
		messageInput.type = "text";
		messageInput.style.width = "98%";

		var logoutBtn = document.createElement("input");
		logoutBtn.type = "button";
		logoutBtn.value = "로그아웃";
		
		chatWinDiv.appendChild(chatArea);
		chatWinDiv.appendChild(messageInput);
		chatWinDiv.appendChild(document.createElement("br"));
		chatWinDiv.appendChild(logoutBtn);
		
		chatWinDiv.style.border = "1px solid #000";
		chatWinDiv.style.position = 'absolute';
		chatWinDiv.style.width = '400px';
		chatWinDiv.style.height = '400px';
		chatWinDiv.style.left = '400px';
		chatWinDiv.style.top = '300px';
		chatWinDiv.style.visibility = 'hidden';
		
		document.body.appendChild(chatWinDiv);
		
		ajax.Event.addListener(messageInput, "keydown",
			ajax.Event.bindAsListener(this.doKeyDownOnInput, this)); //메시지 입력하고 엔터키누르면 doKeyDownOnInput 호출됨
		
		ajax.Event.addListener(logoutBtn, "click",
			ajax.Event.bindAsListener(this.doClickOnLogoutBtn, this));
		
		this.messageInput = messageInput;
		this.chatArea = chatArea;
		this.chatWinDiv = chatWinDiv;
	},
	doClickOnLoginBtn: function(e) {
		if (this.nickNameInput.value != '') {
			this.chat.login(this.nickNameInput.value);
		} else {
			alert("�г����� �Է��ϼ���");
			this.nickNameInput.focus();
		}
	},
	processLoginSuccess: function() {
		this.hiddenLogin();
		this.showChat();
	},
	doKeyDownOnInput: function(e) {
		var event = window.event || e;
		if (e.keyCode == 13) { // 엔터키이면
			var msg = this.messageInput.value;
			this.messageInput.value = "";
			this.chat.sendMessage(msg); //컨트롤러에 전송할메시지와함께 바꼈다고 알림
		}
	},
	appendMessage: function(msg) {
		this.chatArea.innerHTML += msg + "<br/>";
		this.chatArea.scrollTop = 
			this.chatArea.scrollHeight-this.chatArea.clientHeight;
	},
	doClickOnLogoutBtn: function() {
		this.chat.logout();
	},
	processLogoutSuccess: function() {
		this.hiddenChat();
		this.showLogin();
		alert("�α׾ƿ��ϼ̽��ϴ�");
	},
	showLogin: function() {
		this.loginWinDiv.style.visibility = 'visible';
	},
	hiddenLogin: function() {
		this.loginWinDiv.style.visibility = 'hidden';
	},
	showChat: function() {
		this.chatArea.innerHTML = "";
		this.chatWinDiv.style.visibility = 'visible';
		this.messageInput.focus();
	},
	hiddenChat: function() {
		this.chatWinDiv.style.visibility = 'hidden';
	},
	processError: function(type, errMsg) {
		if (type == chat.LOGIN_ERROR) {
			alert("�α��ο� �����߽��ϴ�:"+errMsg);
		} else if (type == chat.MESSAGE_LOADED_ERROR) {
			alert("ä�� �޽��� �ε� �����߽��ϴ�:"+errMsg);
		} else if (type == chat.MESSAGE_SENDED_SUCCESS) {
			
		} else if (type == chat.MESSAGE_SENDED_ERROR) {
			alert("ä�� �޽��� ��ۿ� �����߽��ϴ�:"+errMsg);
		} else if (type == chat.LOGOUT_ERROR) {
			alert("�α׾ƿ��� �����߽��ϴ�:"+errMsg);
		}
	}
}