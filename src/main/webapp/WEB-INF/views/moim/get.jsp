<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<title>TWith</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
</head>
<style>
	.id_ok {
		color: #fff;
		display: none;
	}
	
	.id_already {
		color: #6A82FB;
		display: none;
	}
	
	.map_wrap, .map_wrap * {
		margin: 0;
		padding: 0;
		font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
		font-size: 12px;
	}
	
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
		color: #000;
		text-decoration: none;
	}
	
	.map_wrap {
		position: relative;
		width: 100%;
		height: 500px;
	}
	
	#menu_wrap {
		position: absolute;
		top: 0;
		left: 0;
		bottom: 0;
		width: 250px;
		margin: 10px 0 30px 10px;
		padding: 5px;
		overflow-y: auto;
		background: rgba(255, 255, 255, 0.7);
		z-index: 1;
		font-size: 12px;
		border-radius: 10px;
	}
	
	.bg_white {
		background: #fff;
	}
	
	#menu_wrap hr {
		display: block;
		height: 1px;
		border: 0;
		border-top: 2px solid #5F5F5F;
		margin: 3px 0;
	}
	
	#menu_wrap .option {
		text-align: center;
	}
	
	#menu_wrap .option p {
		margin: 10px 0;
	}
	
	#menu_wrap .option button {
		margin-left: 5px;
	}
	
	#placesList li {
		list-style: none;
	}
	
	#placesList .item {
		position: relative;
		border-bottom: 1px solid #888;
		overflow: hidden;
		cursor: pointer;
		min-height: 65px;
	}
	
	#placesList .item span {
		display: block;
		margin-top: 4px;
	}
	
	#placesList .item h5, #placesList .item .info {
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	
	#placesList .item .info {
		padding: 10px 0 10px 55px;
	}
	
	#placesList .info .gray {
		color: #8a8a8a;
	}
	
	#placesList .info .jibun {
		padding-left: 26px;
		background:
			url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
			no-repeat;
	}
	
	#placesList .info .tel {
		color: #009900;
	}
	
	#placesList .item .markerbg {
		float: left;
		position: absolute;
		width: 36px;
		height: 37px;
		margin: 10px 0 0 10px;
		background:
			url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
			no-repeat;
	}
	
	#placesList .item .marker_1 {
		background-position: 0 -10px;
	}
	
	#placesList .item .marker_2 {
		background-position: 0 -56px;
	}
	
	#placesList .item .marker_3 {
		background-position: 0 -102px
	}
	
	#placesList .item .marker_4 {
		background-position: 0 -148px;
	}
	
	#placesList .item .marker_5 {
		background-position: 0 -194px;
	}
	
	#placesList .item .marker_6 {
		background-position: 0 -240px;
	}
	
	#placesList .item .marker_7 {
		background-position: 0 -286px;
	}
	
	#placesList .item .marker_8 {
		background-position: 0 -332px;
	}
	
	#placesList .item .marker_9 {
		background-position: 0 -378px;
	}
	
	#placesList .item .marker_10 {
		background-position: 0 -423px;
	}
	
	#placesList .item .marker_11 {
		background-position: 0 -470px;
	}
	
	#placesList .item .marker_12 {
		background-position: 0 -516px;
	}
	
	#placesList .item .marker_13 {
		background-position: 0 -562px;
	}
	
	#placesList .item .marker_14 {
		background-position: 0 -608px;
	}
	
	#placesList .item .marker_15 {
		background-position: 0 -654px;
	}
	
	#pagination {
		margin: 10px auto;
		text-align: center;
	}
	
	#pagination a {
		display: inline-block;
		margin-right: 10px;
	}
	
	#pagination .on {
		font-weight: bold;
		cursor: default;
		color: #777;
	}
</style>
<body class="is-preload">
	<c:set var="appkey" value="08d5f583f36357f829d2651be810df95"></c:set>
	
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
				<form name="makeform" action="/moim/manage" method="post">
					<div id="container">
						<!-- <h1 style="text-align: center;">넣을 문구</h1> -->
						<hr>
						<table>
							<tr>
								<td style="width: 49%;">
									<h4>모임 정보</h4>
									<table>
										<tr>
											<td>이름</td>
											<td>${moim.moimname}</td>
										</tr>
										<tr>
											<td>모임장</td>
											<td>${moim.userid}</td>
										</tr>
										<tr>
											<td>분류</td>
											<td><c:choose>
													<c:when test="${moim.moimtype == 0}">일반</c:when>
													<c:when test="${moim.moimtype == 1}">카라반</c:when>
													<c:when test="${moim.moimtype == 2}">바이크</c:when>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>경비</td>
											<td>${moim.moimbudget}</td>
										</tr>
										<tr>
											<td>출발날짜</td>
											<td>${fn:split(moim.startdate," ")[0]}</td>
										</tr>
										<tr>
											<td>끝날짜</td>
											<td>${fn:split(moim.enddate," ")[0]}</td>
										</tr>
									</table>
								</td>
								<td style="width: 49%;">
									<h4>목적지</h4>
									<div id="staticMap" style="width: 100%; height: 350px;"></div>
									<strong style="text-align: center; display: block;">${place.placename }</strong>
									<div>
										<input type="hidden" id="placename" name="placename">
										<input type="hidden" id="placelat" name="placelat">
										<input type="hidden" id="placelon" name="placelon">
										<input type="hidden" id="placeaddr" name="placeaddr">
										<input type="hidden" id="placeroadaddr" name="placeroadaddr">
										<input type="hidden" id="placecategory" name="placecategory">
										<input type="hidden" id="placephonenumber" name="placephonenumber">
										<input type="hidden" name="moimnum" value="${moim.moimnum}">
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<h4>멤버</h4>
									<table>
										<tr style="text-align: center;">
											<td><strong>닉네임</strong></td>
											<td><strong>전화번호</strong></td>
											<td><strong>이메일</strong></td>
										</tr>
										<c:forEach items="${members}" var="member">
											<tr style="text-align: center;">
												<td>${member.userNickname}</td>
												<td>${member.userPhone}</td>
												<td>${member.userEmail}</td>
											</tr>
										</c:forEach>
									</table>
								</td>
							</tr>
						</table>
						<c:if test="${sessionScope.user.userId == moim.userid}">
							<input type="submit" value="모임 신청 관리" onclick="sendit()">
							<input type="button" value="모임 멤버 관리"
								onclick="location.href='/moim/ban?moimnum='+${moim.moimnum}">
							<input type="button" value="모임 취소하기" onclick="cancel()">
							<input type="button" value="모임 수정하기"
								onclick="location.href='/moim/updateMoim?moimnum='+${moim.moimnum}">
						</c:if>
						<input type="button" value="내 모임으로 돌아가기" onclick="location.href='/moim/mymoim'">
						<hr>
						<div>
							<input type="button" id="refreshChat" value="🔄" onclick="getChat('${moim.moimnum}')">
							<div style="overflow: scroll; overflow-x: hidden; width: 100%; height: 500px;"
								id="chatting"></div>
							<table>
								<tr>
									<td style="vertical-align: middle; width: 80%;">
										<textarea id="chatcontents" placeholder="Contents" rows="3"
											style="resize: none; width: 100%; display: inline-block; height: 100px;"></textarea>
									</td>
									<td style="vertical-align: middle; width: 15%;">
										<a class="button primary registchat"
										style="width: 100%; font-size: 1.5em;">보내기</a>
									</td>
								</tr>
							</table>
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
					placeholder="Your email address" class="invert" />
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
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${appkey}&libraries=services,clusterer,drawing"></script>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>$(function() {$("#datepicker1").datepicker({});});</script>
<script>$(function() {$("#datepicker2").datepicker({});});</script>
<script>

	console.log("${place}")
	
	let placelat = "${place.placelat}"
	let placelon = "${place.placelon}"
	// 이미지 지도에서 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(placelon, placelat); 
	//var markerPosition  = new kakao.maps.LatLng(37,120); 
	
	// 이미지 지도에 표시할 마커입니다
	// 이미지 지도에 표시할 마커는 Object 형태입니다
	var marker = {
	    position: markerPosition
	};
	
	var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
	    staticMapOption = { 
	        center: new kakao.maps.LatLng(placelon,placelat), // 이미지 지도의 중심좌표
	        //center: new kakao.maps.LatLng("38.0","127.0"), // 이미지 지도의 중심좌표
	        level: 3, // 이미지 지도의 확대 레벨
	        marker: marker // 이미지 지도에 표시할 마커 
	    };    
	
	// 이미지 지도를 생성합니다
	var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
	
	</script>
	<script src="https://tistory1.daumcdn.net/tistory/2784544/skin/images/xmltojsonPast.min.js"></script>
	<script>
	   getChat("${moim.moimnum}")
	   
	$(".registchat").on("click",function(e){
		//어떤 게시글의 댓글인지
		let moimnum = "${moim.moimnum}";
		//누가 썼는지
		let chatcontents = $("#chatcontents").val();
		
		console.log("regist chat^^");
		//callback,error는 외부에서 전달받을 함수이다.
		//함수의 파라미터 개수를 일치시킬 필요가 없기 때문에
		//사용시 callback이나 error와 같은 것은 상황에 따라 작성한다.
		$.ajax(
			{
				//전송방식
				type:"POST",
				//전송할 목적지
				url:"/moim/registchat",
				//데이터
				data:JSON.stringify({moimnum:moimnum,moimchatcontents:chatcontents}),
				//데이터의 타입
				contentType:"application/json; charset=utf-8",
				//ajax 성공시 호출할 함수
				success:function(result,status,xhr){
					console.log("등록 성공")
					getChat(moimnum)
				},
				//ajax 실패시 호출할 함수
				error:function(xhr,status,e){
					console.log("실패.....")
				}
			}
		);
		
		//DOM으로 뷰단 수정하는 코드로 바꾸기
	})
	
	function getChat(moimnum){
	   	
		let str = ""
	   	let chatting = document.getElementById("chatting")
	   	
		$.ajax(
				{
					type:"GET",
					url:"/moim/getchat?moimnum="+moimnum,
					dataType:"text",
					success:function(result,status,xhr){
						console.log("불러오기 성공")
						let resultJ = xmlToJson.parse(result)
						
						str +="<ul style='list-style:none;'>"
						if(resultJ){ 
						for(let chat of resultJ.List.item){
							str += "<li style='margin-bottom:1%;'><div style='border:2px solid gray;border-radius:5px;padding:1%;'>"
							str += chat.userid+"<br>"
							str += "<i style='font-size:0.7em;'>"+chat.moimchatdate+"</i><br>"
							str += "<strong style='font-size:1.3em;'>"+chat.moimchatcontents+"</strong>"
							str += "</div></li>"
						}
					}
						str +="</ul>"
						chatting.innerHTML = str
						document.getElementById("chatcontents").value=""
						chatting.scrollTop = chatting.scrollHeight;
					},
					error:function(xhr,status,e){
						console.log("불러오기 실패..."+e)
					}
				}
			)
	}
   </script>
<script>

function  cancel(){
	if(confirm("정말 취소하시겠습니까?")){
	location.href="/moim/cancelMoim?moimnum=${moim.moimnum}"
	}
}
</script>

</html>