<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap 101 Template</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<style>
.nav2 ul li{
    list-style: none;

}	
.nav2 a{
    text-decoration: none;

}


.nav2{
    width: 180px;	
    border-bottom: none;
	float:left;
}
.nav2 ul li{
    background: #eee;
    text-align: center;
    height: 150px;           /* height 和 line-height两个一起使用可以保证字在中间 */
    line-height:150px;          
    border-bottom: 1px solid #ccc;
    position: relative;
}

.nav2 ul li a{
    color: #333;
}
.nav2 ul li a:hover{
    color: #f00;
}


.nav2 ul li ul {
    position: absolute;
    left: 150px;
    top: 0px;
    width: 150px;
    border-bottom: none; 
    display:none;
}
.nav2 ul li:hover ul { 
    display:block;
    }

</style>
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

function queding(){
	if(checkUser()==true&&checkPassWord()==true){
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
.td2 > div:hover {
  z-index: 1;
}

.td2 > div:hover > img {
  transform: scale(1.5, 1.5);
  transition: .3s transform;
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
      <button type="button" class="btn btn-default btn-lg"  > <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 修改我的信息 </button>   
      </s:a>   
      <s:a href="./orderList?id=%{#session.loginedUserId}">
      <button type="button" class="btn btn-default btn-lg"  > <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 查看我的订单 </button>   
      </s:a>
      </s:if>
      <s:if test="%{#session.loginedUserPer==1}">
      <s:a href="./PagingForUser">
      <button type="button" class="btn btn-default btn-lg"  > <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 用户操作 </button>   
      </s:a> 
      <s:a href="./BookAction">
      <button type="button" class="btn btn-default btn-lg"  > <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 图书操作 </button>   
      </s:a> 
      <s:a href="./orderListAd">
      <button type="button" class="btn btn-default btn-lg"  > <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 查看所有订单 </button>   
      </s:a> 
      </s:if>
      <s:if test="%{#session.loginedUserPer==2}">
      <s:a href="./getLog">
      <button type="button" class="btn btn-default btn-lg"  > <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 日志查看 </button>  
      </s:a>
      <s:a href="./PagingForUser"> 
      <button type="button" class="btn btn-default btn-lg"  > <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 权限角色管理 </button>         
      </s:a>
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
<div class="container-fluid">
  <div class="row">
    <div class="span12">
      <div class="navbar"> </div>
    </div>
    <div class="col-md-10 col-md-offset-1">
    <div class="col-md-offset-1">

</div>
  
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th> 订单号 </th>
          <th> 订单商品图片集 </th>
          <th> 订单详细内容 </th>
          <th> 订单接收人 </th>
          <th> 接收人电话 </th>
          <th> 收货地址 </th>
          <th> 快递方式 </th>
          <th> 下单日期 </th>
          <th> 认证状态 </th>
          <th> 订单状态</th>
          <s:if test="%{#session.loginedUserPer==1}">
          <th>操作</th>
          </s:if>
        </tr>
      </thead>
      <tbody>
    
<s:iterator value="listo" id="object">
<tr>
<td><s:property value="#object[0]"/></td>
<td><s:generator val="#object[1]" separator="|" id="iter1">   
   </s:generator>
   <div class="nav2">
       <ul>
             <li>
   <s:iterator status="st" value="iter1" id="name">   




    
      <s:if test="#st.First">
      <a><img height="150px" width="150px"  src="images/<s:property value="name"/>"></a>
      </s:if>
        <ul>
        <s:if test="#st.First">
        </s:if>
        <s:else>
              <li><a><img height="150px" width="150px"  src="images/<s:property value="name"/>"></a></li>
        </s:else>
        </ul>

</s:iterator> 
        </li>
    </ul>
  </div>
</td>
<td class="col-md-3"><s:property value="#object[2]"/></td>
<td><s:property value="#object[3]"/></td>
<td><s:property value="#object[4]"/></td>
<td><s:property value="#object[5]"/></td>
<td><s:property value="#object[6]"/></td>
<td><s:property value="#object[7]"/></td>
<td>
<s:if test="%{#object[8]==0}">未审核</s:if>
<s:if test="%{#object[8]==1}">审核通过</s:if>
<s:if test="%{#object[8]==2}">审核不通过</s:if></td>
<td>
<s:if test="%{#object[9]==0}">待发送</s:if>
<s:if test="%{#object[9]==1}">正在发送</s:if>
<s:if test="%{#object[9]==2}">已签收</s:if>
</td>
<td>
<s:if test="%{#session.loginedUserPer==1}">
<s:if test="%{#object[8]==0}">
<a href="./orderVerify?id=<s:property value="#object[0]"/>&verify=1">
<button type="button" class="btn btn-default btn-warning"> 
<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>审核通过 </button>
</a>
<br>
<a href="./orderVerify?id=<s:property value="#object[0]"/>&verify=2">
<button type="button" class="btn btn-default btn-info"> 
<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>审核失败 </button>
</a>
</s:if>
<br>
<s:if test="%{#object[9]==0}">
<a href="./orderStatu?id=<s:property value="#object[0]"/>&statu=1">
<button type="button" class="btn btn-default btn-success"> 
<span class="glyphicon glyphicon-road" aria-hidden="true"></span>发送订单 </button>
</a>
</s:if>
<s:if test="%{#object[9]==1}">
<a href="./orderStatu?id=<s:property value="#object[0]"/>&statu=2">
<button type="button" class="btn btn-default btn-danger"> 
<span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>订单签收 </button>
</a>
</s:if>          
</s:if>
</td>
</tr>
</s:iterator>
      </tbody>
    </table>
    </div>
    </div>
    </div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">登陆</h4>
      </div>
      <div class="modal-body">
        <s:form action="login" method="post" namespace="/" theme="simple">
<label>请输入用户名</label><s:textfield placeholder="username" cssClass="form-control" name="loginUser.account" label="请输入用户名"  onBlur="checkUser()"/>
<s:label id="accountspan" value="匹配帐号是否合法(字母开头，允许5-16字节，允许字母数字)"></s:label><br>
<label>请输入密码</label><s:password placeholder="password" cssClass="form-control" name="loginUser.password" label="请输入密码" onBlur="checkPassWord()"/>
<s:label id="passwordspan" value="匹配数字和字母"></s:label><br>
<s:submit value="登陆"   cssClass="btn btn-primary"  onclick="return queding();" />
</s:form>
      </div>
    </div>
  </div>
  </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">登陆</h4>
      </div>
      <div class="modal-body">
        <s:form action="login" method="post" namespace="/" theme="simple">
<label>请输入用户名</label><s:textfield placeholder="username" cssClass="form-control" name="loginUser.account" label="请输入用户名"  onBlur="checkUser()"/>
<s:label id="accountspan" value="匹配帐号是否合法(字母开头，允许5-16字节，允许字母数字)"></s:label><br>
<label>请输入密码</label><s:password placeholder="password" cssClass="form-control" name="loginUser.password" label="请输入密码" onBlur="checkPassWord()"/>
<s:label id="passwordspan" value="匹配数字和字母"></s:label><br>
<s:submit value="登陆"   cssClass="btn btn-primary"  onclick="return queding();" />
</s:form>
      </div>
    </div>
  </div>
  </div>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>