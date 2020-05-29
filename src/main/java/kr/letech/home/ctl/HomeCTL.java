package kr.letech.home.ctl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.letech.board.svc.BoardSVC;
import kr.letech.member.svc.MemberSVC;
import kr.letech.member.vo.MemberVo;

@Controller
public class HomeCTL {

	@Autowired
	private MemberSVC memberSVC;
	
	@Autowired
	private BoardSVC boardSVC;
	
	/**
	* Method : homeView
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @return
	* Method 설명 : 메인 화면 출력 
	*/
	@RequestMapping("/")
	public String homeView(HttpSession session) {
//		System.out.println("자동 로그인");
//		MemberVo member = memberSVC.getMember("admin");
//		session.setAttribute("S_MEM", member);
//		session.setAttribute("S_BOARDLIST", boardSVC.getBoardList());
		
		return "tiles/./index";
	}
	
	@RequestMapping("/db")
	public String dbView() {
		return "db";
	}
	
}
