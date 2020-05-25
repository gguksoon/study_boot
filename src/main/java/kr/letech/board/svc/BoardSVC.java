package kr.letech.board.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.letech.board.dao.BoardMapper;
import kr.letech.board.vo.BoardVo;

@Service
public class BoardSVC {

	@Autowired
	private BoardMapper boardMapper;
	
	/**
	* Method : getBoard
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param board_seq
	* @return
	* Method 설명 : board_seq에 해당하는 Board객체 반환 
	*/
	public BoardVo getBoard(int board_seq) {
		return boardMapper.getBoard(board_seq);
	}

	/**
	* Method : getBoardList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @return
	* Method 설명 : 모든 board객체를 List<Board>로 반환 
	*/
	public List<BoardVo> getBoardList() {
		return boardMapper.getBoardList();
	}

	/**
	* Method : insertBoard
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param board
	* @return
	* Method 설명 : insert board
	*/
	public int insertBoard(BoardVo board) {
		return boardMapper.insertBoard(board);
	}
	
	/**
	* Method : updateBoard
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param board
	* @return
	* Method 설명 : update board 
	*/
	public int updateBoard(BoardVo board) {
		return boardMapper.updateBoard(board);
	}

	/**
	* Method : updateBoardStat
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param board_seq
	* @return
	* Method 설명 : stat을 1로 변경
	*/
	public int updateBoardStat(int board_seq) {
		return boardMapper.updateBoardStat(board_seq);
	}
}
