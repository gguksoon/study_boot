package kr.letech.member.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.letech.member.dao.MemberMapper;
import kr.letech.member.vo.MemberVo;

@Service
public class MemberSVC {

	@Autowired
	private MemberMapper memberMapper;
	
	/**
	* Method : getMember
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : mem_id에 해당하는 Member객체 반환
	*/
	public MemberVo getMember(String mem_id) {
		return memberMapper.getMember(mem_id);
	}

}
