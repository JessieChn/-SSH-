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
 <s:iterator value="lists">

<s:property value="customerId"/>
<s:property value="account"/>
<h1>修改用户信息</h1>
<h1>当前修改的用户ID：<s:property value="customerId"/></h1>
<s:form  action="customerInforUpdate" method="post" namespace="/">
<s:textfield style="display:none" name="loginUser.customerId" value="%{customerId}"/>
<s:textfield name="loginUser.account" label="请输入用户名" value="%{account}"/>
<s:textfield name="loginUser.password" label="请输入密码" value="%{password}"/>
 <s:textfield name="loginUser.name"  label="请输入姓名" value="%{name}"/>
<s:radio name="loginUser.sex" list="#{1:'男',0:'女'}" value="%{sex}"  label="请输入性别"/>
<sx:datetimepicker name="loginUser.birthday" label="请输入日期" displayFormat="yyyy-MM-dd" value="%{birthday}"/>
<s:textfield name="loginUser.phone" label="请输入手机" value="%{phone}"/>
<s:textfield name="loginUser.email" label="请输入邮件" value="%{email}"/>
<s:textfield name="loginUser.address"  label="请输入地址" value="%{address}"/>
<s:textfield name="loginUser.zipcode" label="请输入邮政编码" value="%{zipcode}"/>
<s:textfield name="loginUser.fax"  label="请输入传真地址" value="%{fax}"/>
<s:submit value="注册" />
<s:reset value="重置" />
</s:form>
</s:iterator> 
</body>
</html>