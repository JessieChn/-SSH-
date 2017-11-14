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
<%-- <s:property value="#session.filter_book"/> --%>
<s:form action="setFilter" method="post" namespace="/" theme="simple">
书名<s:textfield name="bookname_f" label="书名" value="%{#session.filter_book}"/>
图书类别<s:select name="booktype_f" list="#{'':'无','文学综合馆':'文学综合馆','童书馆':'童书馆','教育馆':'教育馆',
'人文社科馆':'人文社科馆','经管综合馆':'经管综合馆','励志综合馆':'励志综合馆','生活馆':'生活馆','艺术馆':'艺术馆',
'科技馆':'科技馆','计算机馆':'计算机馆','杂志期刊馆':'杂志期刊馆'}" value="%{#session.filter_type}"  label="图书类别"/>
作者地区<s:select name="bookwriterlocation_f" list="#{'':'无','中国':'中国','美国':'美国','欧印':'欧印','新马泰':'新马泰','非洲南美':'非洲南美'}" value="%{#session.filter_writerlocation}"  label="图书作者地域"/>
图书的出版社<s:select name="bookpress_f" list="#{'':'无','清华大学出版社':'清华大学出版社','人民邮电出版社':'人民邮电出版社','高等教育出版社':'高等教育出版社','电子工业出版社':'电子工业出版社'
,'西安电子科技大学出版社':'西安电子科技大学出版社'}" value="%{#session.filter_press}"  label="图书的出版社"/>
价钱：<s:textfield name="pricemin_f"  value="%{#session.filter_pricemin}"/>《
<s:textfield name="pricemax_f"  value="%{#session.filter_pricemax}"/>
<s:submit value="查询" />
</s:form>

<s:iterator value="books">
<table border="1">
<tr>
<td><s:property value="id"/></td>
<td><s:property value="name"/></td>
<td><s:property value="picture"/></td>
<td><s:property value="description"/></td>
<td><s:property value="price"/></td>
<td><s:property value="press"/></td>
<td><s:property value="writerLocation"/></td>
<td><s:property value="type"/></td>
<td><s:property value="writer"/></td>
<td><s:a href="./bookEdit?id=%{id}">修改</s:a></td>
<td><s:a href="./bookDelete?id=%{id}">删除</s:a></td>
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