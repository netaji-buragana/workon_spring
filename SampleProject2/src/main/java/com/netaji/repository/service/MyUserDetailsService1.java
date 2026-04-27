package com.netaji.repository.service;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.netaji.entity.User;
import com.netaji.repository.UserRepository1;

@Service
@Primary
public class MyUserDetailsService1 implements UserDetailsService{
	@Autowired
    private UserRepository1 repo;
	
	@Autowired
	private EntityManager entityManager;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = repo.findByUsername(username);
		//System.out.println(user.getUsername()+"****Password:"+user.getPassword());
		if(user==null)
			throw new UsernameNotFoundException("User 404");
		return new UserPrincipal(user);
	}
	
	
	public User register(User user) {
		return repo.save(user);
	}


	public User getByUserName(String username) {
		User data = repo.findByUsername(username);
		return data;
		
	}


	public User getUserByEmail(String email) {
		
		
		System.out.println("Mail==========:"+email);
		
		return repo.findByEmail(email);
	}

	public User getById(long id) {
	User user =repo.findById(id);
	return user;	
	}
	
	
	
	@Transactional
	public void update(User user) {

		// projectRepo.update(project.getProjectId(),project.getTitle() );

		CriteriaBuilder criteriaBulider = entityManager.getCriteriaBuilder();
		CriteriaUpdate<User> update = criteriaBulider.createCriteriaUpdate(User.class);
		Root e = update.from(User.class);
		update.set("email", user.getEmail());
		update.set("password", user.getPassword());
		update.set("username", user.getUsername());
		update.where(criteriaBulider.equal(e.get("id"), user.getId()));
		entityManager.createQuery(update).executeUpdate();

	}
	

}
