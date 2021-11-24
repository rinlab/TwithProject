package com.twith.service;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twith.domain.UserDTO;
import com.twith.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service//서비스 객체임을 표시
public class UserServiceImpl implements UserService{
   
   @Setter(onMethod_ = @Autowired)
   private UserMapper mapper;
   
   @Override
   public void join(UserDTO user) {
      log.info("------sign-up------");
      mapper.join(user);
   }

   @Override
   public int checkId(String userId) {
	   int cnt = mapper.checkId(userId);
	   return cnt;
	   
//      log.info("------checkId------");
//      return mapper.checkId(userId)!=1;
//      //결과값이 1이 아니면 (0이면) true, 중복된 값이 없다는 뜻
   }

	/*@Override
	public boolean login(String userId, String userPw) {
		String result = mapper.login(userId, userPw);
		//String getUserId = user.getUserId();
		
		return userId == result;
	}*/

	@Override
	public UserDTO login(UserDTO user) {
		
		return mapper.login(user);
	}
   
	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(UserDTO user, String code) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com, 구글 smtp.gmail.com
		String hostSMTPid = "twithkorea@gmail.com";
		String hostSMTPpwd = "twithkoreait*";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "twithkorea@gmail.com";
		String fromName = "Twith";
		String subject = "";
		String msg = "";

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

		// 받는 사람 E-Mail 주소
		String mail = user.getUserEmail();
		String userName = user.getUserName();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587 , 구글 465

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, userName);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	@Override
	public String findPw(UserDTO user){
		log.info("----findPwService-----"+user);
		String code = "";
		//입력한 userEmail
		String userEmail = user.getUserEmail();
		//입력한 userEmail이 존재한다면
		if(mapper.getUser(userEmail) != null) {
			String userName = mapper.getUser(userEmail).getUserName();
			String userId = mapper.getUser(userEmail).getUserId();
			user.setUserName(userName);
			//입력한 이메일로 찾은 userId와 내가 입력한 userId가 같다면
			if(userId.equals(user.getUserId())) {
				// 인증번호 생성
				for(int i=0; i<4; i++) {
					code += ((int)(Math.random() * 10))+"";
				}
				// 인증번호 메일 발송
				try {
					sendEmail(user, code);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return code;
	}

	@Override
	public UserDTO getUser(String userEmail) {
		log.info("------getUser------");
		UserDTO user = mapper.getUser(userEmail);
		return user;
	}

	@Override
	public String findId(UserDTO user){
		log.info("----findIdService-----"+user);
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

}





