<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
<title>Hello World</title>
<s:head />
<sx:head />
</head>
<body>
   <s:form>
      <sx:autocompleter label="Favourite Colour"
         list="{'red','green','blue'}" />
      <br />
      
   </s:form>
</body>
</html>