package kr.co.hbilab.dto;

public class NoticeDto {
	
	private int seq;
	private String title;
	private String content;
	private String flag;
	private int hit;
	private String regdate;
	
	public NoticeDto() {}
	
	public NoticeDto(int seq, String title, String content, String flag, int hit, String regdate) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.flag = flag;
		this.hit = hit;
		this.regdate = regdate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}	
}
