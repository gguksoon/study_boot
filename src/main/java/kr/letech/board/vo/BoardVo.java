package kr.letech.board.vo;

public class BoardVo {

	private int board_seq;
	private String board_name;
	private String mem_id;
	private int board_loc;
	private int board_stat;
	private int board_write;
	
	public BoardVo() { }
	
	public BoardVo(int board_seq, String board_name, String mem_id, int board_loc, int board_stat, int board_write) {
		this.board_seq = board_seq;
		this.board_name = board_name;
		this.mem_id = mem_id;
		this.board_loc = board_loc;
		this.board_stat = board_stat;
		this.board_write = board_write;
	}
	
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getBoard_loc() {
		return board_loc;
	}
	public void setBoard_loc(int board_loc) {
		this.board_loc = board_loc;
	}
	public int getBoard_stat() {
		return board_stat;
	}
	public void setBoard_stat(int board_stat) {
		this.board_stat = board_stat;
	}
	public int getBoard_write() {
		return board_write;
	}
	public void setBoard_write(int board_write) {
		this.board_write = board_write;
	}

	@Override
	public String toString() {
		return "Board [board_seq=" + board_seq + ", board_name=" + board_name + ", mem_id=" + mem_id + ", board_loc="
				+ board_loc + ", board_stat=" + board_stat + ", board_write=" + board_write + "]";
	}
	
}
