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

	<h4>Testing login - actioin login.</h4>
	<s:form action="login" method="post">
		<s:textfield label="Please enter your name." value="scott"
			key="userId" theme="xhtml" />
		<s:textfield label="Please enter your Password." value="navy"
			key="password" theme="xhtml" />
		<s:submit value="Login"></s:submit>
	</s:form>

	<h4>Testing hello - action hello.</h4>
	<s:form action="hello">
		<s:textfield label="Please enter your name. Jay will return success"
			key="name" />
		<s:submit></s:submit>
	</s:form>

	<h4>Tutorial Finder. Uses dummy action to display a different jsp
		with no java action code running - dummy action is searchForm</h4>
	<s:form action="searchForm" method="post">
		<s:submit value="Find Tutorials"></s:submit>
	</s:form>
	<br />

	<h4>Testing file upload - action is upload.</h4>
	<s:form action="upload" method="post" enctype="multipart/form-data">
		<s:file label="Upload your file." key="myFile" />
		<s:submit value="Upload"></s:submit>
	</s:form>

	<h4>Testing servletTest - action is servletTest.</h4>
	<s:form action="servletTest">
		<s:textfield label="click to look at servlet stuff" key="name" />
		<s:submit></s:submit>
	</s:form>


	<h4>The form below uses Google's SMTP server - action is emailer.
	</h4>
	<s:form action="emailer" method="post">
		<s:textfield label="From" value="jay.schrock@gmail.com" key="from" />
		<s:textfield label="To" value="jay.schrock@gmail.com" key="to" />
		<s:textfield label="Password" value="EJohn969" key="password" />
		<s:textfield label="Subject" value="My Test Subject" key="subject" />
		<s:textfield label="Body" value="My Test Body" key="body" />
		<s:submit></s:submit>
	</s:form>


	<h4>Testing Validation age must be 28 to 65 - action is empinfo</h4>
	<s:form action="empinfo" method="post">
		<s:textfield name="name" label="Name" size="20" />
		<s:textfield name="age" label="Age" size="20" />
		<s:submit name="submit" label="Submit" align="right" />
	</s:form>


	<h4>Testing Validation with xml file rather than validate method -
		action is empinfo2.</h4>
	<s:form action="empinfo2" method="post">
		<s:textfield name="name" label="Name" size="20" />
		<s:textfield name="age" label="Age" size="20" />
		<s:submit name="submit" label="Submit" align="right" />
	</s:form>


	<h4>Login with use of method getModel in action class - action is
		login2.</h4>
	<h4>This demonstrates how conversion is done with objects</h4>
	<s:form action="login2" method="post">
		<s:textfield label="Login ID" key="userId" value="userId" />
		<s:password label="Password" key="password" />
		<s:submit></s:submit>
	</s:form>


	<h4>Login3 with my own interceptor class - action is login3.</h4>
	<s:form action="login3" method="post">
		<s:textfield label="Please enter your name." value="scott"
			key="userId" />
		<s:textfield label="Please enter your Password." value="navy"
			key="password" />
		<s:submit value="Login"></s:submit>
	</s:form>

	<h4>
		<s:text name="global.heading" />
	</h4>

	<s:url id="indexEN" namespace="/" action="locale">
		<s:param name="request_locale">en</s:param>
	</s:url>
	<s:url id="indexES" namespace="/" action="locale">
		<s:param name="request_locale">es</s:param>
	</s:url>
	<s:url id="indexFR" namespace="/" action="locale">
		<s:param name="request_locale">fr</s:param>
	</s:url>

	<s:a href="%{indexEN}">English</s:a>
	<s:a href="%{indexES}">Spanish</s:a>
	<s:a href="%{indexFR}">France</s:a>

	<s:form action="empinfo" method="post" namespace="/">
		<s:textfield name="name" key="global.name" size="20" />
		<s:textfield name="age" key="global.age" size="20" />
		<s:submit name="submit" key="global.submit" />
	</s:form>

	<h4>eException handling, This demonstrates how conversion is done
		with objects</h4>
	<s:form action="helloException" method="post">
		<s:submit></s:submit>
	</s:form>

	<h4>Testing struts 2 list, collection, merging and appending of
		lists.</h4>
	<s:form action="employee" method="post">
		<s:submit></s:submit>
	</s:form>

	<h4>Testing internal generated list using generate tag.</h4>
	<s:form action="hello2" method="post">
		<s:submit></s:submit>
	</s:form>

	<br />

	<h4>Testing action tag process, use action directoy in jsp.</h4>
	<s:form action="testActoinTag" method="post">
		<s:submit></s:submit>
	</s:form>

	<br />

	<h4>An example of the include and param tags: this jsp includes
		the counter.jsp</h4>
	<s:include value="counter.jsp" />

	<br />

	<h4>propert tag</h4>
	<s:form action="system" method="post">
		<s:submit></s:submit>
	</s:form>

</body>
</html>