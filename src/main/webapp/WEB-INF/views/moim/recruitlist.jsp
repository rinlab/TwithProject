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
<style>
	td, th {
		text-align: center !important;
	}
	
	.small-width {
		display: none;
	}
	
	.big-width {
		
	}
	
	@media ( max-width : 918px) {
		/* select[name='type']{
	         width:100%;
	      }
	      #keyword{
	         width:100%;
	      } */
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
					<c:choose>
						<c:when test="${moimtype == 0}">
							<h3>일반 여행</h3>
						</c:when>
						<c:when test="${moimtype == 1}">
							<h3>카라반 여행</h3>
						</c:when>
						<c:otherwise>
							<h3>자전거 여행</h3>
						</c:otherwise>
					</c:choose>
				</header>
				<form action="/moim/recruitregist${pageMaker.cri.getListLink()}">
					<%-- <a href="/moim/recruitregist/${moimtype}${pageMaker.cri.getListLink()}" class="button primary small">글 등록</a> --%>
					<input type="hidden" name="moimtype" value="${moimtype}">
					<input type="submit" class="button primary small" value="글 등록">
				</form>
				
				<!-- 게시글 띄우는 테이블 -->
				
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th style="width: 8%">번호</th>
								<th style="width: 50%">제목</th>
								<th style="width: 16%">작성자</th>
								<th style="width: 18%" class="big-width">작성일</th>
								<th style="width: 8%" class="big-width">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${list != null and list.size() > 0}">
									<c:forEach items="${list}" var="board">
										<tr>
											<td>${board.recruitnum}</td>
											<td><a class="get" href="${board.recruitnum}">${board.recruittitle}</a></td>
											<td>${board.userid}</td>
											<td class="big-width">${board.regdate}</td>
											<td class="big-width">${board.readcnt}</td>
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

				<form action="/moim/recruitlist/${moimtype}" id="searchForm" method="get">
					<div class="row aln-center">
						<div class="col-2 big-width">
							<select name="type">
								<option ${pageMaker.cri.type == null?"selected":""} value="">검색</option>
								<option ${pageMaker.cri.type == "T"?"selected":""} value="T">제목</option>
								<option ${pageMaker.cri.type == "C"?"selected":""} value="C">내용</option>
								<option ${pageMaker.cri.type == "W"?"selected":""} value="W">작성자</option>
								<option ${pageMaker.cri.type == "TC"?"selected":""} value="TC">제목 또는 내용</option>
								<option ${pageMaker.cri.type == "TW"?"selected":""} value="TW">제목 또는 작성자</option>
								<option ${pageMaker.cri.type == "TCW"?"selected":""} value="TCW">제목 또는 내용 또는 작성자</option>
							</select>
						</div>
						<div class="col-6 big-width">
							<input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword}">
						</div>
						<div style="width: 16%" class="col-4 big-width">
							<a href="#" class="button primary icon solid fa-search">검색</a>
						</div>
					</div>
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				</form>
				
				<!-- 페이징처리 -->
				
				<!-- 컴퓨터 환경 -->
				
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
								<a class="changePage" href="${i}"><code>${i}</code></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<a class="changePage" href="${pageMaker.endPage + 1}"><code>&gt;</code></a>
					</c:if>
				</div>
				
				<!-- 모바일 환경 -->
				
				<div class="small-width" style="text-align: center;">
					<c:if test="${pageMaker.cri.pageNum > 1}">
						<a class="changePage" href="${pageMaker.cri.pageNum - 1}"><code>&lt;</code></a>
					</c:if>
					<code>${pageMaker.cri.pageNum}</code>
					<c:if test="${pageMaker.cri.pageNum != pageMaker.realEnd}">
						<a class="changePage" href="${pageMaker.cri.pageNum + 1}"><code>&gt;</code></a>
					</c:if>
				</div>
				<form id="pageForm" name="pageForm"
					action="/moim/recruitlist/${moimtype}" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					<input type="hidden" name="type" value="${pageMaker.cri.type}">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					<input type="hidden" name="moimtype" value="${moimtype}">
				</form>
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

<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script>

   let frm = $("#pageForm")
   let searchForm = $("#searchForm")
   
      $(".changePage").on("click",function(e){
      //a태그의 동작을 막기
      e.preventDefault();
      //해당 form 안에서 name이 pageNum인 태그 찾고 그 value를 바꿔준다
      //$(this) : 현재 눌린 a태그
      //.attr("href") : 그 태그의 href속성에 써져있는것
      frm.find("input[name='pageNum']").val($(this).attr("href"));
      frm.submit();
   });
   
   $(".get").on("click",function(e){
      e.preventDefault();
      //123번 게시글을 누른 경우
      //<input type='hidden' name='boardnum' value='123'>
      frm.append("<input type='hidden' name='recruitnum' value='"+$(this).attr("href")+"'>")
      frm.attr("action","/moim/recruitget")
      frm.submit();
   })
   
   result = "${result}";
   remove = "${remove}";
  
   $(document).ready(
      function(){
         if(result == '' && remove == '' || history.state){
            return;
         }
         if(parseInt(result) > 0){
            alert("게시글 "+parseInt(result)+"번이 등록되었습니다.");
         }
         if(parseInt(remove) > 0){
            alert("게시글 "+parseInt(remove)+"번이 삭제되었습니다.");
         }
         history.replaceState({},null,null);
      }
   )
   
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

</script>
</html>