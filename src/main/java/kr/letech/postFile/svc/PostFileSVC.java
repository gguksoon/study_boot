package kr.letech.postFile.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.letech.postFile.dao.PostFileMapper;
import kr.letech.postFile.vo.PostFileVo;

@Service
public class PostFileSVC {

	@Autowired
	private PostFileMapper postFileMapper;
	
	/**
	* Method : getPostFile
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param file_seq
	* @return
	* Method 설명 : file_seq에 해당하는 파일객체 반환  
	*/
	public PostFileVo getPostFile(int file_seq) {
		return postFileMapper.getPostFile(file_seq);
	}

	/**
	* Method : getPostFileList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param post_seq
	* @return
	* Method 설명 : 한 게시글의 전체 파일 리스트 반환
	*/
	public List<PostFileVo> getPostFileList(int post_seq) {
		return postFileMapper.getPostFileList(post_seq);
	}

	/**
	* Method : insertPostFile
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param postFile
	* @return 성공 : 1, 실패 : 0
	* Method 설명 : 첨부파일 추가
	*/
	public int insertPostFile(PostFileVo postFile) {
		return postFileMapper.insertPostFile(postFile);
	}
	
	/**
	* Method : deletePostFile
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param file_seq
	* @return 성공 : 1, 실패 : 0
	* Method 설명 : 첨부파일 삭제
	*/
	public int deletePostFile(int file_seq) {
		return postFileMapper.deletePostFile(file_seq);
	}
	
}
