package kr.letech.board.ctl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.letech.board.svc.BoardSVC;
import kr.letech.board.vo.BoardVo;

@Controller
public class BoardCTL {

	@Autowired
	private BoardSVC boardSVC;
	
	@Autowired
	private View jsonView;
	
	/**
	* Method : getBoardList
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @return
	* Method 설명 : boardList를 json형태로 반환 
	*/
	@RequestMapping("getBoardList") 
	public View getBoardList(Model model) {
		model.addAttribute("boardList", boardSVC.getBoardList());
		
		return jsonView;
	}
	
	/**
	* Method : insertBoard
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param board
	* @return
	* Method 설명 : insert board
	*/
	@PostMapping("insertBoard")
	public View insertBoard(HttpSession session, @ModelAttribute BoardVo board) {
		// 게시판 추가
		boardSVC.insertBoard(board);
		
		// 추가한 Board를 세션에 저장
		session.setAttribute("S_BOARDLIST", boardSVC.getBoardList());
		
		return jsonView;
	}
	
	/**
	* Method : updateBoard
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param session
	* @param board
	* @return
	* Method 설명 : update board
	*/
	@PostMapping("updateBoard")
	public View updateBoard(HttpSession session, @ModelAttribute BoardVo board) {
		// 게시판 수정
		boardSVC.updateBoard(board);
		
		// 갱신한 Board를 세션에 저장
		session.setAttribute("S_BOARDLIST", boardSVC.getBoardList());
		
		return jsonView;
	}
	
	/**
	* Method : updateBoardStat
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param session
	* @param board_seq
	* @return
	* Method 설명 : stat을 1로 변경
	*/
	@PostMapping("updateBoardStat")
	public View updateBoardStat(HttpSession session, int board_seq) {
		// 게시판 수정
		boardSVC.updateBoardStat(board_seq);
		
		// 갱신한 Board를 세션에 저장
		session.setAttribute("S_BOARDLIST", boardSVC.getBoardList());
		
		return jsonView;
	}
}
