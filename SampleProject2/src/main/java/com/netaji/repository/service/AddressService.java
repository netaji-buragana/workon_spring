package com.netaji.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netaji.entity.AddressEntity;
import com.netaji.entity.EmployeeEntity;
import com.netaji.repository.AddressRepository;
import com.netaji.repository.EmployeeRepository;
@Service
public class AddressService {
	
	@Autowired
	private AddressRepository addresssRepository;
	

	
	
	public void addDetails(AddressEntity data) {
		addresssRepository.save(data);
	}
	
	
	public AddressEntity editById(long id) {
		AddressEntity e = addresssRepository.findById(id).get();
		return e;
	}
	
	public void deleteDetails(long id) {
		addresssRepository.deleteById(id);
	}

}
