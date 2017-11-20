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
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th> ID </th>
          <th> 描述 </th>
          <th> 时间 </th>

          
        </tr>
      </thead>
      <tbody>
    
<s:iterator value="listl">
<tr>
<td class="col-md-2"><s:property value="logId"/></td>
<td class="col-md-3"><s:property value="submitTime"/></td>
<td><s:property value="description"/></td>
</tr>
</s:iterator>
      </tbody>
    </table>
 
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