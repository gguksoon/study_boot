package kr.letech.post.vo;

import java.util.Date;

public class PostVo {

	private int post_seq;
	private int board_seq;
	private String post_title;
	private String post_cont;
	private String mem_id;
	private Date post_reg;
	private Date post_mod;
	private int post_stat;
	private int post_gn;
	private Integer par_post_seq;
	
	public PostVo(int post_seq, int board_seq, String post_title, String post_cont, String mem_id, Date post_reg,
			Date post_mod, int post_stat, int post_gn, Integer par_post_seq) {
		this.post_seq = post_seq;
		this.board_seq = board_seq;
		this.post_title = post_title;
		this.post_cont = post_cont;
		this.mem_id = mem_id;
		this.post_reg = post_reg;
		this.post_mod = post_mod;
		this.post_stat = post_stat;
		this.post_gn = post_gn;
		this.par_post_seq = par_post_seq;
	}
	
	public int getPost_seq() {
		return post_seq;
	}
	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_cont() {
		return post_cont;
	}
	public void setPost_cont(String post_cont) {
		this.post_cont = post_cont;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getPost_reg() {
		return post_reg;
	}
	public void setPost_reg(Date post_reg) {
		this.post_reg = post_reg;
	}
	public Date getPost_mod() {
		return post_mod;
	}
	public void setPost_mod(Date post_mod) {
		this.post_mod = post_mod;
	}
	public int getPost_stat() {
		return post_stat;
	}
	public void setPost_stat(int post_stat) {
		this.post_stat = post_stat;
	}
	public int getPost_gn() {
		return post_gn;
	}
	public void setPost_gn(int post_gn) {
		this.post_gn = post_gn;
	}
	public Integer getPar_post_seq() {
		return par_post_seq;
	}
	public void setPar_post_seq(int par_post_seq) {
		this.par_post_seq = par_post_seq;
	}

	@Override
	public String toString() {
		return "Post [post_seq=" + post_seq + ", board_seq=" + board_seq + ", post_title=" + post_title + ", post_cont="
				+ post_cont + ", mem_id=" + mem_id + ", post_reg=" + post_reg + ", post_mod=" + post_mod
				+ ", post_stat=" + post_stat + ", post_gn=" + post_gn + ", par_post_seq=" + par_post_seq + "]";
	}

}
