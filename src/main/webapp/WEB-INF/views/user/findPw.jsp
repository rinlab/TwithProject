<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<title>비밀번호 찾기</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<c:if test="${result == false}">
	<script>alert('아이디 혹은 이메일을 다시 확인해주세요.');</script>
</c:if>
<body class="is-preload">

	<!-- Header -->
	
	<header id="header" class="alt">
	
		<!-- Nav -->
		
		<nav id="nav" style="margin: 0 auto 2.3rem auto;">
			<ul>
				<li><a href="/user/index">Home</a></li>
				<li><a href="#" class="dropdown">My Menu</a>
					<ul>
						<c:if test="${!empty user}">
							<li><a href="/follow/following">FOLLOW</a></li>
							<li><a href="/user/mypage">MyPage</a></li>
						</c:if>
						<c:if test="${empty user}">
							<li><a href="/user/login">로그인을 해주세요</a></li>
						</c:if>
						<c:if test="${!empty user}">
							<li><a href="#">Sub Menu</a>
								<ul>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
								</ul>
							</li>
						</c:if>
					</ul>
				</li>
				<li><a href="#" class="dropdown">MOIM</a>
					<ul>
						<li><a href="/moim/make">CREATE MOIM</a></li>
						<li><a href="/moim/manage">MANAGE</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">Sub Menu</a>
							<ul>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li><a href="#" class="dropdown">COMMUNITY</a>
					<ul>
						<li><a href="/moim/recruitlist/0">일반 여행</a></li>
						<li><a href="/moim/recruitlist/1">카라반 여행</a></li>
						<li><a href="/moim/recruitlist/2">자전거 여행</a></li>
						<li><a href="#">Sub Menu</a>
							<ul>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li><a href="/shop/list">SHOP</a></li>
				<c:if test="${!empty user}">
					<li class="current"><a href="/user/logout">LOGOUT</a></li>
				</c:if>
				<c:if test="${empty user}">
					<li class="current"><a href="/user/login">LOGIN</a></li>
				</c:if>
			</ul>
		</nav>

		<!-- Logo -->
		
		<a class="logo" href="/user/index">
			<img src="/resources/images/mainLogo.png" width="10%" height="auto">
		</a>
		<h1 style="letter-spacing: -4px; font-size: 40px;">비밀번호 찾기</h1>
	</header>

	<!-- Main -->
	
	<div id="main">
		<div class="wrapper">
			<div class="inner">
				<form name="findPwform" action="/user/findPw" method="post"
					style="text-align: center;">
					<div id="container">
						<table style="margin: 0 0 2rem 0 !important;">
							<tr>
								<td>아이디</td>
								<td>
									<input class="put" type="text" name="userId" id="userId"
									placeholder="비밀번호를 찾고자 하는 아이디를 입력하세요" OnKeyDown="focusEnter(this.form,this)">
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>
									<input class="put" type="text" name="userEmail" id="userEmail"
									placeholder="가입시 입력하셨던 이메일을 입력하세요" OnKeyDown="findPwEnter();">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input style="width: 156px;" class="btn primary" type="button"
									value="비밀번호 찾기" onclick="findPw()">
								</td>
							</tr>
						</table>
						<div style="display: inline-block; text-align: center; width: 100%;">
							<input type="button" value="로그인으로" onclick="location.href='/user/login'">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Three -->
	
	<section id="newsletter">
		<div class="wrapper style2 special">
			<div class="inner">
				<header>
					<h2>Sapien mauris blandit?</h2>
					<p>Lorem ipsum dolor mauris, consectetur id ipsum sit amet
						lorem sed amet consequat.</p>
				</header>
				<form method="post" action="#" class="combined">
					<input type="email" name="email" id="email"
						placeholder="Your email address" class="invert" /> <input
						type="submit" class="special" value="Subscribe" />
				</form>
			</div>
		</div>
	</section>

	<!-- Footer -->
	
	<section id="footer">
		<div class="wrapper style3">
			<div class="inner">
				<div>
					<header>
						<h3>Ipsum sed tristique</h3>
					</header>
					<p>Nunc et lorem mauris, fringilla in aliquam at, euismod in
						habitant morbi tristique senectus amet malesuada commodo lorem
						ipsum dolor amet. Pellentesque leo mauris, consectetur id ipsum
						sit amet, fergiat. Pellentesque in mi massa.</p>
					<ul class="actions">
						<li><a href="#" class="button">Learn More</a></li>
					</ul>
				</div>
				<div>
					<header>
						<h3>Get in touch</h3>
					</header>
					<div class="contact-icons">
						<ul>
							<li><a href="#" class="icon solid fa-envelope"><span>information@untitled.tld</span></a></li>
							<li><a href="#" class="icon brands fa-twitter"><span>@untitled-tld</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span>facebook.com/untitled-tld</span></a></li>
							<li><a href="#" class="icon brands fa-linkedin-in"><span>linkedin.com/untitled-tld</span></a></li>
						</ul>
						<ul>
							<li><a href="#" class="icon solid fa-phone"><span>(000)
										000-0000</span></a></li>
							<li>
								<div class="icon solid fa-map-marker-alt">
									<address>
										Untitled Incorporated<br /> 1234 Fictional Avenue Suite 5432<br />
										Nashville, TN 00000-0000<br /> United States
									</address>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="copyright">&copy; Untitled Incorporated, All rights
				reserved. Lorem ipsum dolor sit amet nullam.</div>
		</div>
	</section>
</body>

<!-- Scripts -->

<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/assets/js/user.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function focusEnter(){
		var keycode = event.keyCode;        
        var i = 0;
   
        if( keycode == 13 ){
            for( i = 0; i < frm.length; ++i ){
	  	if( objName.name == frm[i].name )
                      break;
            }
            frm[++i].focus();
         }
	}
	
	function findPwEnter(){
	    if(event.keyCode == 13){
	    	findPw();
	    }
	}
	
	let frm = document.findPwform;
	let idTag = frm.userId;
	let emailTag = frm.userEmail;

	function findPw() {
		if (idTag.value == "" || idTag.value == null) {
			alert("아이디를 입력하세요!");
			idTag.focus();
			return false;
		}
		if (emailTag.value == "" || emailTag.value == null) {
			alert("이메일을 입력하세요!");
			emailTag.focus();
			return false;
		}
		frm.submit();
	}
</script>

</html>