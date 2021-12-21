<p align="center"><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FJXO6s%2FbtrgvSMeYFk%2FKYmgNkWPVOSnlmpugK6ahk%2Fimg.png" width="500"/></p>

# Twith
- 여행 모임/ 여행 정보 관련 사이트 팀프로젝트입니다.
- 회원 파트 부분을 맡았습니다.
- 주 사용 언어는 Java / Spring 프레임워크를 사용하여 제작하였습니다.
<br>
<i>PS. 로고는 <b>Travle + With</b> 을 줄여서 <b>TWith (같이 여행가자)</b> 라는 의미로 <b>직접 제작해보았습니다 :)</b> </i>

## Index

1. 로그인/회원가입
2. 아이디/비밀번호 찾기
3. 팔로우/팔로잉 관리

-----
### 1. 로그인/회원가입

> **로그인**
- user/login 화면입니다.

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbfbRix%2FbtrolUjrle5%2F7fCNycFCnxKYc0jbiUVXok%2Fimg.jpg)

- user/login 의 Controller 코드입니다.

~~~javascript
    
   @PostMapping("/login") 
   public String login_post(UserDTO user,HttpSession session, RedirectAttributes ra) { 
       log.info("login......"); 

       UserDTO result = service.login(user); 
       String url = ""; 

      if(result != null) { 
          session.setAttribute("user", result); 
          ra.addFlashAttribute("msg",true); 
          url= "redirect:index"; 
      }else { 
          session.setAttribute("user", null); 
          ra.addFlashAttribute("msg",false); 
          url = "redirect:login"; 
      } 
    return url; 
   }

~~~

- Controller에서 msg에 값을 받아와서 jsp에서 알맞은 팝업을 띄워줍니다.
~~~java
<c:if test="${msg == true}"> 
	<script>alert('${user.userId}님 환영합니다 :)');</script> 
</c:if> 
<c:if test="${!empty result}"> 
	<script>alert('회원가입을 환영합니다. 로그인을 해주세요 :)');</script> 
</c:if>
~~~

<p align="center"><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcWMUA5%2FbtroxAwFnRj%2FXsbmYakUQgGfh587HL0dqk%2Fimg.png" width="500"/></p>

- user/login 의 sql문입니다.

~~~sql
<select id="login" resultType="com.twith.domain.UserDTO"> 
	SELECT * FROM TW_USER WHERE USERID=#{userId} AND USERPW=#{userPw} 
</select>
~~~

<br>

> **회원가입**
- user/join 화면입니다.

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FYwWht%2Fbtrox11URNT%2FaLhKR3jicpialI4ERNlCiK%2Fimg.png)

- user/join 의 Controller 코드입니다.
~~~java
@PostMapping("/join") 
public String join(UserDTO user,RedirectAttributes ra) { 
	service.join(user); 
	ra.addFlashAttribute("result", user.getUserId()); 

	return "redirect:/user/index"; 
}
~~~
<br>

- 중복체크를 누르면 onclick 함수를 통하여 ajax로 '사용가능/불가능 문구를 띄워줍니다.'
- 중복체크(checkId) 함수 코드입니다.

~~~javascript
function checkId() {
	let idInput = document.joinform.userId;
	let userId = idInput.value;
	let spanTag = document.getElementById('idCheck');
	if (userId == "" || userId == null) {
		alert("아이디를 입력하세요!");
		idInput.focus();
		return false;
	}
	if (userId.length < 5 || userId.length > 7) {
		alert("아이디는 5자리 이상 7자리 이하로 입력하세요!");
		idInput.value=null;
		idInput.focus();
		return false;
	}
	let hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	if (hangle.test(userId)) {
		alert("아이디에는 한글을 쓸 수 없습니다!");
		idInput.value=null;
		idInput.focus();
		return false;
	}
	$.ajax({
		url : "/user/checkId?userId="+userId,
		type : 'POST',
		dataType : 'text',
		success : function(cnt) {
			console.log(cnt);
			if (cnt != "<Integer>1</Integer>") {
				spanTag.innerHTML = "사용 가능한 아이디입니다."
			} else {
				spanTag.innerHTML = "중복된 아이디입니다."
			}
		},
		error : function() {
			console.log("ajax실패");
		}
	})
}
~~~

- user/join 의 sql문입니다.
~~~java
<insert id="join">
	INSERT INTO TW_USER (USERNUM,USERID,USERPW,USERNAME,USERNICKNAME,USERPHONE,USEREMAIL,USERREGDATE)
	VALUES(TW_USER_SEQ.NEXTVAL,#{userId},#{userPw},#{userName},#{userNickname},#{userPhone},#{userEmail},SYSDATE)
</insert>
~~~
-----
### 2. 아이디/비밀번호 찾기

> 아이디는 이름과 이메일로, 비밀번호는 아이디와 이메일로 찾습니다.

- user/findId 화면입니다.

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdQJ0Xk%2Fbtroswblwaa%2F7mTXmm5kBINEYjjoNGulK0%2Fimg.png)


- findId 의 Controller 의 코드입니다.
~~~java
@PostMapping("/findId")
    public String findIdPost(UserDTO user, RedirectAttributes ra) {
        String url = "";
        String code = service.findId(user);
        if(code == "") {
    		ra.addFlashAttribute("result", false);
    		url = "redirect:findId";
    	}else{
			ra.addFlashAttribute("result", "userId");
    		url = "redirect:login";
    	}
        return url;
    }
~~~
- findId 의 ServiceImpl 코드입니다.
~~~java
	public String findId(UserDTO user){
		String code = "";
		//입력한 userEmail
		String userEmail = user.getUserEmail();
		//입력한 userEmail이 존재한다면
		if(mapper.getUser(userEmail) != null) {
			//입력한 이메일로 검색한 userName
			String userName = mapper.getUser(userEmail).getUserName();
			//입력한 이메일로 찾은 userName과 내가 입력한 userName이 같다면
			if(userName.equals(user.getUserName())) {
				// 아이디 메일 발송
				code = mapper.getUser(userEmail).getUserId();
				try {
					sendEmail(user, code);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return code;
	}
~~~
- 메일서버(SMTP)를 이용하여 메일을 보낼 때 각 상황에 맞게 제목과 내용을 바꿔 보냅니다.

<p align="center"><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbB4YmF%2FbtroxAQ8QPz%2FkyHrX0MU0wOG45bbIPG2KK%2Fimg.png" width="500"/></p>

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbCwZ1g%2Fbtrox1npMhB%2Fy3vPDj9KqP3B29IYBiS6vK%2Fimg.png)

- sendEmail 의 ServiceImpl 코드 일부입니다.
~~~java
	if(code.length() < 5) {
		subject = "TWith 이메일 인증코드입니다.";
	}else if(code.length() >= 5 && code.length() <= 7){
		subject = "TWith 아이디입니다.";
	}else{
		subject = "TWith 비밀번호입니다.";
	}
		msg += "<div align='center' style='padding:40px 0; background-color:#f3f3f3;'>";
		msg += "<img src='https://blog.kakaocdn.net/dn/JXO6s/btrgvSMeYFk/KYmgNkWPVOSnlmpugK6ahk/img.png' width='300px' style='margin-bottom: 10px;'>";
		msg += "<div style='background-color:#dcad2f; width:150px; height:5px;margin:0 auto;'></div>";
		msg += "<h3 style='margin-top:25px; font-family:SBAggroB;'>";
		if(code.length() < 5) {
			msg += user.getUserId() + "님의 이메일 인증코드는 ";
		}else if(code.length() >= 5 && code.length() <= 7) {
			msg += user.getUserName() + "님의 아이디는 ";
		}else {
			msg += user.getUserId() + "님의 비밀번호는 ";
		}
		msg += "<span style='background-color:#b3ccff;'>";
		msg += code;
		msg += "</span>";
		msg += "입니다.</h3>";
		msg += "<h3 style='font-family:SBAggroB;'>이용해주셔서 감사합니다.</h3></div>";
~~~

-----
### 3. 팔로우/팔로잉 관리
> 팔로잉리스트 불러오기

- follow/following 화면입니다.

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbO6mTU%2FbtrorCC93xu%2FPk11aWC5CRRUzTkdvkFyak%2Fimg.png)

- followingList(팔로잉 리스트)를 불러오는 Controller 코드입니다.
~~~java
@GetMapping("/following")
	public void main(Model model, HttpServletRequest request, Criteria cri) {
		// 세션에 userId를 받아오기 위해 Criteria의 userId 적용 후 아래 코드를 통해 세션 적용
		cri.setUserId(((UserDTO)request.getSession().getAttribute("user")).getUserId());
		//DB 검색
		model.addAttribute("list",service.getFollowingList(cri));
		model.addAttribute("pageMaker",new PageDTO(service.getFollowingTotal(cri), cri));
	}
~~~

- session으로 followingList를 불러오는 sql문입니다.
~~~sql
<select id="getFollowingList" resultType="com.twith.domain.FollowDTO">
		SELECT FOLLOWNUM, USERID, FOLLOWID, FOLLOWDATE FROM TW_FOLLOW WHERE USERID=#{userId}
</select>
~~~
<br>

> 팔로우를 추가할 때 나 자신은 팔로우 추가 불가 & 이미 팔로우 한 사람 중복 추가 불가
- addFollow 의 Controller 코드입니다.
<p align="center"><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F3oOF2%2FbtrosxnSoma%2FJkNAqIFAAOF1ha95lwu1o1%2Fimg.png" width="500"/></p>

<p align="center"><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FDKIBc%2FbtroxjvmkCY%2F8DfRabD5JJ5EOEep1Afts0%2Fimg.png" width="500"/></p>


~~~java
@GetMapping("/addFollow")
	public String addFollow(Model model, HttpServletRequest request, FollowDTO follow, RedirectAttributes ra, Criteria cri) {		
		String url = "";
		// follow.setUserId(((UserDTO)request.getSession().getAttribute("user")).getUserId());
		if(!(follow.getFollowId().equals(((UserDTO)request.getSession().getAttribute("user")).getUserId()))) {
			//db에 있는 follow테이블의 기존 데이터 중
			//session의 followId와 팔로우 하려는 followId가
			//중복된 데이터가 없다면 addFollow 서비스 실행하기
			int cnt = service.checkFollowId(follow);
			if(cnt != 1) {
				if(service.addFollow(follow)) {
					ra.addFlashAttribute("list",service.getFollowingList(cri));
					ra.addFlashAttribute("result","팔로우 추가 성공");
					ra.addFlashAttribute("followId",follow.getFollowId());
					url = "redirect:/follow/following";
				}
			}else {
				ra.addFlashAttribute("result","중복 유저 팔로우 추가 불가");
				ra.addFlashAttribute("followId",follow.getFollowId());
				url = "redirect:/follow/search";
			}
		}else {
			ra.addFlashAttribute("result","셀프 팔로우 추가 불가");
			url = "redirect:/follow/search";
		}
~~~
- checkFollowId 의 sql문을 통해서 팔로우하려는 아이디가 중복되는지 확인하기
~~~sql
<select id="checkFollowId" resultType="_int">
	SELECT COUNT(*) FROM TW_FOLLOW WHERE USERID = #{userId} AND FOLLOWID = #{followId}
</select>
~~~
<br>

> 팔로잉 삭제하는 Controller 코드입니다.
~~~java
@GetMapping("/remove")
	public String remove(Model model, HttpServletRequest request, FollowDTO follow, RedirectAttributes ra, Criteria cri) {
		log.info("------/remove------");
		
		if(service.remove(follow)) {
			ra.addFlashAttribute("list",service.getFollowingList(cri));
		}
		
		return "redirect:/follow/following";
	}
~~~
