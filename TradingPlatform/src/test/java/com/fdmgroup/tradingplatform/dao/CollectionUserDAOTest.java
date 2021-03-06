package com.fdmgroup.tradingplatform.dao;

import static org.junit.Assert.*;

import java.io.ObjectInput;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;




import com.fdmgroup.tradingplatform.model.Company;
import com.fdmgroup.tradingplatform.model.Request;
import com.fdmgroup.tradingplatform.model.Role;
import com.fdmgroup.tradingplatform.model.User;




public class CollectionUserDAOTest {
	

	static CollectionUserDAO userDAO;
	static CollectionRoleDAO roleDAO;
	
	static List<User> users;
	
	
	static User user1 = new User();
	static User user2 = new User();
	
	static Role role1 = new Role();
	static Role role2 = new Role();
	
	

	@BeforeClass
	public static void init(){
		roleDAO =  CollectionRoleDAO.getInstance();
		userDAO =  CollectionUserDAO.getInstance();
		
		role1.setId(2);
		role1.setName("Shareholder");

		role2.setId(3);
		role2.setName("Broker");
		
		List<Role> roles = new ArrayList<Role>();
		roles.add(role1);
		roles.add(role2);
		
		user1 = new User("jpalouis","Mike", "yang", "password", roles );
		user2 = new User("FHLH","George","Liu", "woooooo",roles);
		
	}
 

	@Test
	public void testCreate() {

		assertEquals(2, (int) user1.getId());
		assertEquals(3, (int) user2.getId());
	}


}
