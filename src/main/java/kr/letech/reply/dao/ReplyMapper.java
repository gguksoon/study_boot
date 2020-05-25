package kr.letech.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.letech.reply.vo.ReplyVo;

@Repository
@Mapper
public interface ReplyMapper {

	/**
	* Method : getReply
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param reply_seq
	* @return
	* Method 설명 : reply_seq에 해당하는 reply를 반환 
	*/
	ReplyVo getReply(int reply_seq);
	
	/**
	* Method : getReplyList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param post_seq
	* @return
	* Method 설명 : post_seq에 해당하는 replyList를 반환
	*/
	List<ReplyVo> getReplyList(int post_seq);
	
	/**
	* Method : insertReply
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param reply
	* @return 성공 : 1, 실패 : 0 
	* Method 설명 : insert reply
	*/
	int insertReply(ReplyVo reply);
	
	/**
	* Method : updateReply
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param reply
	* @return 성공 : 1, 실패 : 0
	* Method 설명 : update reply
	*/
	int updateReply(ReplyVo reply);
	
	/**
	* Method : deleteReply
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param reply_seq
	* @return 성공 : 1, 실패 : 0
	* Method 설명 : delete reply
	*/
	int deleteReply(int reply_seq);
	
}
