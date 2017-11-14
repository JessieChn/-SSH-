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

function checkBookName(){
    var reg = new RegExp("^.{1,12}$");
    var flag = check("book.name",reg,"namespan","正确","错误");
    return flag;
}

function checkBookDescription(){
    var reg = new RegExp("^.{1,55}$");
    var flag = check("book.description",reg,"descriptionspan","正确","错误");
    return flag;
}

function checkBookName(){
    var reg = new RegExp("^.{1,12}$");
    var flag = check("book.name",reg,"namespan","正确","错误");
    return flag;
}

function checkBookPrice(){
    var reg = new RegExp("^[0-9]{1,6}$");
    var flag = check("book.price",reg,"pricespan","正确","错误");
    return flag;
}

function checkBookWriter(){
    var reg = new RegExp("^.{1,10}$");
    var flag = check("book.writer",reg,"writerspan","正确","错误");
    return flag;
}

function queding(){
	if(checkBookName()==true&&checkBookDescription()==true&&
			checkBookName()==true&&checkBookPrice()==true&&checkBookWriter()()==true){
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
</head>
<body>
<s:if test="%{#session.loginedUserPer!=1}">
<%
    out.println("<script>");
	out.println("alert('非书城管理员不能下单！');");
	out.println("window.location.href='index.jsp'");
	out.println("</script>");
	 %>
</s:if>
<s:form action="bookAdd" method="post" namespace="/" enctype="multipart/form-data"  theme="simple">
请输入书名<s:textfield name="book.name" label="请输入书名" onBlur="checkBookName()"/>
<s:label id="namespan" value="匹配书名是否合法(不为空且不超过12个字节)" ></s:label><br>
图书图片<s:file  name="upload" label="图书图片"/>  <br>
请输入图书的描述<s:textfield name="book.description"  label="请输入图书的描述"  onBlur="checkBookDescription()"/>
<s:label id="descriptionspan" value="匹配书名是否合法(不为空且不超过55个字节)"></s:label><br>
请输入图书的价钱<s:textfield name="book.price" label="请输入图书的价钱"  onBlur="checkBookPrice()"/>
<s:label id="pricespan" value="匹配书的价钱是否合法(1到6位且只为数字)"></s:label><br>
图书作者<s:textfield name="book.writer"  label="图书作者"  onBlur="checkBookWriter()"/>
<s:label id="writerspan" value="匹配书的作者是否合法(不为空且不超过10个字节)"></s:label><br>
图书的出版社<s:select name="book.press" list="#{'清华大学出版社':'清华大学出版社','人民邮电出版社':'人民邮电出版社','高等教育出版社':'高等教育出版社','电子工业出版社':'电子工业出版社'
,'西安电子科技大学出版社':'西安电子科技大学出版社'}" value="清华大学出版社"  label="图书的出版社"/><br>
图书作者地域<s:select name="book.writerLocation" list="#{'中国':'中国','美国':'美国','欧印':'欧印','新马泰':'新马泰','非洲南美':'非洲南美'}" value="中国"  label="图书作者地域"/><br>
图书类别<s:select name="book.type" list="#{'文学综合馆':'文学综合馆','童书馆':'童书馆','教育馆':'教育馆',
'人文社科馆':'人文社科馆','经管综合馆':'经管综合馆','励志综合馆':'励志综合馆','生活馆':'生活馆','艺术馆':'艺术馆',
'科技馆':'科技馆','计算机馆':'计算机馆','杂志期刊馆':'杂志期刊馆'}" value="计算机馆"  label="图书类别"/><br>
<s:submit value="注册"  onclick="return queding();" />
<s:reset value="重置" />
</s:form>


</body>
</html>