
  package com.netaji.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netaji.entity.AccountEntity;
import com.netaji.entity.ProjectEntity;
import com.netaji.repository.AccountRepository;

@Service
  public class AccountService {
	
	@Autowired
	
	private AccountRepository accountRepo;
	
	
	
	
	public AccountEntity createProject(AccountEntity accountData) {
		return accountRepo.save(accountData);
	}
	
	
	public void deleteDetails(long bankid) {
		accountRepo.deleteById(bankid);
	}
	
  
  }
 