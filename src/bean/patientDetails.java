package bean;

public class patientDetails {
private double Height;
private int BID;
	private double Weight;
	
	private double BloodPressure;
	
	private double Temperature;

	private String dateOfDiag;
	public double getHeight() {
		return Height;
	}

	public void setHeight(double height) {
		Height = height;
	}

	public double getWeight() {
		return Weight;
	}

	public void setWeight(double weight) {
		Weight = weight;
	}

	public double getBloodPressure() {
		return BloodPressure;
	}

	public void setBloodPressure(double bloodPressure) {
		BloodPressure = bloodPressure;
	}

	public double getTemperature() {
		return Temperature;
	}

	public void setTemperature(double temperature) {
		Temperature = temperature;
	}

	public int getBID() {
		return BID;
	}

	public void setBID(int bID) {
		BID = bID;
	}

	public String getDateOfDiag() {
		return dateOfDiag;
	}

	public void setDateOfDiag(String dateOfDiag) {
		this.dateOfDiag = dateOfDiag;
	}
}
