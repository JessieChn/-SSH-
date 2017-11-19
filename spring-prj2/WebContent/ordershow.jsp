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



function checkTrueName(){
    var reg = new RegExp("[\u4e00-\u9fa5]");
    var flag = check("order.receiverName",reg,"namespan","正确","错误");
    return flag;
}

function checkPhoneNumber(){
    var reg = new RegExp("13[0-9]{9}");
    var flag = check("order.phoneNumber",reg,"phonenumberspan","正确","错误");
    return flag;
}

function address(){
	var reg = new RegExp("^.{1,250}$");
    var flag = check("order.address",reg,"orderspan","正确","错误");
    return flag;
}
function queding(){
	if(checkTrueName()==true&&
       checkPhoneNumber()==true){
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
<style>
#navigation ul {padding:0px;}
#navigation ul li{height:45px;
width:150px;
list-style:none;
float:left;
}
#navigation ul li a{color:#000000;
width:150px;
margin:0px;
padding:0px 0px 0px 0px;
text-decoration:none;
display:block;
border: 2px solid #555555;
}

#navigation ul li ul li{height:150px;     //竖直的格式
font:0.9em Arial, Helvetica, sans-serif;}
#navigation ul li ul li a{background:#999999;
}
#navigation ul li a:hover{
background:#CCCCCC;
border-bottom:1px dashed #FF0000;}
#navigation ul li ul{visibility:hidden;}
#navigation ul li:hover ul{visibility:visible;}
#navigation ul li ul li a:hover{background:#666666;}



#navigation{
clear:both;
z-index:1;
position:relative; 
}
#nav-img {
float:left ;
margin:-60px 0px 0px 0px;
}

#nav-img2 {
float:left ;
margin:0px 0px 0px 0px;
}

</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
  <div class="col-md-10 col-md-offset-1">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="#">书子网</a> </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li><a href="#">首页</a></li>
        <li><a href="#">关于我们</a></li>
        <li><a href="#">联系方式</a></li>
      </ul>
      
      <div class="pull-right">
      <s:if test="%{#session.loginedUserId}">    
      <s:if test="%{#session.loginedUserPer==0}">  
      <s:a href="./customerInforEdit?id=%{#session.loginedUserId}">
      <button type="button" class="btn btn-default btn-lg"  > <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 修改当前用户信息 </button>   
      </s:a>   
      <button type="button" class="btn btn-default btn-lg"  > <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 修改当前用户订单 </button>   
      </s:if>
      <s:if test="%{#session.loginedUserPer==1}">
      <s:a href="./PagingForUser">
      <button type="button" class="btn btn-default btn-lg"  > <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 用户操作 </button>   
      </s:a> 
      <s:a href="./BookAction">
      <button type="button" class="btn btn-default btn-lg"  > <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 图书操作 </button>   
      </s:a> 
      <button type="button" class="btn btn-default btn-lg"  > <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 查看所有订单 </button>   
      
      </s:if>
      <s:if test="%{#session.loginedUserPer==2}">
      <button type="button" class="btn btn-default btn-lg"  > <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 日志查看 </button>   
      <button type="button" class="btn btn-default btn-lg"  > <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 权限角色管理 </button>         
      </s:if>
      <a href="./loginOut">
      <button type="button" class="btn btn-default btn-lg"> <span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>LogOut </button>
      </a> 
      </s:if>
      <s:else>
      
      <button type="button" class="btn btn-default btn-lg"  data-toggle="modal" data-target="#myModal"> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 登陆 </button>
      
      </s:else>
      </div>
      <div class="pull-right">   
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
<%-- <s:property value="order.phoneNumber"/>
<s:property value="order.orderPicSet"/>
<s:property value="order.orderDescription"/>
<s:property value="order.receiverName"/>

<s:property value="order.customer.customerId"/> --%>
<br>
<s:form cssClass="form-horizontal" action="orderAdd" method="post" namespace="/"  theme="simple">

  <h2>订单确认</h2>
  <div class="form-group">
    <label class="col-md-2 control-label">收货人手机号</label>
    <div class="col-md-6">
      <s:textfield onBlur="checkPhoneNumber()" cssClass="form-control" name="order.phoneNumber"  value="%{order.phoneNumber}"/>
    </div>    
    <s:label id="phonenumberspan" value="匹配手机号"></s:label>
  </div>
  
 <div class="form-group" style="margin-top:70px"> 
   <label class="col-md-2 control-label">订单图片集</label>  
   <div class="col-md-6">
  <div id=navigation>
    <ul>
      <li> 
        <s:iterator value="listP" var="p" status="st">
        <s:if test="#st.First">
        <div id=nav-img><img height="150px" width="150px"  src="images/<s:property value="p"/>"></div>
        </s:if>
        </s:iterator> 
        
        <ul>
        <s:iterator value="listP" var="p" status="st">  
        <s:if test="#st.First">
        </s:if>
        <s:else>
        <li><div id=nav-img2><img height="150px" width="150px"  src="images/<s:property value="p"/>"></li>
        </s:else>
        </s:iterator> 
        </ul>
      </li>
    </ul>
</div>
</div>
</div>

  <%--   <s:property value="p"/><br>  --%> 
  <div class="form-group" style="display:none">
    <label class="col-md-2 control-label">订单图片集</label>
    <div class="col-md-6">
      <s:textfield cssClass="form-control" name="order.orderPicSet"   value="%{order.orderPicSet}"/>
    </div>    
  </div>
  <div class="form-group" style="margin-top:70px">
    <label class="col-md-2 control-label">收货人姓名</label>
    <div class="col-md-6">
      <s:textfield  cssClass="form-control" name="order.receiverName"  value="%{order.receiverName}" onBlur="checkTrueName()"/>
    </div>    
    <s:label id="namespan" value="匹配汉字"></s:label>
  </div>
  <div class="form-group">
    <label class="col-md-2 control-label">收货地址</label>
    <div class="col-md-6">
      <s:textfield cssClass="form-control" name="order.address"   value="%{order.address}" onBlur="address()"/>
    </div> 
     <s:label id="addressspan" value="不为空且不超过200个字节"></s:label>
  </div>
  
  <div class="form-group">
    <label class="col-md-2 control-label">订单描述</label>
    <div class="col-md-6">
      <sx:textarea onfocus="this.blur()"  cssClass="form-control" rows="10" name="order.orderDescription"  value="%{order.orderDescription}" ></sx:textarea>
    </div>    
    <label>无法修改</label>
  </div>
  
  <s:textfield style="display:none" name="order.customer.customerId"   value="%{order.customer.customerId}"/><br>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <s:submit  value="订单确定" cssClass="btn btn-primary"   onclick="return queding();"/>
    </div>
  </div>
</s:form>
</div>
</div>
</div>


</body>
</html>