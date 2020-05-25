package kr.letech.member.ctl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.letech.board.svc.BoardSVC;
import kr.letech.member.svc.MemberSVC;
import kr.letech.member.vo.MemberVo;

@Controller
public class MemberCTL {

	@Autowired
	private MemberSVC memberSVC;
	
	@Autowired
	private BoardSVC boardSVC;
	
	/**
	* Method : view
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @return
	* Method 설명 : 로그인 화면 요청 처리(forward) 
	*/
	@GetMapping("login") 
	public String loginView() {
		System.out.println("dd");
		return "login/login";
	}
	
	/**
	* Method : loginProcess
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param mem_id
	* @param mem_pass
	* @param rememberMe
	* @param response
	* @param session
	* @return
	* Method 설명 : 로그인 요청 처리 
	*/
	@PostMapping("login")
	public String loginProcess(String mem_id, String mem_pass, String rememberMe,
								HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		MemberVo member = memberSVC.getMember(mem_id);
		
		if(mem_pass != null && mem_pass.equals(member.getMem_pass())) {
			// session에 member정보 넣기
			session.setAttribute("S_MEM", member);
			// session에 boardList 넣기
			session.setAttribute("S_BOARDLIST", boardSVC.getBoardList());
			
			return "redirect:/";
		} else {
			return "login";
		}
	}
	
	/**
	* Method : logout
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param session
	* @return
	* Method 설명 : 로그아웃 요청
	*/
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션의 모든 내용을 지움
		
		return "redirect:/login";
	}
}
