package kr.letech.reply.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.letech.reply.dao.ReplyMapper;
import kr.letech.reply.vo.ReplyVo;

@Service
public class ReplySVC {

	@Autowired
	private ReplyMapper replyMapper;
	
	/**
	* Method : getReply
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param reply_seq
	* @return
	* Method 설명 : reply_seq에 해당하는 reply를 반환 
	*/
	public ReplyVo getReply(int reply_seq) {
		return replyMapper.getReply(reply_seq);
	}
	
	/**
	* Method : getReplyList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param post_seq
	* @return
	* Method 설명 : post_seq에 해당하는 replyList를 반환
	*/
	public List<ReplyVo> getReplyList(int post_seq) {
		return replyMapper.getReplyList(post_seq);
	}

	/**
	* Method : insertReply
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param reply
	* @return 성공 : 1, 실패 : 0 
	* Method 설명 : insert reply
	*/
	public int insertReply(ReplyVo reply) {
		return replyMapper.insertReply(reply);
	}
	
	/**
	 * Method : updateReply
	 * 작성자 : JO MIN SOO
	 * 변경이력 :
	 * @param reply
	 * @return 성공 : 1, 실패 : 0
	 * Method 설명 : update reply
	 */
	public int updateReply(ReplyVo reply) {
		return replyMapper.updateReply(reply);
	}
	
	/**
	* Method : deleteReply
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param reply_seq
	* @return 성공 : 1, 실패 : 0
	* Method 설명 : delete reply
	*/
	public int deleteReply(int reply_seq) {
		return replyMapper.deleteReply(reply_seq);
	}
}
