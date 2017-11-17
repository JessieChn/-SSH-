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
<s:if test="%{#session.loginedUserPer!=1}">
<%
    out.println("<script>");
	out.println("alert('非书城管理员查看用户信息！');");
	out.println("window.location.href='index.jsp'");
	out.println("</script>");
	 %>
</s:if>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
  <div class="col-md-10 col-md-offset-1">
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
	  	  <div class="dropdown">
  <button class="btn btn-default btn-lg dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
  <s:if test="%{#session.loginedUserId}">
    当前用户：<s:property value="#session.loginedUser"/>
    </s:if>
    <s:else>
    尚未登陆
    </s:else>
    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li><a href="#">Another action</a>
    
    </li>
    <li><a href="#">Another action</a></li>
    <li><a href="#">Something else here</a></li>
  </ul>
</div>
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
    <div class="col-md-12">

<s:form action="setFilter2" method="post" namespace="/" theme="simple" cssClass="form-inline">
<label>用户名</label><s:textfield cssClass="form-control"  name="account_f"  value="%{#session.account_s}"/>
<label>密码</label><s:textfield cssClass="form-control" name="password_f"  value="%{#session.password_s}"/>
<label>姓名</label><s:textfield cssClass="form-control" name="name_f"  value="%{#session.name_s}"/>
<label>手机号</label><s:textfield cssClass="form-control" name="phone_f"  value="%{#session.phone_s}"/>
<label>邮箱</label><s:textfield cssClass="form-control" name="email_f"  value="%{#session.email_s}"/>
<label>地址</label><s:textfield cssClass="form-control" name="address_f"  value="%{#session.address_s}"/>

<label>邮政编号</label><s:textfield cssClass="form-control" name="zipcode_f"  value="%{#session.zipcode_s}"/>
<label>传真号码</label><s:textfield cssClass="form-control" name="fax_f"  value="%{#session.fax_s}"/>
<s:submit value="查询" />
</s:form>




<%-- <s:property value="#session.user"/>,您好！ --%>
<table class="table table-striped table-hover">

     <thead>
        <tr>
          <th> ID </th>
          <th> 账号 </th>
          <th> 密码 </th>
          <th> 姓名 </th>
          <th> 性别 </th>
          <th> 生日 </th>
          <th> 手机 </th>
          <th> 邮箱 </th>
          <th> 地址 </th>
          <th> 邮政编号</th>
          <th> 传真</th>
          <th> 权限</th>
           <th> 操作</th>
          
        </tr>
      </thead>

<s:iterator value="customers">
<tr>
<td><s:property value="customerId"/></td>
<td><s:property value="account"/></td>
<td><s:property value="password"/></td>
<td>
<s:if test="%{sex==0}">女</s:if>
<s:if test="%{sex==1}">男</s:if>
</td>
<td><s:property value="name"/></td>
<td><s:property value="birthday"/></td>
<td><s:property value="phone"/></td>
<td><s:property value="email"/></td>
<td><s:property value="address"/></td>
<td><s:property value="zipcode"/></td>
<td><s:property value="fax"/></td>
<td><s:if test="%{permission==0}">普通用户</s:if>
<s:if test="%{permission==1}">书城管理员</s:if>
<s:if test="%{permission==2}">系统管理员</s:if></td>
<td><s:a href="./customerInforEdit?id=%{customerId}">修改</s:a></td>
<td><s:a href="./customerInforDelete?id=%{customerId}">删除</s:a></td>
</tr>
</s:iterator> 
</table>

    <div class="col-md-offset-5">
    <s:iterator value="pageBean">
<label>共<s:property value="allRowCounts"/>条记录
共<s:property value="sumPages"/>页</label>
<nav aria-label="Page navigation">

  <ul class="pagination">
    <li>
    <s:if test="%{curPage==1}">
         <li><a  class="btn btn-default disabled">第一页</a></li>
      <li><a aria-label="Previous" class="btn btn-default disabled">
        <span aria-hidden="true">&laquo;</span>
      </a></li>
     </s:if>
     <s:else>
     <li><a href="PagingForUser?page=1">第一页</a></li>
      <li><a href="PagingForUser?page=<s:property value="%{curPage-1}"/>" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a></li>
     </s:else>
    </li>
    <li><a  class="btn btn-default disabled"><s:property value="curPage"/></a></li>
    <s:if test="%{curPage!=sumPages}">
        <li>
      <a href="PagingForUser?page=<s:property value="%{curPage+1}"/>" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    <li><a href="PagingForUser?page=<s:property value="%{sumPages}"/>">最后一页</a></li>
</s:if>
<s:else>
         
      <li><a aria-label="next" class="btn btn-default disabled">
        <span aria-hidden="true">&raquo;</span>
      </a></li>
      <li><a  class="btn btn-default disabled">最后一页</a></li>
</s:else>
  </ul>
</nav>
</s:iterator>
</div>
</div>
</div>
</div>
</body>
</html>