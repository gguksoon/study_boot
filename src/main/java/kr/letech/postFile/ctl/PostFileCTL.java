package kr.letech.postFile.ctl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.letech.com.util.FileDownloadView;
import kr.letech.postFile.svc.PostFileSVC;

@Controller
public class PostFileCTL {

	@Autowired
	private PostFileSVC postFileSVC;
	
	@Autowired
	private View jsonView;
	
	/**
	* Method : fileDownloadView
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param model
	* @param file_seq
	* Method 설명 : 파일 다운로드
	*/
	@RequestMapping("fileDownloadView/{file_seq}")
	public View fileDownloadView(Model model, @PathVariable int file_seq) {
		System.out.println(postFileSVC.getPostFile(file_seq));
		model.addAttribute("file", postFileSVC.getPostFile(file_seq));
		return new FileDownloadView();
	}
	
	/**
	* Method : deletePostFile
	* 작성자 : JO MIN SOO
	* 변경이력 :
	* @param board_seq
	* @param file_seq
	* @return
	* Method 설명 : 파일 삭제
	*/
	@RequestMapping("deletePostFile")
	public View deletePostFile(Model model, int file_seq) {
		model.addAttribute(postFileSVC.deletePostFile(file_seq));
		
		return jsonView;
	}
}
