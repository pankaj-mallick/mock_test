package CE;

public class UserListEntry {

	private String UserName;
	private String val;
	public UserListEntry (String s, String s1) {
		UserName=s;
		val=s1;
	}
	public String getName() {
		return UserName;
	}
	public void setName(String s) {
		UserName= s;
	}
	public String getval() {
		return val;
	}
}
