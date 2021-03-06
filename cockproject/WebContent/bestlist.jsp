<%@page import="java.util.ArrayList"%>
<%@page import="vo.BestVO"%>
<%@page import="dao.CockDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>이달의 추천 리스트</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">
html { background: url(photo/backweb.jpg) no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;}
@font-face{font-family : thefaceshop;src : url("fonts/THEFACESHOP INKLIPQUID.TTF");}		
@font-face{font-family : yeonsung; src : url("fonts/BMYEONSUNG_TTF.TTF");}


.all_menu_list{
	font-family: thefaceshop;
	font-size: 50px;
	text-align: center;	
	margin-top: 40px;
	margin-bottom : 20px;
	margin-left:200px;
	color:gold;
}	

a {text-decoration: None; color : black; }


#base_menu {
	padding-top: 200px;
}
.base_list{
	list-style-type: none;
	font-size: 25px;
	font-family: yeonsung;
}

.jb-table{display:table;
		border-spacing: 20px}
.jb-table-row{display:table-row;}
			
.jb-table-cell{display:table-cell; 
			text-align :left;
			vertical-align: middle;
			border-radius: 10px;
			background-color: rgba(112,48,160,0.4);
			width:430px;
			height:150px;
			}
			
.cock_img{
	width : 60px;
	height:auto;
	border-radius : 20px;
	border : solid 1px rgba(242,175,208,0.8) ;
	margin-left: 10px;
	margin-right : 5px;
	
}

input[type=submit]{
	margin-top : 20px;
	background-color: rgba(242,175,208,0.8);
	border : none;
	font-family: yeonsung;
	font-size: 20px;
	text-align: center;
	border-radius: 8px;
	width:100px;
}
.item{
	display:inline-block;
	font-family: thefaceshop;
	margin:5px;
	font-size : 20px;
	color:white;
	
}
.info{
	margin-bottom:15px;
}

.name{
	font-size: 18px;
	color:
}
input[type=checkbox]{
	position:relative;
	top:-35px;
}
.crown{
	width:30px;
	height:30px;
	padding-right:10px;
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

</head>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<body>
<div class=button>
	<a id="back" href="DeleteItemBasketToLogin"><img class=move src="photo/login.png"></a>
	<a id="basket" href="basket.jsp"><img class=move src="photo/shopping-basket.png"></a>
	<a id='back_button' href="everyList.jsp"> <img src="photo/menu.png" class=move></a>
</div>
<div class=container align="center">

	<p class=all_menu_list> BEST MENU LIST </p>
	<form action='BasketListToBest' method='post' name=cock_id>
		<%
		CockDAO dao = new CockDAO();
		ArrayList<BestVO> list = dao.getBestList();
		
		out.println("<div class='jb-table'>");
		
		int h;
		for (h=0;h<3;h++){
			out.println("<div class='jb-table-row'>");

				for(int i =(h*2); i <(h*2+2); i++){	
					BestVO vo = list.get(i);
					out.println("<div class=jb-table-cell>" 
								+"<div class='item total'>"
								+"<input type='checkbox' id='cock_id' name='cock_id' value='"+vo.getNum()+"'>"
								+"<div class='item img'>"
									+"<img src='photo/cocktail_image/"+vo.getNum()+".jpg' class='cock_img'>"
								+"</div>"
								+"<div class='item info'>"
									+ "<p class='itme info name'>"+"<img src='photo/crown.png' class=crown>"+"RANK : " +(i+1)+"</p>"
											+ vo.getName() +"<br>"
										+"ALCOHOL : " + vo.getAlcohol()+"<br>"
								+"</div>"
								+"</div></div>" );
					} // cell for end;
					
					out.println("</div>");
				
			} 
			out.println("</div>");
			
		%>
		
		<input class=add type=submit value='ADD'>
		</form>

</div>

</body>
</html>