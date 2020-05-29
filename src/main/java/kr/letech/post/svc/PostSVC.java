package kr.letech.post.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.letech.post.dao.PostMapper;
import kr.letech.post.vo.PostVo;

@Service
public class PostSVC {

	@Autowired
	private PostMapper postMapper;
	
	/**
	* Method : getPost
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param post_seq
	* @return
	* Method 설명 : post_seq에 해당하는 Post객체 반환
	*/
	public PostVo getPost(int post_seq) {
		return postMapper.getPost(post_seq);
	}

	/**
	* Method : getPostList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param board_seq
	* @param pageMap ==> page, pageLimit
	* @return
	* Method 설명 : board_seq에 해당하는 pageList를 반환(pageMap을 이용한 pageList)
	*/
	public List<PostVo> getPostList(int board_seq, Map<String, Integer> pageMap) {
		// page(offset): 데이터를 가져오는 시작점에서 얼마나 떨어진 데이터인지
		int offset = (pageMap.get("page") - 1) * pageMap.get("pageLimit");
		// pageLimit(limit): 몇 개의 값을 가져올 지
		int limit = pageMap.get("pageLimit");
		
		RowBounds row = new RowBounds(offset, limit);
		
		List<PostVo> pageList = postMapper.getPostList(board_seq, row);
		return pageList;
	}

	/**
	* Method : getPostTotalCnt
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param board_seq
	* @return
	* Method 설명 : board_seq에 해당하는 Post의 갯수를 반환
	*/
	public int getPostTotalCnt(int board_seq) {
		return postMapper.getPostTotalCnt(board_seq);
	}
	
	/**
	* Method : getBeforeAfterPost
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param post_seq
	* @return <"before_post", Post>, <"after_post", Post>
	* Method 설명 : post_seq의 이전글과 다음글을 Map형태로 반환
	*/
	public Map<String, PostVo> getBeforeAfterPost(int post_seq) {
		Map<String, PostVo> map = new HashMap<String, PostVo>();
		map.put("before_post", postMapper.getBeforePost(post_seq));
		map.put("after_post", postMapper.getAfterPost(post_seq));
		
		return map;
	}

	/**
	* Method : insertPost
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param post
	* @return
	* Method 설명 : 게시글 추가
	*/
	public int insertPost(PostVo post) {
		postMapper.insertPost(post);
		return post.getPost_seq();
	}

	/**
	* Method : updatePost
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param post
	* @return
	* Method 설명 : 게시글 수정
	*/
	public int updatePost(PostVo post) {
		return postMapper.updatePost(post);
	}

	/**
	* Method : deletePost
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param post_seq
	* @return 
	* Method 설명 : 게시글 삭제 
	*/
	public int deletePost(int post_seq) {
		return postMapper.deletePost(post_seq);
	}

}
