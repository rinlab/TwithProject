package com.twith.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.twith.domain.Criteria;
import com.twith.domain.FireMoimDTO;
import com.twith.domain.MoimChatDTO;
import com.twith.domain.MoimDTO;
import com.twith.domain.MoimJoinDTO;
import com.twith.domain.PageDTO;
import com.twith.domain.PlaceDTO;
import com.twith.domain.RecruitDTO;
import com.twith.domain.ReplyDTO;
import com.twith.domain.ReplyPageDTO;
import com.twith.domain.UserDTO;
import com.twith.service.MoimService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/moim/*")
public class MoimController {
	@Setter(onMethod_ = @Autowired)
	private MoimService service;

	@GetMapping("/make")
	public void make() {
		log.info("--------make--------");
		// DB 검색
	}

	@PostMapping("/make")
	public String regist(MoimDTO moim, PlaceDTO place) {
		log.info("------regist------");
		if (!service.checkPlace(place)) {
			service.registPlace(place);
		}
		int placenum = service.getPlacenum(place);
		moim.setPlacenum(placenum);

		service.makeMoimMemeber(service.regist(moim));

		return "redirect:/moim/mymoim";
	}

	@GetMapping("/mymoim")
	public void mymoim(HttpSession session, Model model) {
		log.info("------mymoim------");
		String userid = ((UserDTO)session.getAttribute("user")).getUserId();
		model.addAttribute("moims", service.getMymoim(userid));
		List<Integer> moimnums = service.getFiremoimnum(userid);
		ArrayList<MoimDTO> moimDetails = new ArrayList<>();
		for (int moims : moimnums) {
			moimDetails.add(service.getMoim(moims));
		}
		model.addAttribute("fireMoims", moimDetails);

	}

	@GetMapping(value = "/get/{moimnum}")
	public String get(@PathVariable int moimnum, Model model) {
		log.info("----moimnum----\n" + moimnum);

		MoimDTO moim = service.getMoim(moimnum);
		List<String> members = service.getMembers(moimnum);

		ArrayList<UserDTO> memberDetails = new ArrayList<>();
		for (String member : members) {
			memberDetails.add(service.getMemberDetail(member));
		}

		model.addAttribute("moim", moim);
		model.addAttribute("place", service.getPlace(moim.getPlacenum()));
		model.addAttribute("members", memberDetails);
		return "/moim/get";
	}

	@GetMapping("/recruitregist")
	public void regist(HttpSession session, @ModelAttribute("cri") Criteria cri, Model model, int moimtype) {
		// @ModelAttribute : model.addAttribute("cri",cri);
		String login_id = ((UserDTO)session.getAttribute("user")).getUserId();
		model.addAttribute("moimtype", moimtype);
//		model.addAttribute("moimlist", service.getMoimById(login_id));
		List<MoimDTO> moimlist = service.getMoimById(login_id);
		ArrayList<MoimDTO> moimarraylist = new ArrayList<>();
		for(MoimDTO moim : moimlist) {
			if(moim.getMoimtype()==moimtype) {
				moimarraylist.add(moim);
			}
		}
		model.addAttribute("moimlist", moimarraylist);
	}

	@PostMapping("/recruitregist")
	public String regist(RecruitDTO recruit, RedirectAttributes ra, int moimtype) {
		service.recruitregist(recruit);

		// 새롭게 등록한 게시글의 번호를 같이 전달하기 위해서는
		// Model 대신 RedirectAttributes를 사용한다.
		ra.addFlashAttribute("result", recruit.getRecruitnum());

		// redirect: 접두어를 사용하면 스프링 MVC가 자동으로 redirect로 처리해준다.
		return "redirect:/moim/recruitlist/" + moimtype;
	}

	@GetMapping(value = "/recruitlist/{moimtype}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String recruitlist(Criteria cri, Model model, @PathVariable("moimtype") int moimtype) {
		log.info("------recruitlist------" + moimtype);
		// DB 검색
		List<RecruitDTO> recruits = service.getList(cri);
		ArrayList<RecruitDTO> realrecruit = new ArrayList<>();
		for (RecruitDTO recruit : recruits) {
			if (moimtype == service.getmoimType(recruit.getMoimnum())) {
				realrecruit.add(recruit);
			}
		}
		model.addAttribute("list", realrecruit);
		model.addAttribute("moimtype", moimtype);
		model.addAttribute("pageMaker", new PageDTO(service.getTotal(cri), cri));
		return "moim/recruitlist";
	}

	@GetMapping("/recruitget")
	public void recruitget(int recruitnum, @ModelAttribute("cri") Criteria cri, Model model, int moimtype) {
		log.info("----------recruitget----------");
		RecruitDTO recruit = service.get(recruitnum);
		MoimDTO moim = service.getMoim(recruit.getMoimnum());
		PlaceDTO place = service.getPlace(moim.getPlacenum());
		if (service.readcntUP(recruit)) {
			model.addAttribute("board", recruit);
		}
		model.addAttribute("moimtype", moimtype);
		model.addAttribute("place", place);
		model.addAttribute("moim", moim);
	}

	@GetMapping("/recruitmodify")
	public void recruitmodify(int recruitnum, int moimnum, @ModelAttribute("cri") Criteria cri, Model model,
			HttpSession session, int moimtype) {
		log.info("----------recruitmodify----------");
		model.addAttribute("moimnum", moimnum);
		model.addAttribute("board", service.get(recruitnum));
		model.addAttribute("moimtype", moimtype);
		String login_id = ((UserDTO)session.getAttribute("user")).getUserId();
//		model.addAttribute("moimlist", service.getMoimById(login_id));
		List<MoimDTO> moimlist = service.getMoimById(login_id);
		ArrayList<MoimDTO> moimarraylist = new ArrayList<>();
		for (MoimDTO moim : moimlist) {
			if(moim.getMoimtype()==moimtype) {
				moimarraylist.add(moim);
			}
		}
		model.addAttribute("moimlist", moimarraylist);
	}

	@PostMapping("/recruitmodify")
	public String modify(RecruitDTO recruit, Criteria cri, RedirectAttributes ra, int moimtype) {
		log.info("--------recruitmodify---------");
		if (service.recruitmodify(recruit)) {
			ra.addFlashAttribute("modify", recruit.getRecruitnum());
		}

		return "redirect:/moim/recruitlist/"+moimtype+ cri.getListLink();
	}

	@GetMapping(value = "/reqpopup/{moimnum}/{moimking}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String reqpopup(HttpSession session, Model model, @PathVariable("moimnum") int moimnum,
			@PathVariable("moimking") String moimking) {
		log.info("---------reqpopup-------");
//		session.setAttribute("login_id", "join");
		String login_id = ((UserDTO)session.getAttribute("user")).getUserId();
		model.addAttribute("login_id", login_id);
		model.addAttribute("moimnum", moimnum);
		model.addAttribute("moimking", moimking);
		return "moim/reqpopup";
	}

	@PostMapping(value = "/sendreq", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> sendreq(@RequestBody MoimJoinDTO data) {
		log.info("MoimJoinDTO : " + data);
		// DB처리
		boolean result = service.sendreq(data);
		log.info(result);
		return result ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PostMapping("/manage")
	public void manage(int moimnum, Model model) {
		log.info("-----manage----");
		model.addAttribute("list", service.getApplicant(moimnum));
		model.addAttribute("moimnum", moimnum);
	}

	@GetMapping(value = "/joinDetail/{moimjoinnum}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String detail(@PathVariable("moimjoinnum") int moimjoinnum, Model model) {
		log.info("-----detail-----");
		model.addAttribute("joindetail", service.getJoinDetail(moimjoinnum));

		return "/moim/joinDetail";

	}

	@PostMapping(value = "/yes", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> yes(@RequestBody MoimJoinDTO data) {
		log.info("MoimJoinDTO : " + data);
		// DB처리
		MoimDTO moim = new MoimDTO();
		moim.setMoimnum(data.getMoimnum());
		moim.setUserid(data.getJoinuserid());
		log.info("----ㅋㅋㅋ-----");
		log.info(data);
		service.makeMoimMemeber(moim);
		boolean result = service.removeJoin(data.getMoimjoinnum());
		return result ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PostMapping(value = "/no", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> no(@RequestBody MoimJoinDTO data) {
		log.info("moimjoinnum : " + data.getMoimjoinnum());
		// DB처리
		log.info("----ㅋㅋㅋ-----");
		boolean result = service.removeJoin(data.getMoimjoinnum());
		return result ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping("/ban")
	public void ban(int moimnum, Model model) {
		log.info("-----ban-----");

		List<String> members = service.getMembers(moimnum);
		ArrayList<UserDTO> memberDetail = new ArrayList<>();
		for (String member : members) {
			memberDetail.add(service.getMemberDetail(member));
		}

		model.addAttribute("members", memberDetail);
		model.addAttribute("moimnum", moimnum);
	}

	@PostMapping(value = "/registchat", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> registchat(@RequestBody MoimChatDTO moimchat, HttpSession session) {
		log.info("------registchat------");
		moimchat.setUserid(((UserDTO)session.getAttribute("user")).getUserId());
//		moimchat.setUserid("banana");

		boolean result = service.registChat(moimchat);

		return result ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/getchat")
	public ResponseEntity<List<MoimChatDTO>> getchat(int moimnum) {
		log.info("-----getchat-----");

		return new ResponseEntity<>(service.getChat(moimnum), HttpStatus.OK);
	}

	@GetMapping("/cancelMoim")
	public String cancelMoim(int moimnum) {
		log.info("------cancel-----");
		service.deleteAllMember(moimnum);
		service.deleteChat(moimnum);
		service.deleteMoimRecruit(moimnum);
		service.deleteMoimJoin(moimnum);
		service.cancelMoim(moimnum);

		return "redirect:/moim/mymoim";

	}

	@GetMapping("/updateMoim")
	public void updateMoim(int moimnum, Model model) {
		log.info("-----update----");
		MoimDTO moim = service.getMoim(moimnum);
		model.addAttribute("moim", moim);
		PlaceDTO place = service.getPlace(moim.getPlacenum());
		model.addAttribute("place", place);
	}

	@PostMapping("/updateMoim")
	public String updateMoim(MoimDTO moim, PlaceDTO place) {
		log.info("------updatemoim----");
		if (!service.checkPlace(place)) {
			service.registPlace(place);
		}
		int placenum = service.getPlacenum(place);
		moim.setPlacenum(placenum);

		service.updateMoim(moim);

		return "redirect:/moim/get/" + moim.getMoimnum();
	}

//	@GetMapping(value = "/joinDetail/{moimjoinnum}", produces = { MediaType.APPLICATION_XML_VALUE,
//			MediaType.APPLICATION_JSON_UTF8_VALUE })
//	public String detail(@PathVariable("moimjoinnum") int moimjoinnum, Model model) {
//		log.info("-----detail-----");
//		model.addAttribute("joindetail", service.getJoinDetail(moimjoinnum));
//
//		return "/moim/joinDetail";
	@GetMapping(value = "/fireMessage")
	public void fireMessage(FireMoimDTO fire, Model model) {
		log.info("----fire-----");
		log.info(fire);
		model.addAttribute("fire", fire);
	}

	@PostMapping(value = "/fireMessage", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE, produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public void fireMessage(@RequestBody FireMoimDTO fire) {
		log.info("------message-----");
		log.info(fire);
		service.setMessage(fire);
		service.outMember(fire.getUserId());
	}

	@GetMapping(value = "/readFireMessage/{moimnum}")
	public String readFireMessage(@PathVariable("moimnum") int moimnum, HttpSession session, Model model) {
		FireMoimDTO firemoim = new FireMoimDTO();
		firemoim.setMoimnum(moimnum);
		firemoim.setUserId(((UserDTO)session.getAttribute("user")).getUserId());
		model.addAttribute("fire", service.getFireDetail(firemoim));

		return "/moim/readFireMessage";
	}

	@PostMapping("/recruitremove")
	public String remove(int recruitnum, Criteria cri, RedirectAttributes ra, int moimtype) {
		log.info("--------remove---------" + recruitnum);
		if (service.replyDeleteAll(recruitnum)) {
			if (service.removerecruit(recruitnum)) {
				ra.addFlashAttribute("remove", recruitnum);
			}
		}
		return "redirect:/moim/recruitlist/" + moimtype + cri.getListLink();
	}

	// ResponseEntity : 서버의 상태코드, 응답 메세지 등을 담을 수 있는 타입
	// @RequestBody : JSON 대이터를 해석해서 ReplyDTO 타입으로 변환하도록 지정한다.
	// consumes와 produces를 통해서 JSON 방식의 데이터만 처리하도록 한다.
	@PostMapping(value = "/replyregist", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> replyregist(@RequestBody ReplyDTO reply) {
		log.info("ReplyDTO : " + reply);
		// DB처리
		boolean result = service.replyregist(reply);
		return result ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 댓글 전체 목록
	// /pages/2323/2
	@GetMapping(value = "/replypages/{boardnum}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	// Path에 포함되어 있는 boardnum, page 데이터 추출해서 매개변수에 넣기
	public ResponseEntity<ReplyPageDTO> replygetList(@PathVariable("boardnum") int boardnum,
			@PathVariable("page") int page) {
		log.info("------replygetList(reply)--------");
		log.info("boardnum : " + boardnum + " / page : " + page);
		// 댓글 또한 페이지번호와, 한 페이지에 띄울 개수 가 필요하므로 게시글리스트 페이징 처리 때 이용한 Criteria를 재사용한다.
		Criteria cri = new Criteria(page, 5);
		// ReplyPageDTO타입의 객체
		return new ResponseEntity<>(service.replygetList(cri, boardnum), HttpStatus.OK);
	}

//	      @DeleteMapping : REST 방식 이용시 삭제 요청을 보낼 때 사용
	@DeleteMapping(value = "/deletereply/{replynum}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> replyremove(@PathVariable("replynum") int replynum) {
		log.info("REPLYREMOVE : " + replynum);
		return service.replyremove(replynum) ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// /reply/11
	// 댓글수정
	// PUT
	// 모든 데이터들을 다 전달해야 함, 자원의 전체 수정, 자원 내 모든 필드를 전달해야 함, 전달되지 않은 필드는 모두 초기화 처리가 된다.
	// PATCH
	// 자원의 일부 수정, 수정할 필드만 전송
	// PUT, PATCH 둘 다 사용 가능
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/updatereply/{replynum}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> replymodify(@RequestBody ReplyDTO reply) {
		log.info("REPLYMODIFY : " + reply.getReplynum());
		if (service.replymodify(reply)) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
