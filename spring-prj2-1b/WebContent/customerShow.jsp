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

<%-- <%
   ValueStack vs = (ValueStack)request.getAttribute("struts.valueStack"); //获得值栈对象
   List itemList = (List)vs.findValue("items");
%> --%>



<%-- <s:property value="#session.user"/>,您好！
<center>商品列表</center>
<table border=1>
<tr>
<th>编号</th>
<th>书名</th>
<th>说明</th>
<th>单价</th>
</tr> --%>



<%-- <% Iterator it = itemList.iterator();
   while(it.hasNext()){
	   Item item = (Item)it.next(); %>
<tr>
    <td><%= item.getItemID()%></td>
    <td><%= item.getName()  %></td>
    <td><%= item.getDescription()  %></td>
    <td><%= item.getCost()  %></td>
</tr>
<% } %> --%>
<table border=1>
<%--  <s:iterator value="lists.{?#this.customerId<10}"> --%>
<s:iterator value="lists">
<tr>
<td><s:property value="customerId"/></td>
<td><s:property value="account"/></td>
<td><s:property value="password"/></td>
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