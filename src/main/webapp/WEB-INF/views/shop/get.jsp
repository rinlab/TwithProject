<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<script src="/resources/assets/js/shopreply.js"></script>
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
	
	.mdf {
		height: 75px;
		width: 900px;
		resize: none;
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
				<div class="col-12">
					<form method="post" action="/shop/remove" name="shopForm">
						<input type="hidden" value="${shop.shopNum}" name="shopNum">
						<input type="hidden" value="${cri.pageNum}" name="pageNum">
						<input type="hidden" value="${cri.amount }" name="amount">
						<div class="col-12">
							<h4>제목</h4>
							<input name="shopTitle" type="text" value="${shop.shopTitle}" readonly>
						</div>
						<hr>
						<div class="col-12">
							<h4>작성자</h4>
							<input name="userId" type="text" value="${shop.userId}" readonly>
						</div>
						<hr>
						<div class="col-12">
							<h4>내용</h4>
							<textarea name="shopContents" rows="10" style="resize: none;" readonly>${shop.shopContents}</textarea>
						</div>
						<hr>
						<div>
							<h4>금액</h4>
							<input name="shopPrice" value="${shop.shopPrice}" type="text" readonly>
						</div>
						<hr>
						<div style="display: inline-block; width: 49%;" class="col-12">
							<input type="button" value="수정" class="button primary small"
								onclick="location.href='/shop/modify${cri.getListLink()}&shopNum=${shop.shopNum}'">
							<input type="submit" value="삭제" class="button primary small" id="shopDeleteAll">
						</div>
						<div class="col-12" style="display: inline-block; text-align: right; width: 49%;">
							<a href="/shop/list${cri.getListLink()}" class="button primary small">목록 보기</a>
						</div>
					</form>
					
					<hr>
					
					<h3 style="text-align: center;">댓 글</h3>
					<a href="#" class="button primary regist">댓글 등록</a> <br> <br>
					
					<div class="replyForm row"
						style="display: none; justify-content: center;">
						<div style="width: 15%;">
							<h4>작성자</h4>
							<input name="userId" value="${user.userId}" placeholder="Writer" type="text" readonly>
						</div>
						<div style="width: 65%;">
							<h4>내용</h4>
							<textarea name="SReplyContents" rows="2" style="resize: none;" placeholder="Contents"></textarea>
						</div>
						<div style="width: 15%;">
							<h4>금액</h4>
							<input name="SReplyPrice" placeholder="Jessie" type="text">
						</div>
						<div style="width: 10%; margin-left: 1%" class="row">
							<h4 style="margin-bottom: 1.3rem !important;">&nbsp;</h4>
							<a href="#" style="margin-bottom: 0.7rem;"
							class="button primary small finish">등록</a>
							<a href="#" class="button primary small cancel">취소</a>
						</div>
					</div>
					
					<!-- 댓글 띄우는 ul -->
					
					<ul class="alt replies"></ul>
					
					<!-- 댓글 페이징 처리할 div -->
					
					<div class="page" style="text-align: center"></div>
				</div>
			</div>
		</div>
	</div>
</body>

<!-- Scripts -->

<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script>
	/* 댓글 쓰는 폼 띄우는 코드 */
	$(".regist").on("click",function(e){
		e.preventDefault();
		$(".replyForm").show();
		$(this).hide();
	})
	
	/* 댓글 작성중 취소버튼 눌렀을 때의 코드 */
	$(".cancel").on("click",function(e){
		e.preventDefault();
		$(".replyForm").hide();
		$(".regist").show();
	})
	
	/* 댓글 등록하기 버튼 눌렀을 때의 코드 */
	//$("선택자").on("click",함수) : 앞에있는 선택자의 요소가 "click"되었을 때 두번째 매개변수로 넘겨주는 함수를 호출한다.  
	$(".finish").on("click",function(e){
		e.preventDefault();
		//어떤 게시글의 댓글인지
		let shopNum = parseInt("${shop.shopNum}");
		//누가 썼는지
		let userId = "${user.userId}";
		//어떤 내용인지
		let SReplyContents = $("textarea[name='SReplyContents']").val();
		
		let SReplyPrice = parseInt($("input[name='SReplyPrice']").val()); 
		//Ajax 코드는 reply.js에 모듈화 시켜놓았다. 그 모듈화된 파일에 있는 replyService 객체 이용
		//replyService.add(데이터객체,성공시 호출할 함수,실패시 호출할 함수)
		//흐름이 reply.js에 있는 add로 흐름 이동
		shopReplyService.add(
			//{boardnum:위의boardnum변수의값, replywriter:위의replywriter변수의값, replycontents:위의replycontents변수의값}
			{shopNum:shopNum, userId:userId, sreplyContents:SReplyContents, sreplyPrice:SReplyPrice},
			//성공시 호출할 함수
			function registOk(){
				alert("등록 완료");
				location.reload();
			},
			//실패시 호출할 함수
			function(result){
				alert("등록 실패");
			}
		);
		//DOM으로 뷰단 수정하는 코드로 바꾸기
	});
	
	//$(document).ready(함수) : 문서가 준비 완료 되었다면 넘겨주는 함수 호출
	$(document).ready(
		function(){
			//어떤 게시글의 댓글들을 불러와야 하는지
			let shopNum = "${shop.shopNum}";
			//댓글 목록 띄워줄 ul태그
			let replies = $(".replies");
			//현재 이 게시글에서 보여주고 있는 댓글의 페이지
			let pageNum = 1;
			//댓글 페이징 처리를 위한 div태그
			let pagediv = $(".page");
	
			//1페이지의 댓글 불러오는 함수
			showList(1);
			
			function showList(page){
				//매개변수 page : 현재 띄워주어야 할 댓글의 페이지를 받아온다.
				//replyService.getList(객체, 성공시 호출할 함수, 실패시 호출할 함수) 사용
				//흐름이 reply.js에 있는 getList로 이동
				shopReplyService.getList(
					//게시글번호, 띄워야할페이지 정보를 가지고 있는 객체
					{ shopNum : shopNum, page : page || 1 },
					
					function(replyCnt,list){
						if(list == null || list.length == 0){
							//DB에서 검색해온 댓글목록이 없을 경우에는
							//댓글 목록을 띄울 ul태그 안에 "댓글이 없습니다." 문자열 넣기
							replies.html("<li>댓글이 없습니다.</li>");
							return;
						}
						//댓글 목록 DOM으로 띄우기
						let str = "";
						/* 
							<li style='clear: both;'>
							<div style="display:inline;float:left;">
								<strong>durian</strong>
								<p>댓글 테스트4</p>
							</div>
							<div style='text-align:right'>
								<strong>2021-09-14 20:33:42</strong><br>
								<a href='#'>수정</a>
								<a href='#'>삭제</a>
							</div>
						</li>
						
						*/
						//for문을 댓글목록의 길이만큼 반복하면서
						for(let i=0, len = list.length; i<len; i++){
							//댓글 목록 띄울 ul태그 안에 들어갈 html 요소 등을 댓글 한개마다 달아준다.
							//비어있는 str문자열에 연결로 이어준다.
							//li,div 여는태그
							str += "<li style='clear:both'><div style='display:inline;float:left;'>";
							//<strong>작성자</strong>
							str += "<strong class='userId"+list[i].sreplyNum+"'>" + list[i].userId+"</strong>"
							//<p class='reply댓글번호'>댓글내용</p></div>
							str += "<p class='sreply" + list[i].sreplyNum + "'>"+list[i].sreplyContents+"</p></div>"
							//<div><strong>
							str += "<div style='text-align:right;'>"
							str += "<strong class='SReplyPrice"+list[i].sreplyPrice+"'>" +"금액 : "+list[i].sreplyPrice+"원"+"</strong>"
							str += "</div>"
							str += "<div style='text-align:right;'><strong>"
							//시간 포매팅 데이터 </strong>
							//시간 포매팅 때 displayTime(댓글의 등록시간) 호출 : 흐름 이동
							str += shopReplyService.displayTime(list[i].sreplyRegDate) + "</strong>";
							//<br><a>수정</a>  <a>삭제</a>
							str += "<br><a href='"+list[i].sreplyNum+"' class='modify' id='"+list[i].sreplyPrice+"'>수정</a>"
							str += "<a href='"+list[i].sreplyNum+"' class='mfinish' id='"+list[i].sreplyPrice+"' style='display:none;'>수정완료</a>&nbsp;&nbsp;"
							str += "<a href='"+list[i].sreplyNum+"' class='remove'>삭제</a></div></li>"
						}
						//ul태그 안에 위의 for문에서 연결누적된 str 써주기
						replies.html(str);
						//페이징 처리하는 함수 호출하기(전체 개수 넘기면서)
						showReplyPage(replyCnt);
						
						//댓글의 수정버튼을 눌렀을 때의 코드
						$(".modify").on("click",function(e){
							e.preventDefault();
							let SReplyNum = $(this).attr("href"); // class=modify의 href 값을 가져온다
							let SReplyPrice = $(this).attr("id"); // class=modify의 id 값을 가져온다
							let replytag = $(".sreply"+SReplyNum); //class='reply11' 인 p태그
							let replypricetag = $(".SReplyPrice"+SReplyPrice);
							
							//<textarea class='11'>원래의 댓글내용</textarea>
							replytag.html("<textarea class='"+SReplyNum+" mdf'>"+replytag.text()+"</textarea>");
							replypricetag.html("<input type='text' class='"+SReplyPrice+" mdf' value= '"+SReplyPrice+"'>");
							$(this).hide();
							
							let finishBtns = document.getElementsByClassName("mfinish");
							for(let i=0;i<finishBtns.length;i++){
								if(finishBtns[i].getAttribute("href") == SReplyNum){
									finishBtns[i].style.display="";
									break;
								}
							}
						})
						
						//수정완료 버튼을 눌렀을 때의 코드
						$(".mfinish").on("click",function(e){	// mfinish 클래스를 눌렀을때 함수를 불러온다
							e.preventDefault();					// 일단 페이지 이동을 멈춘다
							//수정하는 코드
							let SReplyNum = parseInt($(this).attr("href"));// SReplyNum이라는 변수에 mfinish 클래스의 href속성 값을 넣는다
							let SReplyPriceOrg = $(this).attr("id"); // SReplyPriceOrg라는 변수에 mfinish 클래스의 id 속성 값을 넣는다
							let shopNumOrg = "${shop.shopNum}";
							let shopNum = parseInt(shopNumOrg);
							let userId = $(".userId"+SReplyNum).text();
							let SReplyContents = $("."+SReplyNum).val(); // 클래스 SReplyNum의 값을 SReplyContents 변수에 넣는다
							let SReplyPrice = parseInt($("."+SReplyPriceOrg).val()); // 클래스 SReplyPrice의 값을 SReplyPriceOrg 변수에 넣는다
							//댓글번호, 바뀐 댓글의 내용
							shopReplyService.update(
								{sreplyNum:SReplyNum, sreplyContents:SReplyContents, sreplyPrice:SReplyPrice, shopNum:shopNum, userId:userId},
								function(result){
									if(result == "success"){
										alert("수정 완료");
										location.reload();
									}
								},
								function(e){
									alert("수정 실패");
									location.reload();
								}
							)
						})
						
						//삭제 버튼을 눌렀을 때의 코드
						$(".remove").on("click",function(e){
							e.preventDefault();
							let SReplyNum = $(this).attr("href"); //6
							shopReplyService.remove(
									SReplyNum,//replynum		
								function(result){
									if(result == "success"){
										alert("삭제 완료");
										location.reload();
									}
								},
								function(e){
									alret("삭제 실패");
								location.reload();
								}
							)
						})
					}
				);
			}
			//1 2 3 4 5 6 7 8 9 10 >
			function showReplyPage(replyCnt){
				let endPage = Math.ceil(pageNum/10.0)*10;
				let startPage = endPage-9;
				
				let prev = startPage != 1;
				let next = false;
				
				if(endPage*5>=replyCnt){
					endPage = Math.ceil(replyCnt/5.0);
				}
				if(endPage*5 < replyCnt){
					next = true;
				}
				//핸드폰 환경 : < 5 >
				//컴퓨터 환경 : 1 2 3 4 5 6 7 8 9 10 >
				let str = "";
				if(matchMedia("screen and (max-width:918px)").matches){
					//핸드폰 환경
					if(pageNum > 1){
						str += "<a class='changePage' href='"+(pageNum-1)+"'><code>&lt;</code></a>";
					}
					str += "<code>" + pageNum + "</code>"
					if(pageNum != endPage){
						str += "<a class='changePage' href='"+(pageNum+1)+"'><code>&gt;</code></a>";
					}
				}else{
					//컴퓨터 환경
					if(prev){
						str += "<a class='changePage' href='"+(startPage-1)+"'><code>&lt;</code></a>";
					}
					for(let i=startPage; i<=endPage; i++){
						if(i == pageNum){
							str += "<code>"+i+"</code>"
						}else{
							str += "<a class='changePage' href='"+ i +"'><code>"+i+"</code></a>"
						}
					}
					if(next){
						str += "<a class='changePage' href='"+ (endPage+1) +"'><code>&gt;</code></a>"
					}
				}
				pagediv.html(str);
				
				$(".changePage").on("click",function(e){
					e.preventDefault();
					let target = $(this).attr("href");//"4"
					pageNum = parseInt(target); // 4
					showList(pageNum);
				})
			}
			
			shopReplyService.get(1,function(result){
				console.log(result);
			});
			
		})		
		
</script>

</html>