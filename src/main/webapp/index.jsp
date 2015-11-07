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

	<h4>Basic helloWorld .</h4>
	<s:form action="hello">
		<s:textfield label="Please enter your name." key="name" value="Jay" />
		<s:textfield label="test type" key="testing" value="basic" />
		<s:submit></s:submit>
	</s:form>

	<h4>Basic login Connects to MySQL Database.</h4>
	<s:form action="login" method="post">
		<s:textfield label="Please enter your name." value="scott"
			key="userId" theme="xhtml" />
		<s:textfield label="Please enter your Password." value="navy"
			key="password" theme="xhtml" />
		<s:submit value="Login"></s:submit>
	</s:form>

	<h4>Login using getModel in action class</h4>
	<s:form action="login2" method="post">
		<s:textfield label="Login ID" key="userId" value="Jay" />
		<s:password label="Password" key="password" value="pass12345" />
		<s:submit></s:submit>
	</s:form>

	<h4>Login using my own interceptor class.</h4>
	<s:form action="login3" method="post">
		<s:textfield label="Please enter your name." value="scott"
			key="userId" />
		<s:textfield label="Please enter your Password." value="navy"
			key="password" />
		<s:submit value="Login"></s:submit>
	</s:form>

	<h4>Display session, an internal list and Generator Tag .</h4>
	<s:form action="hello1">
		<s:textfield label="Please enter your name." key="name" value="Jay" />
		<s:textfield label="test type" key="testing" value="dumpSession" />
		<s:submit></s:submit>
	</s:form>

	<h4>Dummy action, displays jsp with no java action getting called</h4>
	<s:form action="searchForm" method="post">
		<s:submit value="Find Tutorials"></s:submit>
	</s:form>
	<br />

	<h4>Upload a file.</h4>
	<s:form action="upload" method="post" enctype="multipart/form-data">
		<s:file label="Upload your file." key="myFile" />
		<s:submit value="Upload"></s:submit>
	</s:form>

	<h4>Send an Email.</h4>
	<s:form action="emailer" method="post">
		<s:textfield label="From" value="jay.schrock@gmail.com" key="from" />
		<s:textfield label="To" value="jay.schrock@gmail.com" key="to" />
		<s:textfield label="Password" value="EJohn969" key="password" />
		<s:textfield label="Subject" value="My Test Subject" key="subject" />
		<s:textfield label="Body" value="My Test Body" key="body" />
		<s:submit></s:submit>
	</s:form>


	<h4>Validation age must be 28 to 65 - action is empinfo</h4>
	<s:form action="empinfo" method="post">
		<s:textfield name="name" label="Name" size="20" />
		<s:textfield name="age" label="Age" size="20" />
		<s:submit name="submit" label="Submit" align="right" />
	</s:form>


	<h4>Validation with xml file rather than validate method - action
		is empinfo2.</h4>
	<h4>Does NOT work yet, validation file not picked up.</h4>
	<s:form action="empinfo2" method="post">
		<s:textfield name="name" label="Name" size="20" />
		<s:textfield name="age" label="Age" size="20" />
		<s:submit name="submit" label="Submit" align="right" />
	</s:form>


	<h4>
		<s:text
			name="global.heading, property files need to be under resources" />
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

	<h4>Struts 2 list, collection, merging and appending of lists.</h4>
	<s:form action="employee" method="post">
		<s:submit></s:submit>
	</s:form>

	<br />

	<h4>Action tag call action directly from jsp page.</h4>
	<s:form action="testActoinTag" method="post">
		<s:submit></s:submit>
	</s:form>

	<br />

	<h4>Include tag, bean tag and param tags</h4>
	<s:include value="counter.jsp" />

	<h4>property tag, set, push and property usage</h4>
	<s:form action="system" method="post">
		<s:submit></s:submit>
	</s:form>

	<h4>Date Tags</h4>
	<s:form action="helloDate" method="post">
		<s:submit></s:submit>
	</s:form>

	<h4>Text Tags Uses HelloText.properties</h4>
	<s:form action="helloText" method="post">
		<s:submit></s:submit>
	</s:form>

	<h4>Url Tags creates a URL that when clicked will call an action</h4>
	<s:url id="login" action="login" var="myurl">
		<s:param name="userId">scott</s:param>
		<s:param name="password">navy</s:param>
	</s:url>

	<a href='<s:property value="#myurl"/>'> <s:property value="#myurl" /></a>

	<h4>Ui tags</h4>

	<s:div>Email Form</s:div>
	<s:text name="Please fill in the form below:" />
	<s:form action="hello" method="post" enctype="multipart/form-data">
		<s:hidden name="secret" value="abracadabra" />
		<s:textfield key="email.from" name="from" />
		<s:password key="email.password" name="password" />
		<s:textfield key="email.to" name="to" />
		<s:textfield key="email.subject" name="subject" />
		<s:textarea key="email.body" name="email.body" />
		<s:label for="attachment" value="Attachment" />
		<s:file name="attachment" accept="text/html,text/plain" />
		<s:token />
		<!--   -->s:submit key="submit" / -->
	</s:form>


	<h4>Group Ui tags</h4>
	<s:form action="hello.action">
		<s:radio label="Gender" name="gender" list="{'male','female'}" />
		<s:checkboxlist label="Hobbies" name="hobbies"
			list="{'sports','tv','shopping'}" />
	</s:form>
	
	<h4>Example Ui tags</h4>
	 <s:form action="login.action">
      <s:select name="username" label="Username"
         list="{'Mike','John','Smith'}" />

      <s:select label="Company Office" name="mySelection"
         value="%{'America'}"
         list="%{#{'America':'America'}}">
      <s:optgroup label="Asia" 
         list="%{#{'India':'India','China':'China'}}" />
      <s:optgroup label="Europe"
         list="%{#{'UK':'UK','Sweden':'Sweden','Italy':'Italy'}}" />
      </s:select>

      <s:combobox label="My Sign" name="mySign"
         list="#{'aries':'ariesy','capricorn':'capricornyy'}"
         headerKey="-1" 
         headerValue="--- Please Select ---" emptyOption="true"
         value="capricorn" />
      <s:doubleselect label="Occupation" name="occupation"
         list="{'Technical','Other'}" doubleName="occupations2"
         doubleList="top == 'Technical' ? 
         {'I.T', 'Hardware'} : {'Accounting', 'H.R'}" />

   </s:form>

</body>
</html>