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

<h1>修改图书信息</h1>
<h1>当前修改的图书ID：<s:property value="id"/></h1>
<s:form  action="bookUpdate" method="post" namespace="/">
<s:textfield style="display:none" name="book.id" value="%{id}"/>
<s:textfield name="book.name" label="请输入书名" value="%{name}"/>
<s:textfield name="book.description" label="请输入图书描述" value="%{description}"/>
 <s:textfield name="book.price"  label="请输入价钱" value="%{price}"/>
<s:textfield name="book.press" label="请输入出版社" value="%{press}"/>
<s:textfield name="book.writerLocation" label="请输入作者地区" value="%{writerLocation}"/>
<s:textfield name="book.type"  label="请输入图书类型" value="%{type}"/>
<s:textfield name="book.writer" label="请输入作者" value="%{writer}"/>
<s:submit value="注册" />
<s:reset value="重置" />
</s:form>
</s:iterator> 
</body>
</html>