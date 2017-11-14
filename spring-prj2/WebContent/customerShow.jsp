<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.opensymphony.xwork2.util.ValueStack,
    java.util.List,java.util.Iterator,cn.edu.zjut.po.Customer"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<s:form action="setFilter2" method="post" namespace="/" theme="simple">
用户名<s:textfield name="account_f"  value="%{#session.account_s}"/>
密码<s:textfield name="password_f"  value="%{#session.password_s}"/>
姓名<s:textfield name="name_f"  value="%{#session.name_s}"/>
手机号<s:textfield name="phone_f"  value="%{#session.phone_s}"/>
邮箱<s:textfield name="email_f"  value="%{#session.email_s}"/>
地址<s:textfield name="address_f"  value="%{#session.address_s}"/>

邮政编号<s:textfield name="zipcode_f"  value="%{#session.zipcode_s}"/>
传真号码<s:textfield name="fax_f"  value="%{#session.fax_s}"/>
<s:submit value="查询" />
</s:form>



<%-- <s:property value="#session.user"/>,您好！ --%>
<s:property value="#session.loginedUserId"/>
<s:property value="#session.loginedUser"/>
<s:property value="#session.loginedUserPer"/>
<s:if test="%{#session.loginedUserId}">
<s:a href="./loginOut">退出登录</s:a>
</s:if>
<table border=1>
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
<table border="1">
<tr>
<td>
<s:iterator value="pageBean">
共<s:property value="allRowCounts"/>条记录
共<s:property value="sumPages"/>页
当前第<s:property value="curPage"/>页
<s:if test="%{curPage==1}">
第一页 上一页
</s:if>
<s:else>
<a href="PagingForUser?page=1">第一页</a>
<a href="PagingForUser?page=<s:property value="%{curPage-1}"/>">上一页</a>
</s:else>
<s:if test="%{curPage!=sumPages}">
<a href="PagingForUser?page=<s:property value="%{curPage+1}"/>">下一页</a>
<a href="PagingForUser?page=<s:property value="%{sumPages}"/>">最后一页</a>
</s:if>
<s:else>
下一页 最后一页
</s:else>
</s:iterator>
</td>
</tr>
</table>

<%-- 价格低于20元的商品有：<br>
<s:iterator value="items.{?#this.cost<20}">
<li><s:property value="name"/>：
    <s:property value="cost"/>元</li>
<p>
名称为《Java EE技术实验指导教程》的商品的价格为：
<s:property value="items.{?#this.name=='Java EE技术试验指导教程'}.{cost}[0]"/>元
</p>
<s:url value="items.{name}[0]"/><br>
<s:url value="%{items.{name}[0]}"/>
</s:iterator> --%>
</body>
</html>