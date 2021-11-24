package com.twith.service;

import java.util.ArrayList;
import java.util.List;

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

public interface MoimService {

	// 메소드 설계시 메소드의 이름은 현실적인 이름을 붙여준다.

	public ArrayList<MoimDTO> getMymoim(String userid);

	public MoimDTO getMoim(int moimnum);

	public PlaceDTO getPlace(int placenum);

	public MoimDTO regist(MoimDTO moim);

	public boolean checkPlace(PlaceDTO place);

	public int getPlacenum(PlaceDTO place);

	public void registPlace(PlaceDTO place);

	public void makeMoimMemeber(MoimDTO moim);

	public List<String> getMembers(int moimnum);

	public boolean sendreq(MoimJoinDTO data);

	// 메소드 설계시 메소드의 이름은 현실적인 이름을 붙여준다.
	public List<RecruitDTO> getList(Criteria cri);

	public int getTotal(Criteria cri);

	public RecruitDTO get(int recruitnum);

	public boolean readcntUP(RecruitDTO recruit);

	public void recruitregist(RecruitDTO recruit);

	public boolean recruitmodify(RecruitDTO recruit);

	public UserDTO getMemberDetail(String userId);

	public List<MoimDTO> getMoimById(String login_id);

	public List<MoimJoinDTO> getApplicant(int moimnum);

	public MoimJoinDTO getJoinDetail(int moimjoinnum);

	public boolean removeJoin(int moimjoinnum);

	public boolean outMember(String userId);

	public boolean registChat(MoimChatDTO moimchat);

	public List<MoimChatDTO> getChat(int moimnum);

	public boolean cancelMoim(int moimnum);

	public boolean deleteAllMember(int moimnum);

	public boolean deleteChat(int moimnum);

	public boolean deleteMoimRecruit(int moimnum);

	public boolean deleteMoimJoin(int moimnum);

	public void updateMoim(MoimDTO moim);

	public FireMoimDTO getFireDetail(FireMoimDTO fire);

	public void setMessage(FireMoimDTO fire);

	public List<Integer> getFiremoimnum(String userid);

	public boolean removerecruit(int recruitnum);

	public int getmoimType(int moimnum);

	boolean replyregist(ReplyDTO reply);

	ReplyDTO replyget(int replynum);

	boolean replymodify(ReplyDTO reply);

	boolean replyremove(int replynum);

	ReplyPageDTO replygetList(Criteria cri, int boardnum);

	public boolean replyDeleteAll(int recruitnum);

}
