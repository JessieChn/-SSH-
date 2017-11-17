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

function checkUser(){
    var reg = new RegExp("^[a-zA-Z][a-zA-Z0-9]{4,15}$");
    var flag = check("loginUser.account",reg,"accountspan","正确","错误");
    return flag;
}

function checkPassWord(){
    var reg = new RegExp("^[A-Za-z0-9]+$");
    var flag = check("loginUser.password",reg,"passwordspan","正确","错误");
    return flag;
}

function queding(){
	if(checkUser()==true&&checkPassWord()==true){
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
<style>
.td2 > div:hover {
  z-index: 1;
}

.td2 > div:hover > img {
  transform: scale(1.5, 1.5);
  transition: .3s transform;
}
</style>
</head>
<body>
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
    <div class="col-md-10 col-md-offset-1">
    <div class="col-md-offset-1">
    <s:form action="setFilter" method="post" namespace="/" theme="simple" cssClass="form-inline">
    <label>书名</label>
    <s:textfield cssClass="form-control" name="bookname_f" label="书名" value="%{#session.filter_book}"/>
    <label>图书类别</label>
    <s:select cssClass="form-control" 
              name="booktype_f" 
              list="#{'':'无',
                      '文学综合馆':'文学综合馆',
                      '童书馆':'童书馆',
                      '教育馆':'教育馆',
                      '人文社科馆':'人文社科馆',
                      '经管综合馆':'经管综合馆',
                      '励志综合馆':'励志综合馆',
                      '生活馆':'生活馆',
                      '艺术馆':'艺术馆',
                      '科技馆':'科技馆',
                      '计算机馆':'计算机馆',
                      '杂志期刊馆':'杂志期刊馆'}" 
              value="%{#session.filter_type}"  
              label="图书类别"/>
      <label>作者地区</label>
      <s:select cssClass="form-control" 
                name="bookwriterlocation_f" 
                list="#{'':'无',
                        '中国':'中国',
                        '美国':'美国',
                        '欧印':'欧印',
                        '新马泰':'新马泰',
                        '非洲南美':'非洲南美'}" 
                        value="%{#session.filter_writerlocation}"  label="图书作者地域"/>
    <label>出版社</label>
    <s:select cssClass="form-control" name="bookpress_f" 
              list="#{'':'无',
                      '清华大学出版社':'清华大学出版社',
                      '人民邮电出版社':'人民邮电出版社',
                      '高等教育出版社':'高等教育出版社',
                      '电子工业出版社':'电子工业出版社',
                      '西安电子科技大学出版社':'西安电子科技大学出版社'}" 
                      value="%{#session.filter_press}"  label="图书的出版社"/>
    <label>价钱</label>：
    <s:textfield name="pricemin_f" cssClass="form-control"  
    value="%{#session.filter_pricemin}"/>《
    <s:textfield name="pricemax_f" cssClass="form-control"  value="%{#session.filter_pricemax}"/>
    <s:submit value="查询" cssClass="btn btn-default"/>
    </s:form>
</div>
    
    
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th> ID </th>
          <th> 书名 </th>
          <th> 图片 </th>
          <th> 描述 </th>
          <th> 价钱 </th>
          <th> 出版社 </th>
          <th> 地域 </th>
          <th> 类型 </th>
          <th> 作者 </th>
          <th> 操作</th>
          
        </tr>
      </thead>
      <tbody>
    
<s:iterator value="books">
<tr>
<td><s:property value="id"/></td>
<td><s:property value="name"/></td>
<td class="td2"><div><img class="img-rounded" height="100px" width="100px"  src="images/<s:property value="picture"/>"></div></td>
<td><s:property value="description"/></td>
<td><s:property value="price"/></td>
<td><s:property value="press"/></td>
<td><s:property value="writerLocation"/></td>
<td><s:property value="type"/></td>
<td><s:property value="writer"/></td>
<td><s:a href="./bookEdit?id=%{id}">修改</s:a></td>
<td><s:a href="./bookDelete?id=%{id}">删除</s:a></td>
</tr>
</s:iterator>
      </tbody>
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
     <li><a href="BookAction?page=1">第一页</a></li>
      <li><a href="BookAction?page=<s:property value="%{curPage-1}"/>" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a></li>
     </s:else>
    </li>
    <li><a  class="btn btn-default disabled"><s:property value="curPage"/></a></li>
    <s:if test="%{curPage!=sumPages}">
        <li>
      <a href="BookAction?page=<s:property value="%{curPage+1}"/>" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    <li><a href="BookAction?page=<s:property value="%{sumPages}"/>">最后一页</a></li>
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