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
<c:if test="${result == '셀프 팔로우 추가 불가'}">
	<script>alert('자신을 제외한 유저를 팔로우 해주세요 :)');</script>
</c:if>
<c:if test="${result == '중복 유저 팔로우 추가 불가'}">
	<script>alert('${followId}님은 이미 팔로우한 유저입니다 :)');</script>
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
			<img src="/resources/images/mainLogo.png" width="35%" height="auto">
		</a>
	</header>

	<!-- Main -->
	
<body class="is-preload">
	<div id="main">
		<div class="wrapper">
			<div class="inner">
				<ul class="actions fit">
					<li><a href="/follow/following" class="button primary fit">Following List</a></li>
					<li><a href="/follow/follower" class="button fit">Follower List</a></li>
					<li><a href="/follow/search" class="button primary fit">Search User</a></li>
				</ul>

				<!-- 게시글 띄우는 테이블 -->

				<form action="/follow/search" id="searchForm" method="get">
					<div class="col-12" style="text-align: center;">
						<select name="type">
							<option value="U">ID</option>
							<option value="N">Nickname</option>
						</select>
						<input type="text" name="keyword" id="keyword">
						<a href="#" class="button primary icon solid fa-search">Search</a>
					</div>
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				</form>

				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>ID</th>
								<th>닉네임</th>
								<th>가입 날짜</th>
								<th>Follow</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${list != null and list.size()>0}">
									<c:forEach items="${list}" var="userList">
										<tr style="text-align: center;">
											<td>${userList.userId}</td>
											<td>${userList.userNickname}</td>
											<td>${userList.userRegDate}</td>
											<td><a href="${userList.userId}" class="button primary get">Follow</a></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4">검색을 해주세요</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>

				<form id="followForm" name="followForm" action="/follow/search" method="get">
					<input type="hidden" name="userId" value="${user.userId}">
				</form>

				<!-- 페이징 처리 -->
				
				<div class="big-width" style="text-align: center;">
					<c:if test="${pageMaker.prev}">
						<a class="changePage" href="${pageMaker.startPage - 1}"><code>&lt;</code></a>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="i">
						<c:choose>
							<c:when test="${pageMaker.cri.pageNum == i}">
								<code>${i}</code>
							</c:when>
							<c:otherwise>
								<!-- localhost:9090/board/list?pageNum=${i}&amount=${pageMaker.cri.amount} -->
								<a class="changePage" href="${i}"><code>${i}</code></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<a class="changePage" href="${pageMaker.endPage + 1}"><code>&gt;</code></a>
					</c:if>
				</div>
				<div class="small-width" style="text-align: center;">
					<c:if test="${pageMaker.cri.pageNum > 1}">
						<a class="changePage" href="${pageMaker.cri.pageNum - 1}"><code>&lt;</code></a>
					</c:if>
					<code>${pageMaker.cri.pageNum}</code>
					<c:if test="${pageMaker.cri.pageNum != pageMaker.realEnd }">
						<a class="changePage" href="${pageMaker.cri.pageNum + 1}"><code>&gt;</code></a>
					</c:if>
				</div>
				<form id="pageForm" name="pageForm" action="/follow/search" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					<input type="hidden" name="type" value="${pageMaker.cri.type}">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
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
	
	let form = $("#followForm")
	
	$(".get").on("click",function(e){
		e.preventDefault();
		form.append("<input type='hidden' name='followId' value='"+$(this).attr("href")+"'>");
		form.attr("action","/follow/addFollow");
		form.submit();
	})
</script>

</html>