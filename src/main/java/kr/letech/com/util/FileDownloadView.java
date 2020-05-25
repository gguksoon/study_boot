package kr.letech.com.util;

import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import kr.letech.postFile.vo.PostFileVo;

public class FileDownloadView extends AbstractView {

	// file download
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 컨트롤러 메소드에서 추가한 속성
		PostFileVo file = (PostFileVo) model.get("file");

		response.setHeader("content-disposition", "attachment;filename=" + file.getFile_name());
		response.setContentType("application/octet-stream"); // 바이너리로 요청이 전송됨
		
		FileInputStream fis = new FileInputStream(file.getFile_path() + file.getFile_realname());
		ServletOutputStream sos = response.getOutputStream();
		
		byte[] buffer = new byte[512];
		int len = 0;
		
		while( (len = fis.read(buffer, 0, 512)) != -1 ) {
			sos.write(buffer, 0, len);
		}
		
		sos.flush();
		sos.close();
		fis.close();
	}

	
}
