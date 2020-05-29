package kr.letech.member.svc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.letech.member.dao.MemberMapper;
import kr.letech.member.vo.MemberVo;

@Service
public class MemberSVC implements UserDetailsService {

	private static final Logger logger = LoggerFactory.getLogger(MemberSVC.class);
	
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

	/***** UserDetailsService 구현 *****/
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.debug("*******loadbyusername~");
		// username(mem_id)에 해당하는 member 찾기
		MemberVo member = memberMapper.getMember(username);
		
		// mem_id에 해당하는 member가 없으면 예외반환
		if(member == null) {
			throw new UsernameNotFoundException(username);
		}
		
		// member 반환
		return member;
	}

}
