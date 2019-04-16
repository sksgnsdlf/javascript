<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
    	// Set chart options
        var options = {'title':'부서별 사원수',
                       'width':800,
                       'height':500
        };
 //       var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
 //       var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        
        //ajax 호출
        var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		    		data.addColumn('string', '부서');
		            data.addColumn('number', '사원수');
		            var list = JSON.parse(xhttp.responseText);
		            var arr = [];
		            for(i=0; i<list.length; i++){
		            	arr.push([list[i].department_name, parseInt(list[i].cnt)]);
		            }
		            
		    		data.addRows(arr);
			        chart.draw(data, options);
			    }
		    
		};
		  xhttp.open("GET", "../SelectDeptEmpServ", true);
		  xhttp.send();
	  }
      function selectChart(){
    	  alert("막대 선택");
      }
    </script>
</head>

<body>
	<!--Div that will hold the pie chart-->
	<div id="chart_div"></div>
</body>
</html>