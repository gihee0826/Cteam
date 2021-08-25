package project1;

public class Board {
	private String bno;
	private String title;
	private String writer;
	private String date;


	public Board(String bno, String title, String writer, String date) {
		super();
		this.bno = bno;
		this.title = title;
		this.writer = writer;
		this.date = date;
	}
	
	public String getBno() {
		return bno;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
}
