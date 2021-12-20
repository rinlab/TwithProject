# Twith
- 여행 모임/ 여행 정보 관련 사이트 팀프로젝트입니다.
- 회원 파트 부분을 맡았습니다.
- 주 사용 언어는 Java / Spring 프레임워크를 사용하여 제작하였습니다.

## Index

1. 로그인/회원가입
2. 아이디/비밀번호 찾기
3. 팔로우/팔로잉 관리

-----
## 1. 로그인/회원가입

- user/login 화면입니다.

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbfbRix%2FbtrolUjrle5%2F7fCNycFCnxKYc0jbiUVXok%2Fimg.jpg)

- user/login 의 Controller 코드입니다.

~~~java
    
   @PostMapping("/login") 
   public String login_post(UserDTO user,HttpSession session, RedirectAttributes ra) { 
       log.info("login......"); 

       UserDTO result = service.login(user); 
       String url = ""; 

      if(result != null) { 
          session.setAttribute("user", result); 
          ra.addFlashAttribute("msg",true); 
          log.info("=========로그인 성공========="); 
          url= "redirect:index"; 
      }else { 
          session.setAttribute("user", null); 
          ra.addFlashAttribute("msg",false); 
          log.info("=========로그인 실패========="); 
          url = "redirect:login"; 
      } 
    return url; 
   }

~~~

