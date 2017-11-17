<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
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

function checkBookName(){
    var reg = new RegExp("^.{1,12}$");
    var flag = check("book.name",reg,"namespan","正确","错误");
    return flag;
}

function checkBookDescription(){
    var reg = new RegExp("^.{1,55}$");
    var flag = check("book.description",reg,"descriptionspan","正确","错误");
    return flag;
}

function checkBookName(){
    var reg = new RegExp("^.{1,12}$");
    var flag = check("book.name",reg,"namespan","正确","错误");
    return flag;
}

function checkBookPrice(){
    var reg = new RegExp("^[0-9]{1,6}$");
    var flag = check("book.price",reg,"pricespan","正确","错误");
    return flag;
}

function checkBookWriter(){
    var reg = new RegExp("^.{1,10}$");
    var flag = check("book.writer",reg,"writerspan","正确","错误");
    return flag;
}

function queding(){
	if(checkBookName()==true&&checkBookDescription()==true&&
			checkBookName()==true&&checkBookPrice()==true&&checkBookWriter()()==true){
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
	out.println("alert('非书城管理员不能下单！');");
	out.println("window.location.href='index.jsp'");
	out.println("</script>");
	 %>
</s:if>
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
<h2>图书添加</h2>
<s:form cssClass="form-horizontal" action="bookAdd" method="post" namespace="/" enctype="multipart/form-data"  theme="simple">
  <div class="form-group">
    <label class="col-md-2 control-label">请输入书名</label>
    <div class="col-md-6">
      <s:textfield  cssClass="form-control"  name="book.name" label="请输入书名" onBlur="checkBookName()"/>
    </div>
    <s:label cssClass="col-md-4" id="namespan"  value="匹配书名是否合法(不为空且不超过12个字节)" ></s:label><br>
  </div>
  <div class="form-group">
    <label class="col-md-2 control-label">图书图片</label>
    <div class="col-md-6">
      <s:file cssClass="form-control"  name="upload" label="图书图片"/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-md-2 control-label">请输入图书的描述</label>
    <div class="col-md-6">
      <sx:textarea cssClass="form-control" rows="3" name="book.description"  label="请输入图书的描述"></sx:textarea>
    </div>
    <s:label id="descriptionspan" value="无任何要求"></s:label><br>
  </div>
  <div class="form-group">
    <label class="col-md-2 control-label">请输入图书的价钱</label>
    <div class="col-md-6">
      <s:textfield cssClass="form-control" name="book.price" label="请输入图书的价钱"  onBlur="checkBookPrice()"/>
    </div>
    <s:label id="pricespan" value="匹配书的价钱是否合法(1到6位且只为数字)"></s:label><br>
  </div>
  <div class="form-group">
    <label class="col-md-2 control-label">图书作者</label>
    <div class="col-md-6">
      <s:textfield cssClass="form-control" name="book.writer"  label="图书作者"  onBlur="checkBookWriter()"/>
    </div>
    <s:label id="writerspan" value="匹配书的作者是否合法(不为空且不超过10个字节)"></s:label><br>
  </div>
  <div class="form-group">
    <label class="col-md-2 control-label">图书的出版社</label>
    <div class="col-md-6">
      <s:select cssClass="form-control" name="book.press" 
                list="#{'清华大学出版社':'清华大学出版社',
                        '人民邮电出版社':'人民邮电出版社',
                        '高等教育出版社':'高等教育出版社',
                        '电子工业出版社':'电子工业出版社',
                        '西安电子科技大学出版社':'西安电子科技大学出版社'}" 
                        value="清华大学出版社"  label="图书的出版社"/>    
    </div>
  </div>
  <div class="form-group">
    <label class="col-md-2 control-label">图书作者地域</label>
    <div class="col-md-6">
      <s:select cssClass="form-control" name="book.writerLocation" 
                list="#{'中国':'中国','美国':'美国','欧印':'欧印','新马泰':'新马泰','非洲南美':'非洲南美'}" 
                value="中国"  
                label="图书作者地域"/>   
    </div>
  </div>
  <div class="form-group">
    <label class="col-md-2 control-label">图书类别</label>
    <div class="col-md-6">
      <s:select cssClass="form-control" name="book.type" 
                list="#{'文学综合馆':'文学综合馆',
                        '童书馆':'童书馆',
                        '教育馆':'教育馆',
                        '人文社科馆':'人文社科馆',
                        '经管综合馆':'经管综合馆',
                        '励志综合馆':'励志综合馆',
                        '生活馆':'生活馆',
                        '艺术馆':'艺术馆',
                        '科技馆':'科技馆',
                        '计算机馆':'计算机馆',
                        '杂志期刊馆':'杂志期刊馆'}" 
                value="计算机馆"  label="图书类别"/>  
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <s:submit value="确定添加" cssClass="btn btn-primary"   onclick="return queding();"/>
    </div>
  </div>
</s:form>
</div>
</div>
</div>

</body>
</html>