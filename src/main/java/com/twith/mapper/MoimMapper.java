package com.twith.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.twith.domain.Criteria;
import com.twith.domain.FireMoimDTO;
import com.twith.domain.MoimChatDTO;
import com.twith.domain.MoimDTO;
import com.twith.domain.MoimJoinDTO;
import com.twith.domain.PlaceDTO;
import com.twith.domain.RecruitDTO;
import com.twith.domain.ReplyDTO;
import com.twith.domain.UserDTO;

public interface MoimMapper {

	List<Integer> getMymoim(String userid);

	MoimDTO getMoimDetail(int moimnum);

	PlaceDTO getPlaceDetail(int placenum);

	void insert(MoimDTO moim);

	int checkPlace(PlaceDTO place);

	int getPlacenum(PlaceDTO place);

	void insertPlace(PlaceDTO place);

	void insertMember(MoimDTO moim);

	List<String> getMembers(int moimnum);

	int insertreq(MoimJoinDTO data);

	List<RecruitDTO> getListWithPaging(Criteria cri);

	int getTotal(Criteria cri);

	RecruitDTO read(int recruitnum);

	int updatereadcnt(RecruitDTO recruit);

	void insert_with_bno(RecruitDTO recruit);

	int recruitupdate(RecruitDTO recruit);

	UserDTO getMemberDetail(String userId);

	List<MoimDTO> getMoimById(String login_id);

	List<MoimJoinDTO> getApplicant(int moimnum);

	MoimJoinDTO getJoinDetail(int moimjoinnum);

	int deleteJoin(int moimjoinnum);

	int deleteMember(String userId);

	int insertChat(MoimChatDTO moimchat);

	List<MoimChatDTO> getChat(int moimnum);

	int deleteMoim(int moimnum);

	int deleteMoimMember(int moimnum);

	int deleteChat(int moimnum);

	int deleteMoimRecruit(int moimnum);

	int deleteMoimJoin(int moimnum);

	void updateMoim(MoimDTO moim);

	FireMoimDTO getFireDetail(FireMoimDTO fire);

	void insertMessage(FireMoimDTO fire);

	List<Integer> getFiremoimnum(String userid);

	int deleterecruit(int recruitnum);

	int getmoimType(int moimnum);

	int replyinsert(ReplyDTO reply);

	int replygetTotal(int boardnum);

	// MyBatis는 두개이상의 데이터를 파라미터로 넘길 때 객체나 Map, @Param을 이용한다.
	// 속성값은 MyBatis에서 #{네임} 으로 사용 가능하다.
	List<ReplyDTO> replygetListWithPaging(@Param("cri") Criteria cri, @Param("boardnum") int boardnum);

	int replydelete(int replynum);

	int replyupdate(ReplyDTO reply);

	ReplyDTO replygetDetail(int replynum);

	int replyDeleteAll(int recruitnum);

}
