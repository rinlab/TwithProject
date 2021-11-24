<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>TWith</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<style>
	.id_ok {
		color: #fff;
		display: none;
	}
	
	.id_already {
		color: #6A82FB;
		display: none;
	}
	
	td, th {
		text-align: center !important;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
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
					<h2 class="home">멤버 관리</h2>
				</header>
				
				<!-- 게시글 띄우는 테이블 -->
				
				<div class="table-wrapper">
					<table style="table-layout: fixed; border-spacing: 2px">
						<thead>
							<tr>
								<th style="width: 25%">신청자</th>
								<th style="width: 50%">내용</th>
								<th style="width: 25%">신청일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${list != null and list.size()>0}">
									<c:forEach items="${list}" var="apply">
										<tr style="text-align: center;">
											<td style="width: 25%">${apply.joinuserid}</td>
											<td style="width: 50%">
												<a class="get" href="${apply.moimjoinnum}">${apply.joincontents}</a></td>
											<td class="big-width" style="width: 25%">${apply.reqdate}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">신청자가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
					<a href="/moim/get/${moimnum}" class="button primary">모임정보로 돌아가기</a>
				<form id="pageForm" name="pageForm" action="/moim/joinDetail" method="get"></form>
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
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
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
      let joindetail = window.open("/moim/joinDetail/"+$(this).attr("href"),"joinDetail","width=1000,height=1000,left=0,right=0")
      //123번 게시글을 누른 경우
      //<input type='hidden' name='boardnum' value='123'>
/*       frm.append("<input type='hidden' name='moimjoinnum' value='"+$(this).attr("href")+"'>")
      frm.attr("action","/moim/joinDetail") */
      /* frm.submit(); */
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
      }      
   
   )
   
</script>

</html>