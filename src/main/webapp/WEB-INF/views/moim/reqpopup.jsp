<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<li class="current"><a href="#" class="dropdown">MOIM</a>
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

	<div id="main">
		<div class="wrapper">
			<div class="inner">
				<header class="major">
					<h1 class="home">모임 참가 요청</h1>
				</header>
				<br> <br>
				<div class="col-12">
					<form method="post" action="/moim/sendreq" name="sendreqform">
						<input type="hidden" name="moimnum" value="${moimnum}">
						<input type="hidden" name="moimking" value="${moimking}">
						<div class="col-12">
							<h4>작성자</h4>
							<input type="text" name="joinuser" value="${login_id}" readonly>
						</div>
						<hr>
						<div class="col-12">
							<h4>내용</h4>
							<textarea name="joincontents" placeholder="Contents" rows="10" style="resize: none;"></textarea>
						</div>
						<hr>
						<div class="col-12">
							<input type="button" value="전송하기" class="primary sendreq">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<!-- Script -->

<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script>
   $(".sendreq").on("click",function(e){
      let moimking = $("input[name='moimking']").val();
      let joinuser = $("input[name='joinuser']").val();
      let moimnum = $("input[name='moimnum']").val();
      let joincontents = $("textarea[name='joincontents']").val();
      let data = {kinguserid:moimking,joinuserid:joinuser,moimnum:moimnum,joincontents:joincontents}
      
      $.ajax({
            url:"/moim/sendreq",
            type:"POST",
            data:JSON.stringify(data), 
            contentType: "application/json",
            success: function(success) {
                if (success) {
                    alert("전송완료");
                    window.close();
                } else {
                    alert("다시 시도해 주세요");
                }
            },
            error: function() {
                alert("에러 발생");
            }
        })
   })
   
</script>

</html>