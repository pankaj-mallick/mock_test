package CE;
import java.util.Stack;
public class User_List extends Stack
{
	private String name;
	private String description;
	public User_List (String s, String s1, int i)
	{
		name = s;
		description = s1;
		setSize(i);
	}
	public void AddUser(UserListEntry userentry)
	{
		push(userentry);
	}
	public String getDescription()
	{return description;}
	public String getName()
	{return name;}
}
