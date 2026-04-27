package com.netaji.repository;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.netaji.entity.EmployeeEntity;
@Repository
public interface EmployeeRepository extends JpaRepository<EmployeeEntity, Serializable>{
	
 
	public List<EmployeeEntity> findByeNameLike(String eName);

	public List<EmployeeEntity> findByempIdLike(long empId);
	
	public List<EmployeeEntity> findByeSalaryLike(float eSalary); //pending
	
	public List<EmployeeEntity> findBymobileLike(String mobile);  //pending
	
	public List<EmployeeEntity> findByeMailLike(String eMail);
	
	
	/*
	 * @Query("select eName from EmployeeEntity where empId=:num") public String
	 * findeNameByempId(@Param("num") long num);
	 * 
	 * 
	 * @Query("select eName from EmployeeEntity where empId=7") public String
	 * findeNameByempId1();
	 * 
	 * 
	 * @Query("from EmployeeEntity where empId=:num and eName=:name") public
	 * List<EmployeeEntity> findByIdAndName(@Param("num") long
	 * num,@Param("name")String name);
	 * 
	 * 
	 * 
	 * @Query(value="select * from employee where 1=1",nativeQuery=true) public
	 * List<EmployeeEntity> search(@Param("s") String s);
	 */
	 
	
	@Query(value = "select * from employee2 where 1=1 limit :values",nativeQuery = true)
    List<EmployeeEntity> limit(@Param("values") int values);
	
	  
	
	
	
	
	
	
	
	
	
	
	
}
