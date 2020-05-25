package kr.letech.postFile.vo;

import java.util.Date;

public class PostFileVo {

	private int file_seq;
	private int post_seq;
	private String mem_id;
	private Date file_reg;
	private String file_name;
	private String file_realname;
	private String file_path;
	
	public PostFileVo(int file_seq, int post_seq, String mem_id, Date file_reg, String file_name, String file_realname,
			String file_path) {
		this.file_seq = file_seq;
		this.post_seq = post_seq;
		this.mem_id = mem_id;
		this.file_reg = file_reg;
		this.file_name = file_name;
		this.file_realname = file_realname;
		this.file_path = file_path;
	}
	
	public int getFile_seq() {
		return file_seq;
	}
	public void setFile_seq(int file_seq) {
		this.file_seq = file_seq;
	}
	public int getPost_seq() {
		return post_seq;
	}
	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getFile_reg() {
		return file_reg;
	}
	public void setFile_reg(Date file_reg) {
		this.file_reg = file_reg;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_realname() {
		return file_realname;
	}
	public void setFile_realname(String file_realname) {
		this.file_realname = file_realname;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	@Override
	public String toString() {
		return "PostFile [file_seq=" + file_seq + ", post_seq=" + post_seq + ", mem_id=" + mem_id + ", file_reg="
				+ file_reg + ", file_name=" + file_name + ", file_realname=" + file_realname + ", file_path="
				+ file_path + "]";
	}
	
}
