<h1>Twith</h1>
<ul>
<li>여행 모임/ 여행 정보 관련 사이트 팀프로젝트입니다.</li>
<li>회원 파트 부분을 맡았습니다.</li>
<li>주 사용 언어는 Java / Spring 프레임워크를 사용하여 제작하였습니다.</li>
</ul>
<h2>Index</h2>
<ol>
<li>로그인/회원가입</li>
<li>아이디/비밀번호 찾기</li>
<li>팔로우/팔로잉 관리</li>
</ol>
<hr />
<h2>1. 로그인/회원가입</h2>
<ul>
<li>user/login 화면입니다.</li>
</ul>
<p><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&amp;fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbfbRix%2FbtrolUjrle5%2F7fCNycFCnxKYc0jbiUVXok%2Fimg.jpg" alt="" /></p>
<ul>
<li>user/login 의 Controller 코드입니다.</li>
</ul>
<pre><code class="language-java">    
   @PostMapping(&quot;/login&quot;) 
   public String login_post(UserDTO user,HttpSession session, RedirectAttributes ra) { 
       log.info(&quot;login......&quot;); 

       UserDTO result = service.login(user); 
       String url = &quot;&quot;; 

      if(result != null) { 
          session.setAttribute(&quot;user&quot;, result); 
          ra.addFlashAttribute(&quot;msg&quot;,true); 
          log.info(&quot;=========로그인 성공=========&quot;); 
          url= &quot;redirect:index&quot;; 
      }else { 
          session.setAttribute(&quot;user&quot;, null); 
          ra.addFlashAttribute(&quot;msg&quot;,false); 
          log.info(&quot;=========로그인 실패=========&quot;); 
          url = &quot;redirect:login&quot;; 
      } 
    return url; 
  
</code></pre>
