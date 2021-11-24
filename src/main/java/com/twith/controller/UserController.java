package com.twith.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.twith.domain.UserDTO;
import com.twith.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/*")
@Log4j
public class UserController {
   @Setter(onMethod_ = @Autowired)
   private UserService service;
   
   @RequestMapping("/index")
   public void index() {
      //log.info("basic.......");
      log.info("index.......");
   }
   
/* @RequestMapping("/login")
   public void login() {
	   
   }*/
   
   @GetMapping("/login")
   public String login_get(UserDTO user,HttpSession session) {
	return "user/login";
   }
   
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
   
   @PostMapping("/checkId")
   @ResponseBody
   public int checkId(@RequestParam("userId") String userId){
       log.info("userIdCheck 진입");
       log.info("전달받은 id:"+userId);
       int cnt = service.checkId(userId);
       log.info("확인 결과:"+cnt);
       return cnt;
   }
   
   @PostMapping("/checkEmailJoin")
   @ResponseBody
   public boolean checkEmailJoin(@RequestParam("userEmail") String userEmail){
       log.info("/checkEmailJoin 진입");
       log.info("전달받은 id:"+userEmail);
       boolean result = false;
       if(service.getUser(userEmail) == null) {
    	   //검색된 결과가 null이어야 true : 중복된 결과가 없다는 뜻
    	   result = true;
       }
       return result;
   }
   
   @RequestMapping("/join")
   public void join() {
      log.info("join......");
   }
   
   @PostMapping("/join")
	public String join(UserDTO user,RedirectAttributes ra) {
		service.join(user);
		
		//새롭게 등록한 게시글의 번호를 같이 전달하기 위해서는
		//Model 대신 RedirectAttributes를 사용한다.
		ra.addFlashAttribute("result", user.getUserId());
		
		//redirect: 접두어를 사용하면 스프링 MVC가 자동으로 redirect로 처리해준다.
		return "redirect:/user/index";
	}
   
   @RequestMapping(value="logout", method=RequestMethod.GET)
   public String logout(HttpServletRequest request) throws Exception{
       
       log.info("logout......");
       
       HttpSession session = request.getSession();
       
       session.invalidate();
       
       log.info("======로그아웃 성공======");
       
       return "redirect:/user/index";  
   }
   
   /* 비밀번호 찾기 */
   	
   @RequestMapping("/findPw")
   public void findPwGet() {
       log.info("------findPwGet-------");
   }
   
    @PostMapping("/findPw")
    public String findPwPost(UserDTO user, RedirectAttributes ra) {
        log.info("------findPwPost-------");
        String url = "";
        log.info("userId : "+user.getUserId());
        log.info("userEmail : "+user.getUserEmail());
        String code = "";
        code = service.findPw(user);
        if(code == "") {
        	log.info(code);
    		ra.addFlashAttribute("result", false);
    		url = "redirect:findPw";
    	}else{
    		ra.addFlashAttribute("result", "code");
    		ra.addFlashAttribute("code", code);
    		ra.addFlashAttribute("getUser", user);
    		url = "redirect:checkEmail";
    	}
        return url;
    }
    
    @RequestMapping("/findId")
    public void findIdGet() {
    	log.info("------findIdGet-------");
    }
    
    @PostMapping("/findId")
    public String findIdPost(UserDTO user, RedirectAttributes ra) {
        log.info("------findIdPost-------");
        String url = "";
        log.info("userName : "+user.getUserName());
        log.info("userEmail : "+user.getUserEmail());
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
   	
    @GetMapping("/checkEmail")
    public void checkEmailGet() {
        log.info("------checkEmailGet-------");
    }
	
    @PostMapping("/checkEmail")
    public String checkEmailPost(String userEmail, RedirectAttributes ra) {
        log.info("------checkEmailPost-------");
        UserDTO getUser = service.getUser(userEmail);
        log.info("비밀번호 : "+getUser.getUserPw());
    	try {
			service.sendEmail(getUser, getUser.getUserPw());
			ra.addFlashAttribute("result", "userPw");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:login";
    }
	
    @GetMapping("/mypage")
    public String mypageGet(HttpServletRequest request) {
 	return "user/mypage";
    }
    
    @GetMapping("/myInfoModify")
    public String myInfoModifyGet(HttpServletRequest request) {
    	return "user/myInfoModify";
    }
   
}

















