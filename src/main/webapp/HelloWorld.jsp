<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>Hello World</title>
</head>
<body>
   Hello World, <s:property value="name"/>
   <br/>
   Testing session: <s:property value="#session.user.name"/>
      <br/>
   Testing session again: <s:property value="#session.login"/>
      <br/>
    <s:select name="color" list="{'red','yellow','green'}" />
</body>
</html>