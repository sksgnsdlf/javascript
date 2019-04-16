<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
        data.addColumn('string', '부서');
        data.addColumn('number', '대리');
        data.addColumn('number', '사원');
        
        data.addRows([
          ['총무', 2000,10000],
          ['인사', 50000,20000],
          ['개발', 10000,30000],
        ]);

        // Set chart options
        var options = {'title':'How Much Pizza I Ate Last Night',
                       'width':800,
                       'height':500,
                       colors:['#e0440e','#e6693e','ec8f6e','f3b49f','f6c7b6'],
                       is3D: true,
                       legend: 'none',		//차트의 레이블삭제
                       bar: {groupWidth: '95%'},	//바 크기
                       vAxis: { gridlines: { count: 5 },format: 'decimal' ,maxValue:100000}	,
                       								//간격갯수 , 단위지정 , 최대단위
                        animation:{
                          "startup": true,
					      duration: 1000,
					      easing: 'out',
   					   }
        };

        // Instantiate and draw our chart, passing in some options.
 //       var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
 //       var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);
        google.visualization.events.addListener(chart,"select",selectChart);
        									  // 타겟 ,   타겟,     핸들러
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