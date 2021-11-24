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
					<p>상세보기</p>
				</header>
				<a href="/moim/recruitlist/${moimtype}${cri.getListLink()}"
					class="button primary small">목록 보기</a>
				<br>
				<br>
				<div class="col-12">
					<form method="post" action="/moim/recruitremove">
						<input type="hidden" value="${moimtype}" name="moimtype">
						<input type="hidden" value="${cri.pageNum}" name="pageNum">
						<input type="hidden" value="${cri.amount}" name="amount">
						<div class="col-12">
							<h4>번호</h4>
							<input type="text" name="recruitnum" value="${board.recruitnum}" readonly>
						</div>
						<hr>
						<div class="col-12">
							<h4>제목</h4>
							<input type="text" name="recruittitle" value="${board.recruittitle}" readonly>
						</div>
						<hr>
						<div class="col-12">
							<h4 style="text-align: center;">모임 정보</h4>
							
							<h5>모임 이름</h5>
							<input type="text" value="${moim.moimname}" readonly><br>
							
							<h5>출발 날짜</h5>
							<input type="text" value="${moim.startdate}" readonly><br>
							
							<h5>도착 날짜</h5>
							<input type="text" value="${moim.enddate}" readonly><br>
							
							<h5>여행지</h5>
							<input type="text" value="${place.placename}" readonly><br>
							
							<h5>여행지 주소</h5>
							<input type="text" value="${place.placeroadaddr}" readonly><br>
							
							<h5>예산</h5>
							<input type="text" value="${moim.moimbudget}원" readonly><br>
							
							<h5>멤버</h5>
							<input type="text" value="${moim.userid}" readonly><br>
						</div>
						<hr>
						<div class="col-12">
							<h4>내용</h4>
							<textarea name="recruitcontents" rows="10" style="resize: none;"
								readonly>${board.recruitcontents}</textarea>
						</div>
						<hr>
						<div class="col-12">
							<h4>작성자</h4>
							<input type="text" name="userid" value="${board.userid}" readonly>
						</div>
						<hr>
						<div class="col-12">
							<c:if test="${board.userid == sessionScope.user.userId}">
								<input type="button" value="수정" class="primary"
									onclick="location.href='/moim/recruitmodify${cri.getListLink()}&recruitnum=${board.recruitnum}&moimnum=${moim.moimnum}&moimtype=${moimtype}'">
								<input type="submit" value="삭제" class="primary">
							</c:if>
						</div>
					</form>
					<hr>
					<h3 style="text-align: center;">댓 글</h3>
					<a href="#" class="button primary joinmoimreq">모임 참가 신청</a>
					<a href="#" class="button primary regist">댓글 등록</a>
					<br>
					<br>
					<div class="replyForm row" style="display: none;">
						<div style="width: 15%;">
							<h4>작성자</h4>
							<input name="replywriter" type="text" value="${sessionScope.user.userId}" readonly>
						</div>
						<div style="width: 65%;">
							<h4>내용</h4>
							<textarea name="replycontents" rows="2" style="resize: none;"
								placeholder="Contents"></textarea>
						</div>
						<div style="width: 10%; margin-left: 1%" class="row">
							<h4 style="margin-bottom: 1.3rem !important;">&nbsp;</h4>
							<a href="#" style="margin-bottom: 0.7rem;"
								class="button primary small finish">등록</a>
							<a href="#"
								class="button primary small cancel">취소</a>
						</div>
					</div>
					
					<!-- 댓글 띄우는 ul -->
					
					<ul class="alt replies"></ul>
					
					<!-- 댓글 페이징 처리할 div -->
					
					<div class="page" style="text-align: center;"></div>
				</div>
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
<script src="/resources/assets/js/reply.js"></script>
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
   //어떤 게시글의 댓글인지
   let boardnum = "${board.recruitnum}"
   //누가 썼는지
   let replywriter = $("input[name='replywriter']").val();
   //어떤 내용인지
   let replycontents = $("textarea[name='replycontents']").val();
   //Ajax 코드는 reply.js에 모듈화 시켜놓았다. 그 모듈화된 파일에 있는 replyService 객체 이용
   //replyService.add(데이터객체,성공시 호출할 함수, 실패시 호출할 함수)
   //흐름이 reply.js에 있는 add로 흐름 이동
   replyService.add(
         //{boardnum:위의boardnum변수의값, replywriter:위의replywriter변수의값, replycontents:위의replycontents변수의값}
         {boardnum:boardnum,replywriter:replywriter,replycontents:replycontents},
         //성공시 호출할 함수
         function(result){
            alert("등록 완료");
            location.reload();
         },
         //실패시 호출할 함수
         function(result){
            alert("등록 실패");
         }
   );
   //DOM으로 뷰단 수정하는 코드로 바꾸기
})

/* 댓글 목록과 페이징처리 띄워주는 코드 */
//$(document).ready(함수) : 문서가 준비 완료 되었다면 넘겨주는 함수 호출
$(document).ready(
   function(){
      //어떤 게시글의 댓글들을 불러와야 하는지
      let boardnum = "${board.recruitnum}";
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
         replyService.getList(
            //게시글번호, 띄워야할페이지 정보를 가지고 있는 객체
            {boardnum : boardnum, page : page || 1},
            
            function(replyCnt,list){
               if(list == null || list.length == 0){
                  //DB에서 검색해온 댓글 목록이 없을경우에는
                  //댓글 목록을 띄울 ul태그 안에 "댓글이 없습니다." 문자열 넣기
                  replies.html("<li>댓글이 없습니다.</li>");
                  return;
               }
               //댓글 목록 DOM으로 띄우기
               let str = "";
               //for문을 댓글목록의 길이만큼 반복하면서
               for(let i=0, len = list.length; i<len; i++){
                  //댓글 목록 띄울 ul태그 안에 들어갈 html 요소 등을 댓글 한개마다 달아준다.
                  //비어있는 str문자열에 연결로 이어준다.
                  str += "<li style='clear:both'><div style='display:inline;float:left;'>";
                  str += "<strong class='replywriter"+list[i].replynum+"'>" + list[i].replywriter + "</strong>"
                  str += "<p class='reply" + list[i].replynum + "'>" + list[i].replycontents + "</p></div>"
                  str += "<div style='text-align:right;'><strong>"
                  //시간 포매팅때 displayTime(댓글의 등록시간) 호출 : 흐름 이동
                  str += replyService.displayTime(list[i].regdate) + "</strong>";
                  str += "<br>"
                  if("${sessionScope.user.userId}" == list[i].replywriter){
                     str += "<a href='"+list[i].replynum+"' class='modify'>수정</a>"
                     str += "<a href='"+list[i].replynum+"' class='mfinish' style='display:none;'>수정완료</a>&nbsp;&nbsp;"
                     str += "<a href='"+list[i].replynum+"' class='remove'>삭제</a>"
                  }
                  str +="</div></li>"
               }
               //ul태그 안에 위의 for문에서 연결누적된 str 써주기
               replies.html(str);
               //페이징 처리하는 함수 호출하기(전체 개수 넘기면서)
               showReplyPage(replyCnt);
               
               //댓글의 수정버튼을 눌렀을 때의 코드
               $(".modify").on("click",function(e){
                  e.preventDefault();
                  let replynum = $(this).attr("href"); //11
                  let replytag = $(".reply"+replynum) //class='reply11' 인 p태그
                  
                  //<textarea class='11'>원래의 댓글 내용</textarea>
                  replytag.html("<textarea class='"+replynum+" mdf'>"+replytag.text()+"</textarea>");
                  $(this).hide();
                  
                  let finishBtns = document.getElementsByClassName("mfinish");
                  for(let i=0; i<finishBtns.length; i++){
                     if(finishBtns[i].getAttribute("href") == replynum){
                        finishBtns[i].style.display="";
                        break;
                     }
                  }
               })
               
               //수정완료 버튼을 눌렀을 때의 코드
               $(".mfinish").on("click",function(e){
                  e.preventDefault();
                  //수정하는 코드
                  let replynum = $(this).attr("href");
                  let boardnum = "${board.recruitnum}"
                  let replywriter = $(".replywriter"+replynum).text();
                  //댓글번호, 바뀐 댓글의 내용
                  replyService.update(
                     {replynum:replynum, replycontents:$("."+replynum).val(), boardnum:boardnum, replywriter:replywriter},
                     function(result){
                        if(result == "success"){
                           alert("수정 완료");
                           location.reload();
                        }
                     }
                  )
               })
               
               //삭제 버튼을 눌렀을 때의 코드
               $(".remove").on("click",function(e){
                  e.preventDefault();
                  replyService.remove(
                     $(this).attr("href"),
                     function(result){
                        if(result == "success"){
                           alert("삭제 완료");
                           location.reload();
                        }
                     }
                  )
               })
            }
         );
      }
      function showReplyPage(replyCnt){
         //replyCnt : 해당 게시글에 달린 댓글의 총 개수      (82개)
         //pageNum : 현재 내가 보고있는 댓글의 페이지번호
         //pageNum는 13으로 가정
         
         //endPage : 페이징 처리의 가장 마지막에 띄워줄 페이지번호(20)
         //            2         1.3         20
         let endPage = Math.ceil(pageNum/10.0)*10;
      
         //startPage : 페이징 처리의 가장 처음에 띄워줄 페이지번호(11)
         let startPage = endPage - 9;
         
         //prev : < 버튼을 만들어야 하는지를 true, false로 가지고 있는 변수
         //startPage가 1이라는 뜻은 내가 보고있는 페이지가 1~10 라는 뜻이다(<이전버튼 만들 필요가 없음)
         let prev = startPage != 1;
         //next : > 버튼을 만들어야 하는지를 true, false로 가지고 있는 변수
         let next = false;
         
         //댓글의 총 개수가 82개 이므로 필요한 페이지는 총 17페이지이다.
         //< 11 12 13 14 15 16 17
         //연산으로 구한 endPage*5보다 전체 개수가 작거나 같다면 뒤에 버려지는 페이지들이 있다는 뜻이다.
         //연산으로 구한 endPage가 아니라 실제 댓글 개수에 따라서 endPage를 구해주어야 한다.
         if(endPage*5>=replyCnt){
            //         17      82      16.4
            endPage = Math.ceil(replyCnt/5.0);
         }
         //endPage*5는 현재 페이징처리를 통해서 띄워줄 수 있는 댓글의 개수
         //그게 replyCnt보다 작다는 뜻은 아직 띄울 댓글들이 남았다는 뜻(페이징처리가 남았다는 뜻)
         if(endPage*5 < replyCnt){
            next = true;
         }
         //핸드폰 환경 :  < 5 >
         //컴퓨터 환경 : 1 2 3 4 5 6 7 8 9 10 >
         //str : pagediv 안에 써줄 문자열을 누적시킬 변수
         let str = "";
         if(matchMedia("screen and (max-width:918px)").matches){
            //핸드폰 환경(자바스크립트로 반응형 개발)
            if(pageNum > 1){
               //이전 페이지가 존재한다면 < 버튼이 필요하다.
               //이전버튼을 누를 때 바로 전 페이지로 이동(a 태그의 href는 현재페이지-1)
               str += "<a class='changePage' href='"+(pageNum-1)+"'><code>&lt;</code></a>";
            }
            //현재 페이지 연결
            str += "<code>"+pageNum+"</code>";
            if(pageNum != endPage){
               //현재 보고있는 페이지가 마지막 페이지가 아니라면 > 버튼이 필요하다.
               //다음버튼을 누를 때 바로 다음 페이지로 이동(a 태그의 href는 현재페이지+1)
               str += "<a class='changePage' href='"+(pageNum+1)+"'><code>&gt;</code></a>";
            }
         }else{
            //컴퓨터 환경
            if(prev){
               //현재 13페이지라면 이전버튼 클릭시 10페이지로 이동
               //현재의 startPage 보다 1 작은 페이지가 이전 페이징의 가장 마지막 페이지이다.
               str += "<a class='changePage' href='"+(startPage-1)+"'><code>&lt;</code></a>";
            }
            //11 12 13 14 15 16 17
            for(let i=startPage; i<=endPage; i++){
               //start : 11 ~ end : 17까지 반복하며 연결
               if(i == pageNum){
                  //i가 현재 페이지번호와 같다면 클릭이 되지 않아야 하므로 <a>태그는 빼주고 연결
                  str += "<code>"+i+"</code>";
               }else{
                  //그 외에는 클릭이 되어야 하므로 <a>태그까지 연결
                  str += "<a class='changePage' href='"+i+"'><code>"+i+"</code></a>";
               }
            }
            if(next){
               //현재의 endPage보다 1 큰 페이지가 다음 페이징의 가장 첫번째 페이지이다.
               str += "<a class='changePage' href='"+(endPage+1)+"'><code>&gt;</code></a>";
            }
         }
         //누적 연결된 str을 pagediv 안에 써준다.(페이징 처리 끝)
         pagediv.html(str);
         
         $(".changePage").on("click",function(e){
            e.preventDefault();
            //$(this) : 현재 클릭된 changePage클래스를 가진 a 태그
            //.attr("href") : 앞의 태그의 속성중 href에 쓰인 값을 get
            let target = $(this).attr("href"); // "4"
            pageNum = parseInt(target); // 4
            showList(pageNum);
         })
      }
      }   
   )
   
   $(".joinmoimreq").on("click",function(e){
      e.preventDefault();
      window.open("/moim/reqpopup/${moim.moimnum}/${moim.userid}","popup","width=1000,height=1000,left=0,right=0")
   })
   
</script>

</html>