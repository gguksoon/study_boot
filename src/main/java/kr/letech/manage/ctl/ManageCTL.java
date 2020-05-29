package kr.letech.manage.ctl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManageCTL {

	/**
	* Method : manageBoardView
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @return
	* Method 설명 : 게시판 관리 페이지 호출
	*/
	@RequestMapping("manageBoard")
	public String manageBoardView() {
		
		return "tiles/manage/manageBoard";
	}
}
