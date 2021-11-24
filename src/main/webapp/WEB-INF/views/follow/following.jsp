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
<style>
	td, th {
		text-align: center !important;
	}
	
	.small-width {
		display: none;
	}
	
	.big-width {
		
	}
	
	select {
		width: 15%;
		display: inline;
	}
	
	#keyword {
		display: inline;
		width: 55%;
	}
	
	@media ( max-width : 918px) {
		select[name='type'] {
			width: 80%;
		}
		#keyword {
			width: 80%;
		}
		.fa-search {
			width: 80%;
		}
		.big-width {
			display: none;
		}
		.small-width {
			display: block;
		}
	}
</style>
</head>
<c:if test="${result == '팔로우 추가 성공'}">
	<script>alert('${followId}님을 팔로우하였습니다 :)');</script>
</c:if>
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
					</ul></li>
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
			<img src="/resources/images/mainLogo.png" width="35%" height="auto">
		</a>
	</header>

	<!-- Main -->
	
	<div id="main">
		<div class="wrapper">
			<div class="inner">
				<header>
					<ul class="actions fit">
						<li><a href="/follow/following" class="button primary fit">Following
								List</a></li>
						<li><a href="/follow/follower" class="button fit">Follower
								List</a></li>
						<li><a href="/follow/search" class="button primary fit">Search
								User</a></li>
					</ul>
					<form action="/follow/following" id="searchForm" method="get">
						<div class="col-12" style="text-align: center;">
							<select name="type">
								<option value="U">ID</option>
							</select> <input type="text" name="keyword" id="keyword">
							<a href="#" class="button primary icon solid fa-search">Search</a>
						</div>
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					</form>

				</header>
				<table class="alt">
					<thead>
						<tr>
							<th style="width: 33%; text-align: center;">내가 팔로우하는 유저</th>
							<th style="width: 33%; text-align: center;">팔로우한 날짜</th>
							<th style="width: 33%; text-align: center;">삭제하기</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${list != null and list.size()>0}">
								<c:forEach items="${list}" var="follow">
									<tr style="text-align: center;">
										<td>${follow.followId}</td>
										<td>${follow.followDate}</td>
										<td><a href="${follow.followNum}" class="button primary get">삭제</a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="3" style="text-align: center;">아직 팔로우한 유저가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<form id="followingForm" name="followingForm" action="/follow/following" method="get">
		<input type="hidden" name="userId" value="${follow.userId}">
	</form>
	
	<!-- Three -->
	
	<section id="newsletter">
		<div class="wrapper style2 special">
			<div class="inner">
				<header>
					<h2>Sapien mauris blandit?</h2>
					<p>1</p>
				</header>
				<form method="post" action="#" class="combined">
					<input type="email" name="email" id="email" placeholder="Your email address" class="invert" />
					<input type="submit" class="special" value="Subscribe" />
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
					<p>1</p>
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
<script>
	let frm = $("#pageForm")
	let searchForm = $("#searchForm");
	
	$(".changePage").on("click",function(e){
		//a태그의 동작을 막기
		e.preventDefault();
		//해당 form 안에서 name이 pageNum인 태그 찾고 그 value를 바꿔준다.
		//$(this) : 현재 눌린 a태그
		//.attr("href") : 그 태그의 href속성에 써져있는것
		frm.find("input[name='pageNum']").val($(this).attr("href"));
		frm.submit();
	})
	
	$("#searchForm a").on("click",function(e){
		e.preventDefault();
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요.");
			return false;
		}
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.submit();
		
	})
	
	let form = $("#followingForm")
	
	$(".get").on("click",function(e){
		e.preventDefault();
		form.append("<input type='hidden' name='followNum' value='"+$(this).attr("href")+"'>");
		form.attr("action","/follow/remove");
		form.submit();
	})
	
</script>

</html>