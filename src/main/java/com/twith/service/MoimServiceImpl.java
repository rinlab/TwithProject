package com.twith.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twith.domain.Criteria;
import com.twith.domain.FireMoimDTO;
import com.twith.domain.MoimChatDTO;
import com.twith.domain.MoimDTO;
import com.twith.domain.MoimJoinDTO;
import com.twith.domain.PlaceDTO;
import com.twith.domain.RecruitDTO;
import com.twith.domain.ReplyDTO;
import com.twith.domain.ReplyPageDTO;
import com.twith.domain.UserDTO;
import com.twith.mapper.MoimMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service // 서비스 객체임을 표시
public class MoimServiceImpl implements MoimService {

	@Setter(onMethod_ = @Autowired)
	private MoimMapper mapper;

	@Override
	public ArrayList<MoimDTO> getMymoim(String userid) {
		List<Integer> moimnums = mapper.getMymoim(userid);
		ArrayList<MoimDTO> moims = new ArrayList<>();

		for (int moimnum : moimnums) {
			moims.add(mapper.getMoimDetail(moimnum));
		}

		return moims;
	}

	@Override
	public MoimDTO getMoim(int moimnum) {
		return mapper.getMoimDetail(moimnum);
	}

	@Override
	public PlaceDTO getPlace(int placenum) {
		return mapper.getPlaceDetail(placenum);
	}

	@Override
	public MoimDTO regist(MoimDTO moim) {
		mapper.insert(moim);
		return moim;
	}

	@Override
	public boolean checkPlace(PlaceDTO place) {
		return 1 == mapper.checkPlace(place);
	}

	@Override
	public int getPlacenum(PlaceDTO place) {
		return mapper.getPlacenum(place);

	}

	@Override
	public void registPlace(PlaceDTO place) {
		mapper.insertPlace(place);

	}

	@Override
	public void makeMoimMemeber(MoimDTO moim) {
		mapper.insertMember(moim);
	}

	@Override
	public List<String> getMembers(int moimnum) {
		return mapper.getMembers(moimnum);
	}

	@Override
	public boolean sendreq(MoimJoinDTO data) {
		return 1 == mapper.insertreq(data);
	}

	@Override
	public List<RecruitDTO> getList(Criteria cri) {
		log.info("------getListWithPaging------");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("---------getTotal--------");
		return mapper.getTotal(cri);
	}

	@Override
	public RecruitDTO get(int recruitnum) {
		log.info("-----get-----");
		return mapper.read(recruitnum);
	}

	@Override
	public boolean readcntUP(RecruitDTO recruit) {
		log.info("-----readcntUP-----");
		return 1 == mapper.updatereadcnt(recruit);
	}

	@Override
	public void recruitregist(RecruitDTO recruit) {
		log.info("--------recruitregist---------");
		mapper.insert_with_bno(recruit);
	}

	@Override
	public boolean recruitmodify(RecruitDTO recruit) {
		log.info("---------recruitmodify---------");
		return 0 != mapper.recruitupdate(recruit);
	}

	@Override
	public UserDTO getMemberDetail(String userId) {
		return mapper.getMemberDetail(userId);
	}

	@Override
	public List<MoimDTO> getMoimById(String login_id) {
		return mapper.getMoimById(login_id);
	}

	@Override
	public List<MoimJoinDTO> getApplicant(int moimnum) {
		return mapper.getApplicant(moimnum);
	}

	@Override
	public MoimJoinDTO getJoinDetail(int moimjoinnum) {
		return mapper.getJoinDetail(moimjoinnum);
	}

	@Override
	public boolean removeJoin(int moimjoinnum) {
		return 1 == mapper.deleteJoin(moimjoinnum);
	}

	@Override
	public boolean outMember(String userId) {
		return 1 == mapper.deleteMember(userId);
	}

	@Override
	public boolean registChat(MoimChatDTO moimchat) {
		return 1 == mapper.insertChat(moimchat);
	}

	@Override
	public List<MoimChatDTO> getChat(int moimnum) {
		return mapper.getChat(moimnum);
	}

	@Override
	public boolean cancelMoim(int moimnum) {

		return 1 == mapper.deleteMoim(moimnum);
	}

	@Override
	public boolean deleteAllMember(int moimnum) {

		return 1 == mapper.deleteMoimMember(moimnum);
	}

	@Override
	public boolean deleteChat(int moimnum) {
		return 1 == mapper.deleteChat(moimnum);
	}

	@Override
	public boolean deleteMoimRecruit(int moimnum) {
		return 1 == mapper.deleteMoimRecruit(moimnum);
	}

	@Override
	public boolean deleteMoimJoin(int moimnum) {
		return 1 == mapper.deleteMoimJoin(moimnum);
	}
	
	@Override
	public void updateMoim(MoimDTO moim) {
		mapper.updateMoim(moim);
	}
	
	@Override
	public FireMoimDTO getFireDetail(FireMoimDTO fire) {
		
		return mapper.getFireDetail(fire);
	}
	@Override
	public void setMessage(FireMoimDTO fire) {
		mapper.insertMessage(fire);
	}
	@Override
	public List<Integer> getFiremoimnum(String userid) {
		
		return mapper.getFiremoimnum(userid); 
	}
	
	@Override
	   public boolean removerecruit(int recruitnum) {
	      return 1 == mapper.deleterecruit(recruitnum);
	   }
	   
	   @Override
	   public int getmoimType(int moimnum) {
	      return mapper.getmoimType(moimnum);
	   }

	   public boolean replyregist(ReplyDTO reply) {
	      log.info("----------replyregist---------");
	      return mapper.replyinsert(reply) == 1;
	   }

	   @Override
	   public ReplyDTO replyget(int replynum) {
	      log.info("-------replyget(reply)--------\nreplynum : "+replynum);
	      return mapper.replygetDetail(replynum);
	   }

	   @Override
	   public boolean replymodify(ReplyDTO reply) {
	      log.info("-------replymodify(reply)--------\nreplynum : "+reply.getReplynum());
	      return mapper.replyupdate(reply) == 1;
	   }

	   @Override
	   public boolean replyremove(int replynum) {
	      log.info("--------replyremove(reply)---------\nreplynum"+replynum);
	      return mapper.replydelete(replynum) == 1;
	   }
	   
	   @Override
	   public ReplyPageDTO replygetList(Criteria cri, int boardnum) {
	      log.info("--------replygetList(reply)-------\nboardnum : "+boardnum);
	      //프론트에서 replyCnt(총 댓글개수)와 list(댓글들 데이터 리스트)를 요청하고 있고
	      //두 종류의 데이터를 넘겨주어야 하기 때문에 하나의 객체(ReplyPageDTO)로 만들어서 돌려준다.
	                        //게시글에 달린 총 개수            //기준(cri)과 게시글번호로 댓글 리스트 긁어오기
	      return new ReplyPageDTO(mapper.replygetTotal(boardnum), mapper.replygetListWithPaging(cri,boardnum));
	   }
	   
	   @Override
	   public boolean replyDeleteAll(int recruitnum) {
	      return 0 <= mapper.replyDeleteAll(recruitnum);
	   }
	
}
