package bean;

public class Registration {

	private int BID;

	private String firstName;
	
	private String lastName;

	private int age;

	private String gender;

	private String email;

	private String password;
	
	private String bodyMap;

	private String role;
	
	public int getBID() {
		return BID;
	}

	public void setBID(int bID) {
		BID = bID;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getBodyMap() {
		return bodyMap;
	}

	public void setBodyMap(String bodyMap) {
		this.bodyMap = bodyMap;
	}
}
