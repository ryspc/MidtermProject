package com.skilldistillery.housereport.data;

import com.skilldistillery.housereport.entities.User;

public interface UserDAO {

	User findById(int id);
	boolean deleteUser(User user);
	User updateUser(User user);
	User createUser(User user);
	
}
