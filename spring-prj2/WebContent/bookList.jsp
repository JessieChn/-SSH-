<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/lrtk.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.easydrag.handler.beta2.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.1.4.2.min.js"></script>
<script type="text/javascript" src="js/lrtk.js"></script>
<script type="text/javascript"></script>
<style>
table {

     border-collapse: collapse;

     font-family: Futura, Arial, sans-serif;
	 /*margin-left:100px;
*/


position:relative;
           right:0px;  
            top:0px;  
}



th,td {

     padding: .65em;

}

th,td {

     border-bottom: 1px solid #ddd;

   border-top: 1px solid #ddd;

   text-align: center;

}
tbody tr:hover {  
  
     background: linear-gradient(#fff,#aaa);  
  
     font-size: 17px;  
  
} 
</style>
<script type="text/javascript">
function getCookie(c_name)
{
	if (document.cookie.length>0)
	  {
	  c_start=document.cookie.indexOf(c_name + "=")
	  if (c_start!=-1)
	    { 
		  
	    c_start=c_start + c_name.length+1 
	    c_end=document.cookie.indexOf(";",c_start)
	    if (c_end==-1) c_end=document.cookie.length
	    return unescape(document.cookie.substring(c_start,c_end))
	    } 
	  }
	return ""
}

function setCookie(c_name,value,expiredays)
{
   var exdate=new Date();
   exdate.setTime(exdate.getTime()+60*1000);
   document.cookie=c_name+ "=" +escape(value)+
   ((expiredays==null) ? "" : "; expires="+exdate.toGMTString());
}

function checkCookie()
{
    shopcart=getCookie('shopcart')
    if (shopcart!=null && shopcart!=""){
    	//alert(shopcart);
        var tbody = document.getElementById("goods");  
        tbody.innerHTML = shopcart;
        sum();  
       }
    else 
       {
          shopcart=prompt('Please enter your shopcart:',"")
          if (shopcart!=null && shopcart!=""){
             setCookie('shopcart',shopcart,1)
          }
       }
}



function account(btn){
	var table = btn.parentNode.parentNode.parentNode.parentNode.parentNode;  
	var trs = table.getElementsByTagName("tr");  
	var myitem = new Array();
	var price;
	var number;
	var pricesum;
	var name;
	var index;
	var count=1;
	var total=0;
	var url2= "";
	var index2;
	var desc = "订单详细内容：";
	for(i=1;i<trs.length-1;i++){
	    var tds =  trs[i].getElementsByTagName("td");
	    for(j=0;j<tds.length-1;j++){
		if(j==0)
		{
		    name = tds[j].innerHTML;
		    url = tds[j].innerHTML;
		    index = url.indexOf(".jpg");
		    index2 = url.indexOf("images/");
		    url = url.substring(index2+7,index+4);
		    //alert(url);
			index = name.indexOf("<br>");
			name = name.substring(index+4);
			url2 = url2  +url +"|";
			//alert(url2);
			}
	    if(j==1) {price=tds[j].innerHTML; }
		if(j==3) {pricesum=tds[j].innerHTML; }
		}
		number = pricesum/price ;
		total = parseInt(total) + parseInt(pricesum);
		//alert(total); 
		desc = desc+ "第" +count + "个商品" +number+"*"+name+"(每个"+price+"元)="+pricesum+"元      ";
		//alert(desc);
		count++;

	}
	desc = desc + "共" +total +"元";
	desc = desc.replace(" ","")
	desc = desc.replace("\n","")
	//alert(desc);
	  document.forms["insertForm"].mc.value = desc + document.forms["insertForm"].mc.value ;
	  document.forms["insertForm"].mv.value = url2 + document.forms["insertForm"].mv.value ;
	  document.insertForm.submit();
	}







        function add_shoppingcart(btn){  
        	var tabvali = document.getElementById("goods");
        	//alert(tabvali.innerHTML);
        	
/*         	if(document.getElementsByName("book_id")!=null){
        	var tab = document.getElementsByName("book_id");
        	alert(tab.length);
        	for(var i=0;i<tab.length;i++){
        		alert(tab[i].innerHTML);
        		if(tab[i].innerHTML==)
        	}
        	} */
        	
            //获取按钮的爷爷  
            var li = btn.parentNode.parentNode.parentNode;  
            //获取li的所有孩子(lis)  
            var divs = li.getElementsByTagName("div");  
//           alert(divs.length); 
		   //var divs2 = divs[0].getElementsByTagName("div");  
		   //alert(divs2.length);
/* 		   alert(divs[0].className); 
		   alert(divs[1].className);
		   alert(divs[2].className);
		   alert(divs[3].className);
		   alert(divs[4].className);
		   alert(divs[5].className);  */
		   var divs2 = divs[0].getElementsByTagName("img");
//		   alert(divs2[0].className);     //图片
		   var url=  divs2[0].className;
		   var divs3 = divs[2].getElementsByTagName("p");
		   var divs5 = divs3[0].getElementsByTagName("span");
//		   alert(divs5[1].innerHTML);      //详细信息
           var bookid = divs5[2].innerHTML;
//           alert(divs5[2].innerHTML);    //书号
		   var detail = divs5[1].innerHTML;
		   var divs4 = divs[3].getElementsByTagName("span");
//		   alert(divs4[1].innerHTML);     //名称
		   var name = divs4[1].innerHTML;
		   
		   var p =divs[5].getElementsByTagName("p");
		    var p2 =       p[0].getElementsByTagName("span");
		    
 //          alert(p2[1].innerHTML);      //价格
		   var price = p2[1].innerHTML;
       	    if(document.getElementsByName("book_id")!=null){
        	var tab = document.getElementsByName("book_id");
        	//alert(tab.length);
        	for(var i=0;i<tab.length;i++){
        		//alert(tab[i].innerHTML);
        		if(tab[i].innerHTML==bookid){
        			//alert("已存在");
        			btnadd = document.getElementById("btn"+bookid);
        			//alert(btnadd.value);
        			increase(btnadd);
        			return;
        	    }
        	}
        	}
		               var newtr = document.createElement("tr");  
            newtr.innerHTML = '<td style="font:status-bar" width="50px"><img class="" src="images/'+url+'"/ width="50" height="50"><br /><span name="book_id">'+bookid+'</span></td>'+  
                            '<td>'+price+'</td><td align="center" style="width:50px">'+  
                            '<input type="button" value="-" onclick="decrease(this);"/> '+  
                            '<input type="button" size="3"  value="1"/> '+  
                            '<input id=btn'+bookid+' type="button" value="+" onclick="increase(this);"/>'+  
                            '</td>'+  
                            '<td>'+price+'</td>'+  
                            '<td align="center"  style="font:status-bar" width="150px">'+detail+'<input type="button" value="x" onclick="drop(this);"/></td>';//添加删除事件  
            var tbody = document.getElementById("goods");  
            tbody.appendChild(newtr);  
            sum();  
        }  
		
		
		
		        //加法 数量不能大于库存========================================  
        function increase(btn){  
            //获取按钮的父亲  
            var td2 = btn.parentNode;  
            //获取td2内的文本框  
            var text = td2.getElementsByTagName("input")[1];  
            //获取文本框内值+1后写回文本框  
            var amount = text.value;  
            text.value = ++amount;  
            //获取td2的哥哥td1,从中取出单价  
            var td1 = td2.parentNode.getElementsByTagName("td")[1];  
            var price = td1.innerHTML;  
            //计算金额  
            var mny = price*amount;  
            //获取td2的弟弟td3,将金额写回td3  
            var td3 = td2.parentNode.getElementsByTagName("td")[3];  
            td3.innerHTML = mny;  
            
            //更新cookie
            var tbody = document.getElementById("goods"); 

            setCookie('shopcart',tbody.innerHTML,1);
            shopcart=getCookie('shopcart');
            //alert(shopcart);
            sum();  
        }  
        //减法 数量不能小于1 =================================================  
        function decrease(btn){  
            //获取按钮的父亲td2  
            var td2 = btn.parentNode;  
            //获取td2的文本框  
            var text = td2.getElementsByTagName("input")[1];  
            //获取文本框的值-1写回文本框  
            var amount = text.value;  
            if(amount<=1){  
                drop(btn);
                text.value = 0; 
                
            }  
            if(amount>0){  
                text.value = --amount;  
            }  
            //获取td2的哥哥td1,从中取回单价  
            var td1 = td2.parentNode.getElementsByTagName("td")[1];  
            var price = td1.innerHTML;  
            //计算金额  
            var mny = price*amount;  
            //获取td2的弟弟td3,将金额写入td3  
            var td3 = td2.parentNode.getElementsByTagName("td")[3];  
            td3.innerHTML = mny;  
            //alert(tbody.innerHTML);
            
            
            //这里写更新cookie
            var tbody = document.getElementById("goods"); 
            //alert(tbody.innerHTML);
            setCookie('shopcart',tbody.innerHTML,1);
            //shopcart=getCookie('shopcart');
            //alert(shopcart);
            sum();  
        }  
        //删除tr行,而不是删除tr行中所有td====================  
        function drop(btn){  
            var tr = btn.parentNode.parentNode;  
            var tbody = document.getElementById("goods"); 
            
            tbody.removeChild(tr);  
            //alert(tbody.innerHTML);
          //这里写更新cookie
          setCookie('shopcart',tbody.innerHTML,1);
          
          
            sum();  
        }  
        //计算总金额  
        function sum() {  
            //获取购物车内所有的数据行  
            var tbody =   
                document.getElementById("goods");  
            var trs =   
                tbody.getElementsByTagName("tr");  
            //遍历这些行  
            var s = 0;  
            for(var i=0;i<trs.length;i++) {  
                //获取每一行下第4个td的内容(金额)  
                var mny =   
                    trs[i].getElementsByTagName("td")[3].innerHTML;  
                //累加  
                s += parseFloat(mny);  
            }  
            //将合计值写入合计列(id="total")  
            var td =   
                document.getElementById("total");  
            td.innerHTML = s;  
        }  
</script>
</head>
<body  onLoad="checkCookie()">
<div class="common">
<ul>
<li class="listbox">
      <div class="listimg"> <a href="" title="WordPress中文博客主题Truepixel"><img src="images/1.jpg"  alt="WordPress中文博客主题Truepixel" /></a>
        <div class="summary">
          <div class="summarytxt">
            <p><span>详细信息</span>：<span>成功的标配，配有独一无二的Aquadura密封表冠系统保护表冠（葡萄酒瓶的塞子永久不变形），50米防水。</span>书号<span>8</span>
          </div>
        </div>
      </div>
      <div class="listinfo">
        <div class="listtitle"><a href=""><strong>手表名称：</strong>劳力士黄金系列防水手表</a></div>
		<div class="listtag"><p><span class="STYLE1">劲爆价</span>：<span class="STYLE2">10086</span>元</p>
        	  <input type="button" value="加入购物车" style="height:50px; width:100px; color:#FF0000; background-color:#FFFF00; font-size:14px;" onClick="add_shoppingcart(this);">
	  <input type="button" value="立即购买" style="height:50px; width:100px; color:#FFFF00; background-color:#FF3300; font-size:14px;">
      </div>
</div>
</li>
<li class="listbox">
      <div class="listimg"> <a href="" title="WordPress中文博客主题Truepixel"><img src="images/1.jpg"  alt="WordPress中文博客主题Truepixel" /></a>
        <div class="summary">
          <div class="summarytxt">
            <p><span>详细信息</span>：<span>成功的标配，配有独一无二的Aquadura密封表冠系统保护表冠（葡萄酒瓶的塞子永久不变形），50米防水。</span>书号<span>5</span>
          </div>
        </div>
      </div>
      <div class="listinfo">
        <div class="listtitle"><a href=""><strong>手表名称：</strong>劳力士黄金系列防水手表</a></div>
		<div class="listtag"><p><span class="STYLE1">劲爆价</span>：<span class="STYLE2">10086</span>元</p>
        	  <input type="button" value="加入购物车" style="height:50px; width:100px; color:#FF0000; background-color:#FFFF00; font-size:14px;" onClick="add_shoppingcart(this);">
	  <input type="button" value="立即购买" style="height:50px; width:100px; color:#FFFF00; background-color:#FF3300; font-size:14px;">
      </div>
</div>
</li>
</ul>
</div>
	    <table>  
      <thead>  
        <tr>  
          <th>商品</th>  
          <th>单价(元)</th>  
          <th>数量</th>  
          <th>金额(元)</th>  
          <th>删除</th>  
        </tr>  
      </thead>  
      <tbody id="goods"> 

      </tbody>  
      <tfoot>  
        <tr>  
          <td colspan="3" align="right">总计</td>  
          <td id="total"></td>  
          <td>
          	  <form name="insertForm"  action="get.jsp">
	  <input type="hidden" name="mc" value="">
	  <input type="hidden" name="mv" value="">
	  <input  type="button" value="确认下单" style="height:35px; width:70px; color:#333333; background: linear-gradient(#fff,#aaa);   font-size:10px;" > 
	  </form> 
          
          
          
          
          </td>  
        </tr>  
      </tfoot>  
    </table>  
</body>
</html>