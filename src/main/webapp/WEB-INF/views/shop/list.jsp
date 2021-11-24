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
				<li class="current"><a href="/shop/list">SHOP</a></li>
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
				<!-- 게시글 띄우는 테이블 -->
				<div class="table-wrapper">
					<a href="/shop/regist${pageMaker.cri.getListLink()}" class="button"
						style="float: right;">물품 등록</a> <br>
					<hr>
					<table>
						<thead>
							<tr>
								<th style="width: 8%">번호</th>
								<th style="width: 40%">제목</th>
								<th style="width: 16%">작성자</th>
								<th style="width: 18%" class="big-width">작성일</th>
								<th style="width: 18%" class="big-width">수정일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${list != null and list.size()>0}">
									<c:forEach items="${list}" var="shop">
										<tr onmouseover="this.style.background='#f9fbe7'"
											onmouseout="this.style.background=''"
											style="text-align: center;">
											<td>${shop.shopNum}</td>
											<td><a class="get" href="${shop.shopNum}">${shop.shopTitle}</a></td>
											<td>${shop.userId}</td>
											<td class="big-width">${shop.shopRegDate}</td>
											<td class="big-width">${shop.shopUpdDate}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">작성된 게시글이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				
				<!-- Search -->
				
				<form action="/shop/list" id="searchForm" method="get">
					<div class="col-12" style="text-align: center;">
						<select name="type">
							<option value="">검색</option>
							<option value="T">제목</option>
							<option value="C">내용</option>
							<option value="W">작성자</option>
							<option value="TC">제목 또는 내용</option>
							<option value="TW">제목 또는 작성자</option>
							<option value="TCW">제목 또는 내용 또는 작성자</option>
						</select>
						<input type="text" name="keyword" id="keyword">
							<a href="#" class="button primary icon solid fa-search">검색</a>
					</div>
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				</form>
				
				<!-- Paging -->
				
				<div class="big-width" style="text-align: center;">
					<c:if test="${pageMaker.prev}">
						<a class="changePage" href="${pageMaker.startPage - 1}"><code>&lt;</code></a>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="i">
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
				<form id="pageForm" name="pageForm" action="/shop/list" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					<input type="hidden" name="type" value="${pageMaker.cri.type }">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
				</form>
			</div>
		</div>
	</div>
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
	
	$(".get").on("click",function(e){
		e.preventDefault();
		//123번 게시글을 누른 경우
		//<input type='hidden' name='boardnum' value='123'>
		frm.append("<input type='hidden' name='shopNum' value='"+$(this).attr("href")+"'>")
		frm.attr("action","/shop/get")
		frm.submit();
	})
	
	$("#searchForm a").on("click",function(e){
		e.preventDefault();
		
		if(!searchForm.find("option:selected").val()){
			alert("검색 기준을 선택하세요.");
			return false;
		}
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요.");
			return false;
		}
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.submit();
		
	})
	
	result = "${result}";
	$(document).ready(
		function(){
			if(result == '' || history.state){
				return;
			}
			if(parseInt(result) > 0){
				alert("게시글 "+parseInt(result)+"번이 등록되었습니다.");
			}
			history.replaceState({},null,null);
		})
</script>
</html>