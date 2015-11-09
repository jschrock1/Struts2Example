<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Hello World</title>
</head>
<body>

	<h4>Url Tags creates a URL that when clicked will call an action</h4>
	<s:url id="login" action="login" var="myurl">
		<s:param name="userId">scott</s:param>
		<s:param name="password">navy</s:param>
	</s:url>
	
		<a href='<s:property value="#myurl" escape="&amp;"/>'> <s:property value="#myurl" escape="&amp;"/></a>

</body>
</html>