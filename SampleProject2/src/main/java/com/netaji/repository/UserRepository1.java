package com.netaji.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.netaji.entity.User;


@Repository
public interface UserRepository1 extends JpaRepository<User, Long>{
	
	User  findByUsername(String username);
	
    User findByEmail(String email);
    
    User findById(long id);
    
   

}
