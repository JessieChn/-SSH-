<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<s:property value="#session.filter_book"/>~~测试
<s:form action="setFilter" method="post" namespace="/">
<s:textfield name="bookname_f" label="书名" value="%{#session.filter_book}"/>/>
<s:submit value="注册" />
</s:form>

<s:iterator value="books">
<table border="1">
<tr>
<td><s:property value="id"/></td>
<td><s:property value="name"/></td>
</tr>
</table>
</s:iterator>
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
<a href="BookAction?page=1">第一页</a>
<a href="BookAction?page=<s:property value="%{curPage-1}"/>">上一页</a>
</s:else>
<s:if test="%{curPage!=sumPages}">
<a href="BookAction?page=<s:property value="%{curPage+1}"/>">下一页</a>
<a href="BookAction?page=<s:property value="%{sumPages}"/>">最后一页</a>
</s:if>
<s:else>
下一页 最后一页
</s:else>
</s:iterator>
</td>
</tr>
</table>

</body>
</html>