<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TWith</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
				<li class="current"><a href="#" class="dropdown">COMMUNITY</a>
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
		<h1>${moim.moimname}</h1>
	</header>

	<!-- Main -->
	
	<div id="main">
		<div class="wrapper">
			<div class="inner">
				<header class="major">
					<h1 class="home">모임 홍보 게시판</h1>
					<p>게시글 수정</p>
				</header>
				<a href="/moim/recruitlist/${moimtype}${cri.getListLink()}"
					class="button primary small">목록 보기</a>
				<br>
				<br>
				<div class="col-12">
					<form method="post" action="/moim/recruitmodify" id="modifyform">
						<input type="hidden" value="${cri.pageNum}" name="pageNum">
						<input type="hidden" value="${cri.amount}" name="amount">
						<input type="hidden" value="${moimtype}" name="moimtype">
						<div class="col-12">
							<h4>번호</h4>
							<input type="text" name="recruitnum" value="${board.recruitnum}" readonly>
						</div>
						<hr>
						<div class="col-12">
							<h4>*제목</h4>
							<input type="text" name="recruittitle" value="${board.recruittitle}">
						</div>
						<hr>
						<div class="col-12">
							<h4>*모임 선택</h4>
							<select name="moim" style="font-size: 1.3rem;">
								<c:choose>
									<c:when test="${moimlist != null and moimlist.size() > 0}">
										<option value="">---모임---</option>
										<c:forEach items="${moimlist}" var="moim">
											<option ${moim.moimnum == moimnum?"selected":""}
											value="${moim.moimnum}" class="${moim.moimnum}">${moim.moimname}</option>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<option value="">모임이 없습니다.</option>
									</c:otherwise>
								</c:choose>
							</select>
							<input type="hidden" name="moimnum">
						</div>
						<hr>
						<div class="col-12">
							<h4>*내용</h4>
							<textarea name="recruitcontents" rows="10" style="resize: none;">${board.recruitcontents}</textarea>
						</div>
						<hr>
						<div class="col-12">
							<h4>작성자</h4>
							<input type="text" name="userid" value="${board.userid}" readonly>
						</div>
						<hr>
						<div class="col-12">
							<a href="#" class="button primary modify">수정 완료</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script>

   let modifyForm = $("#modifyform")
   
   $(".modify").on("click",function(e){
      e.preventDefault();
      
      if(!modifyForm.find("option:selected").val()){
         alert("모임을 선택하세요.");
         return false;
      }
      modifyForm.find("input[name='moimnum']").val(modifyForm.find("option:selected").val());
      modifyForm.submit();
   })
   
</script>

</html>