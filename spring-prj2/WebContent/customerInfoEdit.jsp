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
<script>
function check(name,reg,spanname,okinfor,errorinfor)
{
    var flag;
	var val=document.getElementsByName(name)[0].value;
	var spanname2=document.getElementById(spanname);
	if(reg.test(val)){
	spanname2.innerHTML = okinfor;
	flag=true;
	}
	else{
	spanname2.innerHTML = errorinfor;
	flag = false;
	}
	return flag;
}






function checkUser(){
    var reg = new RegExp("^[a-zA-Z][a-zA-Z0-9]{4,15}$");
    var flag = check("loginUser.account",reg,"accountspan","正确","错误");
    return flag;
}

function checkPassWord(){
    var reg = new RegExp("^[A-Za-z0-9]+$");
    var flag = check("loginUser.password",reg,"passwordspan","正确","错误");
    return flag;
}

function checkTrueName(){
    var reg = new RegExp("[\u4e00-\u9fa5]");
    var flag = check("loginUser.name",reg,"namespan","正确","错误");
    return flag;
}

function checkPhoneNumber(){
    var reg = new RegExp("13[0-9]{9}");
    var flag = check("loginUser.phone",reg,"phonespan","正确","错误");
    return flag;
}

function address(){
	var span = document.getElementById("addressspan")
	span.innerHTML = "正确";
}

function checkEmail(){
    var reg = new RegExp("^\\w+@\\w+(\\.\\w{2,3})*\\.\\w{2,3}$");
    var flag = check("loginUser.email",reg,"emailspan","正确","错误");
    return flag;
}

function checkZipcode(){
    var reg = new RegExp("^[1-9][0-9]{5}$");
    var flag = check("loginUser.zipcode",reg,"zipcodespan","正确","错误");
    return flag;
}
function checkFax(){
    var reg = new RegExp("[0-9]{7,8}");
    var flag = check("loginUser.fax",reg,"faxspan","正确","错误");
    return flag;
}
function queding(){
	if(checkUser()==true&&checkPassWord()==true&&
			checkTrueName()==true&&checkZipcode()==true&&checkFax()==true&&
			checkPhoneNumber()==true&&checkEmail()==true){
		alert("格式正确！");
		return true;
	}
	else 
		{
		alert("格式错误！打回重写");
		return false;
		}
}
</script>
</head>
<body>
<s:if test="%{#session.loginedUserPer!=1}">
<%
    out.println("<script>");
	out.println("alert('非书城管理员不能修改用户信息！');");
	out.println("window.location.href='regSuccess.jsp'");
	out.println("</script>");
	 %>
</s:if>
 <s:iterator value="lists">

<s:property value="customerId"/>
<s:property value="account"/>
<h1>修改用户信息</h1>
<h1>当前修改的用户ID：<s:property value="customerId"/></h1>
<s:form  action="customerInforUpdate" method="post" namespace="/"  theme="simple">
请输入用户名<s:textfield name="loginUser.account" label="请输入用户名"  onBlur="checkUser()"  value="%{account}"/>
<s:label id="accountspan" value="匹配帐号是否合法(字母开头，允许5-16字节，允许字母数字)"></s:label><br>
请输入密码<s:password name="loginUser.password" label="请输入密码" onBlur="checkPassWord()"  value="%{password}"/>
<s:label id="passwordspan" value="匹配数字和字母"></s:label><br>
 请输入姓名<s:textfield name="loginUser.name"  label="请输入姓名"	onBlur="checkTrueName()"  value="%{name}"/>
 <s:label id="namespan" value="匹配汉字"></s:label><br>
请输入性别<s:radio name="loginUser.sex" list="#{1:'男',0:'女'}" value="%{sex}"  label="请输入性别"/><br>
请输入日期<sx:datetimepicker name="loginUser.birthday" label="请输入日期" displayFormat="yyyy-MM-dd" value="%{birthday}"/><br>
请输入手机<s:textfield name="loginUser.phone" label="请输入手机" onBlur="checkPhoneNumber()" value="%{phone}"/>
<s:label id="phonespan" value="匹配手机号 如13538628500"></s:label><br>
请输入邮件<s:textfield name="loginUser.email" label="请输入邮件" onBlur="checkEmail()"  value="%{email}"/>
<s:label id="emailspan" value="匹配邮箱 如183398897@qq.com"></s:label><br>
请输入地址<s:textfield name="loginUser.address"  label="请输入地址" onBlur="address()"  value="%{address}"/>
<s:label id="addressspan" value="任意 可以为空"></s:label><br>
请输入邮政编码<s:textfield name="loginUser.zipcode" label="请输入邮政编码" onBlur="checkZipcode()"  value="%{zipcode}"/>
<s:label id="zipcodespan" value="邮政编码的验证（开头不能为0，共6位）"></s:label><br>
请输入传真地址<s:textfield name="loginUser.fax"  label="请输入传真地址" onBlur="checkFax()" value="%{fax}"/>
<s:label id="faxspan" value="0到9 7位数字以上"></s:label><br>
<s:submit value="注册"  onclick="return queding();" /><br>
<s:reset value="重置" /><br>
</s:form>
</s:iterator> 
</body>
</html>