<%-- tpl:insert page="/theme/VCSTemplate.jtpl" --%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>

<%@page import="com.ignou.vcs.beans.courseBean"%><html:html>
<head>
<script type="text/javascript" language="javascript" >
function loadCss() {
	var browser = navigator.appName.toLowerCase();
	// document.write(browser);
	var stylesheet = document.getElementById("pagestyle");
	var menusheet = document.getElementById("menustyle");
	if(browser.indexOf("microsoft internet explorer") != -1) {
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style_ie.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu_ie.css";
	}
	else {
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style1.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu.css";		
	}
}
</script> 
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style1.css" />
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>

<!-- LightBox css and scripts -->
<%
	String usid = (String) request.getSession().getAttribute("userId");
	if(usid != null) {
 %>
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/lightbox_vid.css" media="screen,projection" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>
 	
 
 <%
 }
 
  %>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<%-- tpl:put name="headarea" --%><title>Virtual Classroom System</title><%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				<%-- tpl:put name="buttons_blue_green" --%>
					
				<%-- /tpl:put --%>
				</div>
				<% 
						Date date = new Date();
						DateFormat formatterMonth = new SimpleDateFormat("MMM");
						DateFormat formatterDay = new SimpleDateFormat("dd");
						
						String month = formatterMonth.format(date);
						String day = formatterDay.format(date);
						month = month.toUpperCase();
						
						if(day.equals("1") || day.equals("21") || day.equals("31")) {
							day = day + "st";
						} else if(day.equals("2") || day.equals("22")) {
							day = day + "nd";						
						} else if(day.equals("3") || day.equals("23")) {
							day = day + "rd";						
						} else {
							day = day + "th";						
						} 
						
					%>
				<%-- tpl:put name="calendar" --%>
				<div class="calendar">
					<p><%=month %><br /><%=day %></p>
				</div>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_heading" --%>
				<h2><a href="#"><u>Search Results</u></a></h2>
				<p class="description"></p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<script src = "${pageContext.request.contextPath}/search/ajax.js"></script>
				<div id = "id1">
				
					<table>
					<tr><th class="top"><u>Course</u></th><th class="top" scope="col"><u>Duration(In months)</u></th><th class="top" scope="col"><u>Fees</u></th></tr>
					
					<%
						java.util.ArrayList list = (java.util.ArrayList)request.getSession().getAttribute("courseList");	
						
						for(int i = 0;i<list.size();i++)
						{
							courseBean course = (courseBean)list.get(i);
							
							String name = course.getCoursename();
							int duration = course.getDuration();
							String fees = course.getFees();
							int courseid = course.getCourseid();
							String url = "course_description.jsp?courseid=" + courseid;
						%>
							<tr><th scope="row"><a href="" onclick = "javascript:jah1('<%=url %>','id2')"><%=name %></a></th><td><%= duration %></td><td><%= fees %></td></tr>	
						<%
						}	
						%>
				</table>
				
				
				</div>
				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			
			
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			
			<div id = "id2"></div>
			
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>