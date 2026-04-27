package com.netaji;

import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

import com.netaji.entity.EmployeeEntity;
import com.netaji.repository.EmployeeRepository;

@SpringBootApplication
public class OwnSpringMvcMysqlApplication {

	public static void main(String[] args) {
		ConfigurableApplicationContext ctxt = SpringApplication.run(OwnSpringMvcMysqlApplication.class, args);
		EmployeeRepository bean = ctxt.getBean(EmployeeRepository.class);
		
		/*
		 * String s1 = bean.findeNameByempId1();
		 * System.out.println("***********"+s1+"***********");
		 * 
		 * 
		 * long empId=7;
		 * 
		 * String s = bean.findeNameByempId(empId); System.out.println(s);
		 */
		 
		
		/*
		 * List<EmployeeEntity> d = bean.findByIdAndName(7, "netaji"); d.forEach(entity
		 * -> { System.out.println(entity.getEmpId()+"\t"+entity.geteName()+"\t"+entity.
		 * geteSalary()+"\t \t"+entity.getMobile()); });
		 */
		
	}

}
