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
<s:form action="bookAdd" method="post" namespace="/">
<s:textfield name="book.name" label="请输入书名"/>
<s:textfield name="book.description"  label="请输入图书的描述"	/>
<s:textfield name="book.price" label="请输入图书的价钱"/>
<s:textfield name="book.press" label="请输入图书的出版社"/>
<s:textfield name="book.writerLocation"  label="图书的作者地域"/>
<s:textfield name="book.type" label="图书类别"/>
<s:textfield name="book.writer"  label="图书作者"/>
<s:submit value="注册" />
<s:reset value="重置" />
</s:form>


</body>
</html>