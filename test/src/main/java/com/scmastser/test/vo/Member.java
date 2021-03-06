package com.scmastser.test.vo;

public class Member {
	private String mem_id;
	private String mem_password;
	private int mem_birth;
	private String mem_gender;
	private String mem_nickname;
	private String mem_join_date;
	private String mem_leave_date;
	private String mem_originalfile;
	private String mem_savefile;

	public Member(String mem_id, String mem_password, int mem_birth, String mem_gender, String mem_nickname,
			String mem_join_date, String mem_leave_date, String mem_originalfile, String mem_savefile) {
		super();
		this.mem_id = mem_id;
		this.mem_password = mem_password;
		this.mem_birth = mem_birth;
		this.mem_gender = mem_gender;
		this.mem_nickname = mem_nickname;
		this.mem_join_date = mem_join_date;
		this.mem_leave_date = mem_leave_date;
		this.mem_originalfile = mem_originalfile;
		this.mem_savefile = mem_savefile;
	}

	public Member() {
		super();
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_password() {
		return mem_password;
	}

	public void setMem_password(String mem_password) {
		this.mem_password = mem_password;
	}

	public int getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(int mem_birth) {
		this.mem_birth = mem_birth;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

	public String getMem_join_date() {
		return mem_join_date;
	}

	public void setMem_join_date(String mem_join_date) {
		this.mem_join_date = mem_join_date;
	}

	public String getMem_leave_date() {
		return mem_leave_date;
	}

	public void setMem_leave_date(String mem_leave_date) {
		this.mem_leave_date = mem_leave_date;
	}

	public String getMem_originalfile() {
		return mem_originalfile;
	}

	public void setMem_originalfile(String mem_originalfile) {
		this.mem_originalfile = mem_originalfile;
	}

	public String getMem_savefile() {
		return mem_savefile;
	}

	public void setMem_savefile(String mem_savefile) {
		this.mem_savefile = mem_savefile;
	}

	@Override
	public String toString() {
		return "Member [mem_id=" + mem_id + ", mem_password=" + mem_password + ", mem_birth=" + mem_birth
				+ ", mem_gender=" + mem_gender + ", mem_nickname=" + mem_nickname + ", mem_join_date=" + mem_join_date
				+ ", mem_leave_date=" + mem_leave_date + ", mem_originalfile=" + mem_originalfile + ", mem_savefile="
				+ mem_savefile + "]";
	}

}
