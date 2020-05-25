package kr.letech.member.vo;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberVo {
	
	private String mem_id;
	private String mem_pass;
	private String mem_name;
	private String mem_email;
	private String mem_tel;
	private String mem_addr;
	private Date mem_birth;
	private int grade;

	public MemberVo(String mem_id, String mem_pass, String mem_name, String mem_email, String mem_tel, String mem_addr,
			Date mem_birth, int grade) {
		this.mem_id = mem_id;
		this.mem_pass = mem_pass;
		this.mem_name = mem_name;
		this.mem_email = mem_email;
		this.mem_tel = mem_tel;
		this.mem_addr = mem_addr;
		this.mem_birth = mem_birth;
		this.grade = grade;
	}
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public Date getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(Date mem_birth) {
		this.mem_birth = mem_birth;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Member [mem_id=" + mem_id + ", mem_pass=" + mem_pass + ", mem_name=" + mem_name + ", mem_email="
				+ mem_email + ", mem_tel=" + mem_tel + ", mem_addr=" + mem_addr + ", mem_birth=" + mem_birth
				+ ", grade=" + grade + "]";
	}
	
	// 현재 객체의 시간을 SimpleDateFormat으로 "yyyy-MM-dd"로 변경
	public String getMemBirthFmt() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(mem_birth);
	}
	
}