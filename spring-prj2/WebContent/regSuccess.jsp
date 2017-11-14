<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.h1{font: 25px "方正兰亭超细黑简体";
    
}
</style>
</head>
<body>
<%-- <s:action name="getCustomerInfo1" namespace="/" executeResult="true"></s:action> --%>
<s:action name="PagingForUser" namespace="/" executeResult="true"></s:action>
</body>
</html>