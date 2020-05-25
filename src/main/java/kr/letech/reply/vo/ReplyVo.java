package kr.letech.reply.vo;

import java.util.Date;

public class ReplyVo {

	private int reply_seq;
	private int post_seq;
	private String mem_id;
	private String reply_cont;
	private Date reply_reg;
	private Date reply_mod;
	private int reply_stat;
	private Integer par_reply_seq;
	
	public ReplyVo(int reply_seq, int post_seq, String mem_id, String reply_cont, Date reply_reg, Date reply_mod,
			int reply_stat, Integer par_reply_seq) {
		this.reply_seq = reply_seq;
		this.post_seq = post_seq;
		this.mem_id = mem_id;
		this.reply_cont = reply_cont;
		this.reply_reg = reply_reg;
		this.reply_mod = reply_mod;
		this.reply_stat = reply_stat;
		this.par_reply_seq = par_reply_seq;
	}

	public int getReply_seq() {
		return reply_seq;
	}
	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
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
	public String getReply_cont() {
		return reply_cont;
	}
	public void setReply_cont(String reply_cont) {
		this.reply_cont = reply_cont;
	}
	public Date getReply_reg() {
		return reply_reg;
	}
	public void setReply_reg(Date reply_reg) {
		this.reply_reg = reply_reg;
	}
	public Date getReply_mod() {
		return reply_mod;
	}
	public void setReply_mod(Date reply_mod) {
		this.reply_mod = reply_mod;
	}
	public int getReply_stat() {
		return reply_stat;
	}
	public void setReply_stat(int reply_stat) {
		this.reply_stat = reply_stat;
	}
	public Integer getPar_reply_seq() {
		return par_reply_seq;
	}
	public void setPar_reply_seq(Integer par_reply_seq) {
		this.par_reply_seq = par_reply_seq;
	}

	@Override
	public String toString() {
		return "Reply [reply_seq=" + reply_seq + ", post_seq=" + post_seq + ", mem_id=" + mem_id + ", reply_cont="
				+ reply_cont + ", reply_reg=" + reply_reg + ", reply_mod=" + reply_mod + ", reply_stat=" + reply_stat
				+ ", par_reply_seq=" + par_reply_seq + "]";
	}
	
}
