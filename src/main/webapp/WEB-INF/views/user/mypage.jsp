<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="kor">
<head>
<title>TWith</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<body class="is-preload">

	<!-- Header -->
	
	<header id="header" class="alt">
	
		<!-- Nav -->
		
		<nav id="nav" style="margin: 0 auto 2.3rem auto;">
			<ul>
				<li><a href="/user/index">Home</a></li>
				<li class="current"><a href="#" class="dropdown">My Menu</a>
					<ul>
						<c:if test="${!empty user}">
							<li>
								<a href="/follow/following">FOLLOW</a>
							</li>
							<li>
								<a href="/user/mypage">MyPage</a>
							</li>
						</c:if>
						<c:if test="${empty user}">
							<li>
								<a href="/user/login">로그인을 해주세요</a>
							</li>
						</c:if>
						<c:if test="${!empty user}">
							<li>
								<a href="#">Sub Menu</a>
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
					<li><a href="/user/logout">LOGOUT</a></li>
				</c:if>
				<c:if test="${empty user}">
					<li><a href="/user/login">LOGIN</a></li>
				</c:if>
			</ul>
		</nav>

		<!-- Logo -->
		
		<a class="logo" href="/user/index">
			<img src="/resources/images/mainLogo.png" width="10%" height="auto">
		</a>
		<h1>My Page</h1>
	</header>

	<!-- Main -->
	
	<div id="main">
		<div class="wrapper">
			<div class="inner">
				<section>
					<ul class="actions fit">
						<li>
							<a href="/user/myInfoModify" class="button primary fit">내정보 수정</a>
						</li>
						<li>
							<a href="/follow/follower" class="button fit">내 여행 보기</a>
						</li>
						<li>
							<a href="/follow/search" class="button primary fit">캘린더 보기</a>
						</li>
					</ul>
				</section>
				<section>
					<ul class="actions fit">
						<li>
							<a href="/follow/search" class="button fit">내가 쓴 게시물</a>
						</li>
						<li>
							<a href="/follow/search" class="button primary fit">나의	FAQ</a>
						</li>
						<li>
							<a href="/follow/search" class="button fit">회원 탈퇴</a>
						</li>
					</ul>
				</section>
			</div>
		</div>
	</div>

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
						<li>
							<a href="#" class="button">Learn More</a>
						</li>
					</ul>
				</div>
				<div>
					<header>
						<h3>Get in touch</h3>
					</header>
					<div class="contact-icons">
						<ul>
							<li>
								<a href="#" class="icon solid fa-envelope"><span>information@untitled.tld</span></a>
							</li>
							<li>
								<a href="#" class="icon brands fa-twitter"><span>@untitled-tld</span></a>
							</li>
							<li>
								<a href="#" class="icon brands fa-facebook-f"><span>facebook.com/untitled-tld</span></a>
							</li>
							<li>
								<a href="#" class="icon brands fa-linkedin-in"><span>linkedin.com/untitled-tld</span></a>
							</li>
						</ul>
						<ul>
							<li>
								<a href="#" class="icon solid fa-phone"><span>(000)000-0000</span></a>
							</li>
							<li>
								<div class="icon solid fa-map-marker-alt">
									<address>
										Untitled Incorporated<br />
										1234 Fictional Avenue Suite 5432<br />
										Nashville, TN 00000-0000<br />
										United States
									</address>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="copyright">&copy; Untitled Incorporated, All rights
				reserved. Lorem ipsum dolor sit amet nullam.
			</div>
		</div>
	</section>

	<!-- Scripts -->
	
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>

</body>
</html>