	function Button(elementId) {
		this.element = document.getElementById(elementId);
        this.element.style.border = '1px solid blue';	
        this.element.style.backgroundColor = 'blue';	
        this.element.style.color = 'white';	
        this.element.style.fontSize = '3em';
        var btn = this;  //Button 클래스	
        var overFunc = function() {
            //apply도 함수를 호출하는것 / 함수 호출할때  컨텍스트(this)를 인수로 넘겨줌
            btn.doMouseOver.apply(btn, arguments);
		}
		 var outFunc = function() {
		 	btn.doMouseOut.apply(btn, arguments);
		 }	
		this.element.addEventListener("mouseover", overFunc );
		this.element.addEventListener("mouseout", outFunc  );
	}	
	Button.prototype = {
		doMouseOver: function(e) {
            console.log(this);  //event target을 말함
            //this.style.background = '#999';
            this.element.style.background= '#999';
        },
		doMouseOut: function(e) {
            this.element.style.background= 'blue';
			}
	}