package dto;

public class BookPage{
	//id : auto
	private String bid;
	private String filename;
	
	public BookPage(){
		super();
	}
	
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
}