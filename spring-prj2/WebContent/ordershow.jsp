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
<s:property value="order.phoneNumber"/>
<s:property value="order.orderPicSet"/>
<s:property value="order.orderDescription"/>
<s:property value="order.receiverName"/>
<s:property value="order.address"/>
<s:property value="order.customer.customerId"/>
<br>
<s:form  action="orderAdd" method="post" namespace="/"  theme="simple">
收货人手机号<s:textfield name="order.phoneNumber"  value="%{order.phoneNumber}"/><br>
订单图片集<s:textfield name="order.orderPicSet"   value="%{order.orderPicSet}"/><br>
订单描述<s:textfield name="order.orderDescription"  value="%{order.orderDescription}"/><br>
收货人姓名<s:textfield name="order.receiverName"  value="%{order.receiverName}"/><br>
收货地址<s:textfield name="order.address"   value="%{order.address}"/><br>
顾客的ID<s:textfield name="order.customer.customerId"   value="%{order.customer.customerId}"/><br>

<s:submit value="注册" /><br>
<s:reset value="重置" /><br>
</s:form>

</body>
</html>