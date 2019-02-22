<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FinishOrder</title>
<style>

html { background: url(photo/backweb.jpg) no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;}

@font-face{font-family : thefaceshop;src : url("fonts/THEFACESHOP INKLIPQUID.TTF");		}

	h3{ font-family: thefaceshop; font-size:40px; color:white;}

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
	
	#finally{
	text-align: center;
	margin:auto;
	background-color: rgba(242,175,208,0.5);
	width:70%;
	border-radius: 10px;
	vertical-align: middle;
	margin-top:200px;
	}
	
	.hidden{
		height:200px;
	}

</style>

</head>
<body>
<div class=button>
	<a id="back" href="DeleteItemBasketToLogin"><img class=move src="photo/login.png"></a>
	<a id="basket" href="basket.jsp"><img class=move src="photo/shopping-basket.png"></a>
	<a id='back_button' href="everyList.jsp"> <img src="photo/menu.png" class=move></a>
</div>	
<div class=hidden>
</div>
<div id=finally>
	<h3>주문이 완료 되었습니다.<br>감사합니다.</h3>
</div>

</body>
</html>