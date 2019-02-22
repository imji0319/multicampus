<%@page import="vo.BasketVO"%>
<%@page import="vo.CocktailVO"%>
<%@page import="dao.CockDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BASKET ADD</title>
<style>

html { background: url(photo/backweb.jpg) no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;}
@font-face{font-family : thefaceshop;src : url("fonts/THEFACESHOP INKLIPQUID.TTF");}		
@font-face{font-family : yeonsung; src : url("fonts/BMYEONSUNG_TTF.TTF");}

.ordertable{
	display:table;
	margin:auto;
	border-spacing: 5px;
	padding-top: 20px;
}
.ordertable_row{
	display:table-row;
}

.row{
	display:table-row;
}

.th_cell{
	display:table-cell;
	width : 80px;
	font-family :thefaceshop;
	font-size : 20px;
}

.ordertable_cell{
	font-family :thefaceshop;
	display:table-cell; 
	vertical-align: middle;
	border-radius: 10px;
	background-color: rgba(112,48,160,0.4);
	font-size : 30px;
	height : 100px;
	width : 500px;
	}
	
.cell{
	display:table-cell;
	vertical-align: middle;
	font-family :thefaceshop;
	font-size : 30px;
}
.count{
	width:40px;
	background-color:rgba()
}

#order{
	margin-top : 10px;
}

#orderpage{
	margin:auto;
	border-radius : 20px;
	margin-top:20px;
	padding-bottom:20px;
	width:70%;
	text-align: center;
	background-color: rgba(209,143,208,0.5);
}

input[type=button]{
	margin-top : 20px;
	background-color: rgba(242,175,208,0.8);
	border : none;
	font-family: yeonsung;
	font-size: 20px;
	text-align: center;
	border-radius: 8px;
	width : 100px;
	margin-bottom: 20px;
}

.basket{
	font-family :thefaceshop;
	text-align: center;
	padding-top:20px;
	margin-bottom :10px;
	font-size: 50px;
	color:white;
	margin-left: 200px;
}

.delete{
	padding-left:10px;
	width:50px;
	height:auto;
}


	.button{
		float:right;
		margin-right:30px;
		margin-top:20px;
	}
	
	#back{
		display:inline-block;
		padding-left:10px;
	}
	
	#basket{
		display:inline-block;
	}
	
	.back_button{
		display:inline-block;
	}

	.move{
		width:40px;
		height:auto;
	}



</style>

<script src='jquery-3.3.1.min.js'></script>

<script type='text/javascript'>

</script>
</head>
<body>
<%
CockDAO dao = new CockDAO(); 
ArrayList<BasketVO> list = dao.getBasketList();

ArrayList<CocktailVO> cocklist = new ArrayList<CocktailVO>();
	
%>
<div class=button>
	<a id="back" href="DeleteItemBasketToLogin"><img class=move src="photo/login.png"></a>
	<a id="basket" href="basket.jsp"><img class=move src="photo/shopping-basket.png"></a>
	<a id='back_button' href="everyList.jsp"> <img src="photo/menu.png" class=move></a>
</div>

<p class=basket>BASKET </p>
<div id=orderpage>	
	<div class=ordertable>
	<div class='row'>
		<div class='th_cell'> 주문 리스트 </div>
		<div class='th_cell'> 주문 개수 </div>
		<div class='th_cell'> </div>
	</div>

	<%
	for (int i=0;i<list.size();i++){
		out.println("<div class='ordertable_row'>");
		out.println("<div class='ordertable_cell'>");
			
		BasketVO vo = list.get(i);
		
		CocktailVO cockvo = dao.getBasketList(vo.getCock_id());
	
		cocklist.add(cockvo);
		out.println(cockvo.getCock_name()+"</div>");
		out.println("<div class='cell count'>" + vo.getCount()+"</div>");
		out.println("<div class='cell'> <form method='get' action='DeleteItemBasket'>"
						+"<input type=hidden name='cock_id' value="+ vo.getCock_id()+">"
						+"<input type=image src='photo/del.png' class='delete'>"
					+"</form></div>");
		
		out.println("</div>");
	}
	
	
	%>

</div>

	<form id=order>
		<input type=button onclick="location.href='BasketOrder';" class='confirm order' value=ORDER>
		<input type=button onclick="location.href='BasketListReset';" class='reset order' value=RESET>
	</form>

</div>

</body>

</html>