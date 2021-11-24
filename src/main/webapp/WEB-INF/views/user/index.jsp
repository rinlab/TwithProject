<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="kor">
<head>
<title>TWith</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<c:if test="${msg == true}">
	<script>alert('${user.userId}님 환영합니다 :)');</script>
</c:if>
<c:if test="${!empty result}">
	<script>alert('회원가입을 환영합니다. 로그인을 해주세요 :)');</script>
</c:if>
<body class="is-preload">

	<!-- Header -->
	
	<header id="header">

		<!-- Nav -->
		
		<nav id="nav" style="margin: 0 auto 2.3rem auto;">
			<ul>
				<li class="current"><a href="/user/index">Home</a></li>
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
					<li><a href="/user/logout">LOGOUT</a></li>
				</c:if>
				<c:if test="${empty user}">
					<li><a href="/user/login">LOGIN</a></li>
				</c:if>
			</ul>
		</nav>

		<!-- Logo -->
		
		<a class="logo" href="/user/index"> <img
			src="/resources/images/mainLogo.png" width="35%" height="auto">
		</a>
	</header>

	<!-- Banner -->
	
	<section id="banner">
		<article class="full">
			<div class="image" data-position="center">
				<img src="/resources/images/mainBanner.jpg"
					style="height: auto; width: 100%;" alt="" />
			</div>
			<div class="content">
				<h1 class="alt">
					<a href="#">Sed dignissim feugiat lorem ipsum nullam et
						veroeros</a>
				</h1>
				<h2 class="alt">Magna lorem tempus consequat</h2>
				<ul class="actions">
					<li><a href="#" class="button">자세히 보기</a></li>
				</ul>
			</div>
		</article>
		<article class="half">
			<div class="image" data-position="center">
				<img src="/resources/images/pic02.jpg" alt="" />
			</div>
			<div class="content">
				<h2 class="alt">
					<a href="#">Consequat aliquam lorem ipsum dolor sit amet</a>
				</h2>
				<ul class="actions">
					<li><a href="#" class="button">Learn More</a></li>
				</ul>
			</div>
		</article>
		<article class="half">
			<div class="image" data-position="center">
				<img src="/resources/images/pic03.jpg" alt="" />
			</div>
			<div class="content">
				<h2 class="alt">
					<a href="#">Malesuada et amet tempus nisl adipiscing lorem</a>
				</h2>
				<ul class="actions">
					<li><a href="#" class="button">Learn More</a></li>
				</ul>
			</div>
		</article>
	</section>

	<!-- One -->
	
	<section id="one">
		<div class="wrapper">
			<div class="posts inner">
				<div>
					<article>
						<h2>Sed lorem ipsum dolor amet feugiat et lorem ipsum nulla
							veroeros tempus magna</h2>
						<p>Aenean ornare velit lacus varius enim ullamcorper interdum
							congue. Lorem ipsum dolor amet nullam sed etiam veroeros
							consequat. Curabitur sapien risus, commodo eget turpis convallis.</p>
						<p>Pellentesque leo mauris, consectetur id ipsum sit amet,
							fergiat. Pellentesque in mi amet massa lacinia egestas sapien
							risus, commodo. Mauris risus lacus, blandit sit amet venenatis
							non, bibendum vitae dolor. et netus et malesuada fames ac turpis
							egestas. Sed non lorem sit amet elit placerat maximus aliquam
							maximus risus. Donec eget ex magna. Interdum et malesuada fames
							lorem ipsum dolor.</p>
						<p>Donec eget ex magna. Interdum et malesuada fames ac ante
							ipsum primis in faucibus. Pellentesque lorem venenatis dolor
							imperdiet dolor mattis amet sagittis. Praesent rutrum sem diam,
							vitae egestas dolor enim auctor sit amet. Pellentesque leo
							mauris.</p>
						<ul class="actions">
							<li><a href="#" class="button">Learn More</a></li>
						</ul>
					</article>
				</div>
				<div>
					<article>
						<a class="image fit" href="#"><img
							src="/resources/images/pic04.jpg" alt="" /></a>
						<h3>Etiam consequat veroeros</h3>
						<p>Nunc et lorem mauris, fringilla in aliquam at, euismod in
							habitant morbi tristique senectus amet malesuada commodo lorem
							ipsum dolor amet.</p>
						<ul class="actions">
							<li><a href="#" class="button">Learn More</a></li>
						</ul>
					</article>
					<article>
						<a class="image fit" href="#"><img
							src="/resources/images/pic05.jpg" alt="" /></a>
						<h3>Phasellus vitae lorem</h3>
						<p>Nunc et lorem mauris, fringilla in aliquam at, euismod in
							habitant morbi tristique senectus amet malesuada commodo lorem
							ipsum dolor amet.</p>
						<ul class="actions">
							<li><a href="#" class="button">Learn More</a></li>
						</ul>
					</article>
				</div>
				<div>
					<article>
						<a class="image fit" href="#"><img
							src="/resources/images/pic06.jpg" alt="" /></a>
						<h3>Imperdiet auctor mattis</h3>
						<p>Nunc et lorem mauris, fringilla in aliquam at, euismod in
							habitant morbi tristique senectus amet malesuada commodo lorem
							ipsum dolor amet.</p>
						<ul class="actions">
							<li><a href="#" class="button">Learn More</a></li>
						</ul>
					</article>
					<article>
						<a class="image fit" href="#"><img
							src="/resources/images/pic07.jpg" alt="" /></a>
						<h3>Magna donec faucibus</h3>
						<p>Nunc et lorem mauris, fringilla in aliquam at, euismod in
							habitant morbi tristique senectus amet malesuada commodo lorem
							ipsum dolor amet.</p>
						<ul class="actions">
							<li><a href="#" class="button">Learn More</a></li>
						</ul>
					</article>
				</div>
			</div>
		</div>
	</section>

	<!-- Two -->
	
	<section id="two">
		<div class="wrapper style1">
			<div class="carousel">
				<article>
					<a class="image" href="#" data-position="center"><img
						src="/resources/images/pic08.jpg" alt="" /></a>
					<div class="content">
						<h2>Sed lorem ipsum dolor</h2>
						<p>Pellentesque leo mauris, consectetur id ipsum sit amet,
							fergiat. Pellentesque in mi amet massa lacinia egestas sapien
							risus mauris et risus lacus, blandit sit amet venenatis non,
							vitae dolor. et netus sed fames ac turpis egestas. Sed non lorem
							sit amet elit placerat.</p>
						<ul class="actions">
							<li><a href="#" class="button">Learn More</a></li>
						</ul>
					</div>
				</article>
				<article>
					<a class="image" href="#" data-position="center"><img
						src="/resources/images/pic09.jpg" alt="" /></a>
					<div class="content">
						<h2>Aliquam amet ipsum dolor</h2>
						<p>Pellentesque leo mauris, consectetur id ipsum sit amet,
							fergiat. Pellentesque in mi amet massa lacinia egestas sapien
							risus mauris et risus lacus, blandit sit amet venenatis non,
							vitae dolor. et netus sed fames ac turpis egestas. Sed non lorem
							sit amet elit placerat.</p>
						<ul class="actions">
							<li><a href="#" class="button">Learn More</a></li>
						</ul>
					</div>
				</article>
				<article>
					<a class="image" href="#" data-position="center"><img
						src="/resources/images/pic10.jpg" alt="" /></a>
					<div class="content">
						<h2>Magna sed lorem ipsum</h2>
						<p>Pellentesque leo mauris, consectetur id ipsum sit amet,
							fergiat. Pellentesque in mi amet massa lacinia egestas sapien
							risus mauris et risus lacus, blandit sit amet venenatis non,
							vitae dolor. et netus sed fames ac turpis egestas. Sed non lorem
							sit amet elit placerat.</p>
						<ul class="actions">
							<li><a href="#" class="button">Learn More</a></li>
						</ul>
					</div>
				</article>
				<nav>
					<a href="#" class="previous"><span class="label">Previous</span></a>
					<a href="#" class="next"><span class="label">Next</span></a>
				</nav>
			</div>
		</div>
	</section>

	<!-- Three -->
	
	<section id="three">
		<div class="wrapper style2 special">
			<div class="inner">
				<h2 class="alt">Sapien mauris blandit?</h2>
				<p>Lorem ipsum dolor mauris, consectetur id ipsum sit amet lorem
					sed amet consequat.</p>
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

	<!-- Scripts -->
	
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>

</body>
</html>