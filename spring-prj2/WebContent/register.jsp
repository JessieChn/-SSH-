<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<sx:head/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<s:form action="register" method="post" namespace="/">
<s:textfield name="loginUser.account" label="请输入用户名"/>
<s:textfield name="loginUser.password" label="请输入密码"/>
 <s:textfield name="loginUser.name"  label="请输入姓名"	/>
<s:radio name="loginUser.sex" list="#{1:'男',0:'女'}" value="0"  label="请输入性别"/>
   <sx:datetimepicker name="loginUser.birthday" label="请输入日期" displayFormat="yyyy-MM-dd" value="%{'2010-01-01'}"/>
<s:textfield name="loginUser.phone" label="请输入手机"/>
<s:textfield name="loginUser.email" label="请输入邮件"/>
<s:textfield name="loginUser.address"  label="请输入地址"/>
<s:textfield name="loginUser.zipcode" label="请输入邮政编码"/>
<s:textfield name="loginUser.fax"  label="请输入传真地址"/>
<s:submit value="注册" />
<s:reset value="重置" />
</s:form>


</body>
</html>