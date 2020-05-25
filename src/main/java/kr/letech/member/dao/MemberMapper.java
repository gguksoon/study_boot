package kr.letech.member.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.letech.member.vo.MemberVo;

@Repository
@Mapper
public interface MemberMapper {

	MemberVo getMember(String mem_id);
}
