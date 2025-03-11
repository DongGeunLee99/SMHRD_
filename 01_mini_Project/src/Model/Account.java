package Model;

public class Account {
	 String ID;
	 String PW;
	 String NAME;
	 int timeH;
	 int timeN;
	 String dateH;
	 String dateN;
	
	
	public Account(mini_DTO user) {
		super();
		this.ID = user.getID();
		this.PW = user.getPW();
		this.NAME = user.getNAME();
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
}
