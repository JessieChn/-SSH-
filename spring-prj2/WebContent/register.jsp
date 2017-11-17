<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <s:head theme="xhtml"/> 
    <sx:head parseContent="true"/>    
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap 101 Template</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" charset="utf-8">
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
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
  <div class="col-md-12">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="#">Bootstrap theme</a> </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#contact">Contact</a></li>
      </ul>
      
      <div class="pull-right">
      <s:if test="%{#session.loginedUserId}">
      <a href="./loginOut">
      <button type="button" class="btn btn-default btn-lg"  data-toggle="modal" data-target="#myModal"> <span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>LogOut </button>
      </a>
      </s:if>
      <s:else>
      <button type="button" class="btn btn-default btn-lg"  data-toggle="modal" data-target="#myModal"> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> User </button>
      </s:else>
      </div>
      <div class="pull-right">
        <button type="button" class="btn btn-default btn-lg"> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> User </button>
      </div>
    </div>
  </div>
  </div>
</nav>
<div class="container">
  <div class="row">
    <div class="span12">
      <div class="navbar"> </div>
    </div>
    <div class="col-md-12">

<s:form cssClass="form-horizontal" action="register" method="post" namespace="/" theme="simple">
  <h2>注册</h2>
 <div class="form-group">
    <label class="col-md-2 control-label">请输入用户名</label>
    <div class="col-md-6">
      <s:textfield cssClass="form-control" name="loginUser.account" label="请输入用户名"  onBlur="checkUser()"/>    </div>
    <s:label id="accountspan" value="匹配帐号是否合法(字母开头，允许5-16字节，允许字母数字)"></s:label>  
    </div>

 <div class="form-group">
    <label class="col-md-2 control-label">请输入密码</label>
    <div class="col-md-6">
      <s:password cssClass="form-control" name="loginUser.password" label="请输入密码" onBlur="checkPassWord()"/>    
      </div>
   <s:label id="passwordspan" value="匹配数字和字母"></s:label> 
    </div>

 <div class="form-group">
    <label class="col-md-2 control-label"> 请输入姓名</label>
    <div class="col-md-6">
      <s:textfield cssClass="form-control" name="loginUser.name"  label="请输入姓名"	onBlur="checkTrueName()"/>   
      </div>
   <s:label id="namespan" value="匹配汉字"></s:label>
    </div>
    
     <div class="form-group">
    <label class="col-md-2 control-label"> 请输入性别</label>
    <div class="col-md-1">
      <s:radio  name="loginUser.sex" list="#{1:'男',0:'女'}" value="0"  label="请输入性别"/> 
      </div>
    </div>

    <div class="form-group">
    <label class="col-md-2 control-label"> 请输入日期</label>
    <div class="col-md-6">
    <sx:datetimepicker cssClass="form-control" name="loginUser.birthday" label="请输入日期" displayFormat="yyyy-MM-dd" value="%{'2010-01-01'}"/>
    </div>
    </div>
    
         <div class="form-group">
    <label class="col-md-2 control-label"> 请输入手机</label>
    <div class="col-md-6">
     <s:textfield cssClass="form-control" name="loginUser.phone" label="请输入手机" onBlur="checkPhoneNumber()"/>
      </div>
      <s:label id="phonespan" value="匹配手机号 如13538628500"></s:label><br>
    </div>

         <div class="form-group">
    <label class="col-md-2 control-label"> 请输入邮件</label>
    <div class="col-md-6">
     <s:textfield cssClass="form-control" name="loginUser.email" label="请输入邮件" onBlur="checkEmail()"/>
      </div>
      <s:label id="emailspan" value="匹配邮箱 如183398897@qq.com"></s:label><br>
    </div>
    
     <div class="form-group">
    <label class="col-md-2 control-label"> 请输入地址</label>
    <div class="col-md-6">
     <s:textfield cssClass="form-control" name="loginUser.address"  label="请输入地址" onBlur="address()"/>
      </div>
      <s:label id="addressspan" value="任意 可以为空"></s:label><br>
    </div>

    <div class="form-group">
    <label class="col-md-2 control-label"> 请输入邮政编码</label>
    <div class="col-md-6">
     <s:textfield cssClass="form-control" name="loginUser.zipcode" label="请输入邮政编码" onBlur="checkZipcode()"/>
      </div>
      <s:label id="zipcodespan" value="邮政编码的验证（开头不能为0，共6位）"></s:label><br>
    </div>
    
        <div class="form-group">
    <label class="col-md-2 control-label">请输入传真地址</label>
    <div class="col-md-6">
     <s:textfield cssClass="form-control" name="loginUser.fax"  label="请输入传真地址" onBlur="checkFax()"/>
      </div>
      <s:label id="faxspan" value="0到9 7位数字以上"></s:label><br>
    </div>
    
    <div class="form-group">
    <div class="col-md-6 col-md-offset-2">
     <s:submit value="注册"   cssClass="btn btn-primary"  onclick="return queding();" />
     </div>
     </div></s:form>
      </div>
    </div>
   
</div>
</div>
</div>
</body>
</html>