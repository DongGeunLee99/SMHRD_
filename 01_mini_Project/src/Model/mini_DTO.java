package Model;

public class mini_DTO {

	private String ID;
	private String PW;
	private String NAME;
	private int timeH;
	private int timeN;
	private String dateH;
	private String dateN;

	public mini_DTO(String ID, String PW, String NAME) {
	
		this.ID = ID;
		this.PW = PW;
		this.NAME = NAME;
	}

	public mini_DTO(String id, String pw) {

		this.ID = id;
		this.PW = pw;
		
	}
	
	public mini_DTO(String pw) {

		this.PW = pw;
		
	}

	
	
	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getPW() {
		return PW;
	}

	public void setPW(String pW) {
		PW = pW;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public int getTimeH() {
		return timeH;
	}

	public void setTimeH(int timeH) {
		this.timeH = timeH;
	}

	public int getTimeN() {
		return timeN;
	}

	public void setTimeN(int timeN) {
		this.timeN = timeN;
	}

	public String getDateH() {
		return dateH;
	}

	public void setDateH(String dateH) {
		this.dateH = dateH;
	}

	public String getDateN() {
		return dateN;
	}

	public void setDateN(String dateN) {
		this.dateN = dateN;
	}

}
