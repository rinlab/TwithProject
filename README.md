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
