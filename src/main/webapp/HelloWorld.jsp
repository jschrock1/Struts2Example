<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Hello World</title>
</head>
<body>


	<s:if test="testing=='basic'">
   Hello, <s:property value="name" />
		<br />
    Testing, <s:property value="testing" />
	</s:if>


	<s:if test="testing=='dumpSession'">
		<h4>Testing session, an internal list and Generator Tag</h4>
		Session user is: <s:property value="#session.user" />	<br />
	    Session test is: <s:property value="#session.test" />

		<br /><br />
		<s:select name="color" list="{'red','yellow','green'}" />

		<br />
		
		<h3>Example of Generator Tag</h3>
		<h3>The colours of rainbow:</h3>

		<s:generator
			val="%{'Violet,Indigo,Blue,
         Green,Yellow,Orange,Red '}"
			count="7" separator=",">
			<s:iterator>
				<s:property />
				<br />
			</s:iterator>
		</s:generator>
	</s:if>

</body>
</html>