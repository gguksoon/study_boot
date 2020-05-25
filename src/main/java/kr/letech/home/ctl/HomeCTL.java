package kr.letech.home.ctl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeCTL {

	/**
	* Method : homeView
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @return
	* Method 설명 : 메인 화면 출력 
	*/
	@RequestMapping("/")
	public String homeView() {
		return "tiles/./index";
	}
	
	@RequestMapping("/db")
	public String dbView() {
		return "db";
	}
	
}
