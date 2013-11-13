<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- HEAD -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />  
<%@ page contentType="text/html;charset=EUC-KR" %>

<%@ page import="java.sql.*"%>
<%@ page import="java.sql.PreparedStatement"%>

<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>

<title> Bar chart test </title>

  <link rel="stylesheet" type="text/css" href="styles/jquery.jqplot.css" />
  <link rel="stylesheet" type="text/css" href="styles/jquery-ui.css" />
  <link rel="stylesheet" type="text/css" href="styles/style.css" />
  <link rel="stylesheet" type="text/css" href="styles/tableStyle.css" />

<script src="scripts/jquery-1.8.3.js"> </script>
<script src="scripts/jquery.jqplot.js"> </script>
<script type="text/javascript" src="scripts/jqplot.barRenderer.js"></script>
<script type="text/javascript" src="scripts/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="scripts/jqplot.pointLabels.js"></script>
<script type="text/javascript" src="scripts/jqplot.canvasAxisLabelRenderer.js"></script>
<script type="text/javascript" src="scripts/jqplot.canvasTextRenderer.js"></script>
<script type="text/javascript" src="scripts/jqplot.canvasAxisTickRenderer.js"></script>
<script src="scripts/barChart.js"> </script>
<script type="text/javascript" src="scripts/jquery-ui.js"></script>
<script type="text/javascript" src="scripts/datePicker.js"></script>

</head>
<%
	////////////////////////////////  Initialization  ////////////////////////////////////
	/*
	1. set size and global variables
	2. set default duration
	3. set DB connection
	*/
	
	// variables
	int i;
	int bodyWidth  	= 1500; // px, html body tag style
	int graphWidth 	= 1200; // px
	int graphHeight = 500; // px
	int maxElement	= 12;
	String []marketName={
			"softandroid.ru",
			"월드베스트소프트웨어",
			"androidbest.ru",
			"slideme",
			"V3Mobile",
			"androzone.ru",
			"nduoa_downloader",
			"nduoa",
			"apk.imobile.com.cn",
			"androidlife.ru",
			"mysensor.ru",
			"news-android.com",
			"www.android-app.ru",
			"androidis.ru",
			"samsung",
			"pandaapp",
			"samsung Electronics",
			"ggg",
			"android155",
			"sjapk",
			"jssec",
			"androidd",
	};
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	// 1. calculate today date
	// declare temp viriables
	Date	date_tmpDate;
	String 	str_tmpTo;
	String 	str_defaultFrom;
	String 	str_defaultTo;
	int		int_tmp;
	Calendar cal_tmp;
	Calendar cal_today;
	
	cal_today = Calendar.getInstance( );// get today calendar  
	str_defaultTo = dateFormat.format(cal_today.getTime());
	// 1.1. calculate from date 
	date_tmpDate = dateFormat.parse(str_defaultTo);
	int_tmp = cal_today.get(Calendar.DAY_OF_WEEK);
	cal_tmp = cal_today;
	cal_tmp.add(Calendar.DAY_OF_WEEK, - int_tmp + 1);
	str_defaultFrom = dateFormat.format(cal_tmp.getTime());
	
	// 2. query oracle
	// 2.1. get driver
/* 	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@210.121.169.46:1521:wbsdev.ahnlab.com";
	String user = "mobiledev";
	String pw = "oracle1234";
	Connection conn = DriverManager.getConnection(url, user, pw);	
	 */
	// DB query temp variable


%>

<!-- BODY -->
<body style="width:<%=bodyWidth%>px;">

	<!-- 페이지 선택 -->
	<table>
	<tr>
	<td><img src="styles/images/ahnlab.png" width="150px" height="30px"></td> 
	<td style="font-size:35px;"><strong>&nbsp;&nbsp;&nbsp;수집통계시스템</strong></td>
	<td> <input type="submit" value="세부기간입력" onclick="showBarGraph( 1, 2, 3);">	</td>
	</tr>
	</table>

<!-- 
<input id="total" value="5"> 
<input id="unique" value="6"> 
<input id="mal" value="7"> 

<script>
	var total = document.getElementById('total').value;
	var unique = document.getElementById('unique').value;
	var mal = document.getElementById('mal').value;
	
	alert(total);
	alert(unique);
	alert(mal);
	
	$(document).ready(function(){
		$("input").click(function(){
			$("#chartTest").toggle("slow");
		});
	});
</script>
 -->
 
	<!-- 기간 입력 받기 -->
 	<table>
	<tr style="height:50px;"></tr>
 	<tr>
 	<td align="center" style="font-size:25px;">
 	<strong>
 	<form name="form1" method="post" action="dbTest.jsp">
 	From: <input type="text" readonly value=<%=str_defaultFrom %> name="from" size="11" id="datepickerFrom" style="font-size:25px;">    
 	&nbsp; &nbsp; &nbsp; To: <input type="text" value=<%=str_defaultTo %> readonly name="to" size="11" id="datepickerTo" style="font-size:25px;">
 	&nbsp; &nbsp; &nbsp; 
 	<input type="submit" value="기간입력완료" >
 	</form>
 	</strong>
   	</td>
  	</tr>
  	 	
  	<!-- 그래프 그리기 -->
  	
  	<tr>
  	<td>
  		<div id="chart3" style="width:<%=graphWidth%>px; height:<%=graphHeight%>px;"></div>
		
	</td>
	<td>
	 
	<div id="checkboxes" style="border-style:solid; border-width:1px;">
	<input type="checkbox" name="Total" value="Total" checked> Total<BR>
	<input type="checkbox" name="Select All" value="Select All" checked> Select All<BR>
	<%
	for(i=1; i<=maxElement; i++)
		out.println("<input type=\"checkbox\" name=\"market" + i  + "\" value=\"market" +
		i + "\" checked> market" + i +" (" + marketName[i-1] + ")"+  "<BR>" );
	%>
	</div>
	</td>
	</tr>
	
	<tr style="height:100px;"></tr>
	
</table>
	
	<!-- 표 그리기 -->
		
	<!--   <table align="center" border="1" cellpadding="10" >  -->
	<table id="dataTable"> 

	<tr>
	<th class="dataTableHeader">출처</th> <th class="dataTableHeader">수집 App</th>
	<th class="dataTableHeader">Unique App</th> <th class="dataTableHeader">악성 App</th> 
	<th class="dataTableHeader">중복 App</th>
	</tr>
	<%
	for(i=1; i<=maxElement; i++)
	{
		out.println("<tr><td class=\"tableDataRef\">"  + marketName[i-1] +  
		"</td> <td class=\"tableData\">100</td>" +
		"<td class=\"tableData\">80</td> <td class=\"tableData\">50</td> <td class=\"tableData\">20</td></tr>");
	}
	%>	
	<tr>
	<td class="tableDataRef">Total</td> <td class="tableData">250</td>
	 <td class="tableData">150</td> <td class="tableData">80</td> <td class="tableData">100</td>
	</tr>
	
	</table>

</body>
</html>