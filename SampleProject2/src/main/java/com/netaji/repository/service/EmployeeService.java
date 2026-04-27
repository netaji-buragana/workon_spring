package com.netaji.repository.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.netaji.entity.AccountEntity;
import com.netaji.entity.EmployeeEntity;
import com.netaji.repository.EmployeeRepository;

@Service
public class EmployeeService {

	private static final Class resultSetMapping = null;

	@Autowired
	private EmployeeRepository empRepo;

	@Autowired
	private EntityManager entityManager;
	
	
	@Autowired
	private SessionFactory sessionFactory;

	public void addDetails(EmployeeEntity emp) {
		empRepo.save(emp);
	}
	
	
	
	
	

	// particular records with in page logic
	public List<EmployeeEntity> getDetails(int pageval) {

		int page = pageval;
		if (pageval == 0) {
			page = 0;
		} else
			page = (pageval - 1);

		int size = 5; // particular page having records

		PageRequest pObj = PageRequest.of(page, size);

		Page<EmployeeEntity> pageData = empRepo.findAll(pObj);
		List<EmployeeEntity> content = pageData.getContent();
		return content;
	}
	
	
	
	
	

	public EmployeeEntity editById(long empId) {
		EmployeeEntity e = empRepo.findById(empId).get();
		return e;
	}
	
	
	
	

	public void deleteDetails(long empId) {
		empRepo.deleteById(empId);
	}
	
	
	
	

	public List<EmployeeEntity> findByeName(String eName) {
		// TODO Auto-generated method stub
		return empRepo.findByeNameLike("%" + eName + "%");
	}
	
	
	
	

	public List<EmployeeEntity> findByempId(long empId) {

		// String empid = String.valueOf(empId);
		return empRepo.findByempIdLike(empId);

	}
	
	
	

	public List<EmployeeEntity> findByeSalary(float eSalary) {
		return empRepo.findByeSalaryLike(eSalary);
	}
	
	
	
	

	public List<EmployeeEntity> findByfindBymobile(String mobile) {
		return empRepo.findBymobileLike(mobile);
	}
	
	
	
	
	
	public List<EmployeeEntity> findByeMil(String eMail){
		return empRepo.findByeMailLike(eMail);
	}
	
	

	// Total Records And Page Logic
	public List<Long> noOfRecords() {
		long totalRecords = empRepo.count();

		long y = (totalRecords / 5);
		double x = (totalRecords % 5);

		if (x > 0)
			y++;

		List<Long> list = new ArrayList<Long>();
		// long i;
		for (long i = 1; i <= y; i++) {
			list.add(i); // adding element
		}

		System.out.println("Total pages:" + y);

		return list; 
	}

	/*
	 * public List<EmployeeEntity> getAllDetails(){ List<EmployeeEntity> allData =
	 * empRepo.findAll();
	 * 
	 * return allData; }
	 * 
	 * public List<EmployeeEntity> getDataByNameAndId(long num,String name){
	 * List<EmployeeEntity> data = empRepo.findByIdAndName(num, name); return data;
	 * }
	 */

	public List<EmployeeEntity> search(EmployeeEntity employee) {
		
	//	System.out.println(employee.getAccount().getAccountNumber());

		String query = "from EmployeeEntity where 1=1";
		
		if (employee.getEmpId() > 0) {
			query = query + " and empId = " + employee.getEmpId();

			System.out.println("*****************" + employee.getEmpId() + "********************");
		}
		if (!StringUtils.isEmpty(employee.geteName())) {
			query = query + " and eName like '%" + employee.geteName() + "%' ";
		}
		if (employee.geteSalary() > 0) {
			query = query + " and eSalary = " + employee.geteSalary();
		}
		
		
		/*
		 * 
		 * if (!StringUtils.isEmpty(employee.getAccount().getAccountNumber())) { query =
		 * query + " and mobile = " + employee.getAccount().getAccountNumber();
		 * 
		 * 
		 * 
		 * }
		 */
		
		
		
		if (!StringUtils.isEmpty(employee.getMobile())) {
			query = query + " and mobile = " + employee.getMobile();
		}
		if(!StringUtils.isEmpty(employee.geteMail())) {
			query = query + " and email = " +"'" + employee.geteMail() + "'";
			
			System.out.println(query);
			
		}

		TypedQuery<EmployeeEntity> employeeListQuery = entityManager.createQuery(query, EmployeeEntity.class);
		
		// TypedQuery<EmployeeEntity> createNativeQuery = (TypedQuery<EmployeeEntity>) entityManager.createNativeQuery("select * from employee3 where 1=1");
		
	       TypedQuery<Object[]> createNativeQuery = (TypedQuery<Object[]>) entityManager.createQuery("select e.empId,e.eName,a.bankid,a.accountNumber from EmployeeEntity as e LEFT JOIN e.account as a");
		
		System.out.println("Class:"+createNativeQuery.getClass());
		
		
		List<Object[]> resultList = createNativeQuery.getResultList();
		
		
		
		
		
		
		
		for(Object[] emplo:resultList) {
			System.out.println("===============:"+Arrays.toString(emplo ) );
			
			System.out.println("*******************:"+emplo[0]+",   Name="+emplo[1]);
		}
		
		
		
	//	System.out.println("===============:"+createNativeQuery.getResultList().get(0).getAccount().getAccountNumber());
		
	//	System.out.println("===============:"+createNativeQuery.getResultList().get(0));
		
		// System.out.println("**********"+employeeListQuery.getResultList());
		return employeeListQuery.getResultList();

	}
	
	
	
	
	
	
	
	
	
	
	
	
	@SuppressWarnings("deprecation")
	public List<Object[]> search1(EmployeeEntity employee) {
		
		//	System.out.println(employee.getAccount().getAccountNumber());

			String query = "select e.empId,e.eName,a.accountNumber,e.mobile,e.eMail,a.ifsc,a.accountType,a.bankid from EmployeeEntity as e LEFT JOIN e.account as a where 1=1";
			
			if (employee.getEmpId() > 0) {
				query = query + " and e.empId = " + employee.getEmpId();

				System.out.println("*****************" + employee.getEmpId() + "********************");
			}
			if (!StringUtils.isEmpty(employee.geteName())) {
				query = query + " and e.eName like '%" + employee.geteName() + "%' ";
			}
			if (employee.geteSalary() > 0) {
				query = query + " where eSalary = " + employee.geteSalary();
			}
			
			
			
			
			if (!StringUtils.isEmpty(employee.getAccount().getAccountNumber())) {
				query = query + " and  a.accountNumber = " + employee.getAccount().getAccountNumber();
				
				System.out.println(query);
				
			}
			
			
			
			
			if (!StringUtils.isEmpty(employee.getMobile())) {
				query = query + " and mobile = " + employee.getMobile();
			}
			if(!StringUtils.isEmpty(employee.geteMail())) {
				query = query + " and email = " +"'" + employee.geteMail() + "'";
				
				System.out.println(query);
				
			}

		//	TypedQuery<EmployeeEntity> employeeListQuery = entityManager.createQuery(query, EmployeeEntity.class);
			
			// TypedQuery<EmployeeEntity> createNativeQuery = (TypedQuery<EmployeeEntity>) entityManager.createNativeQuery("select * from employee3 where 1=1");
			
		       @SuppressWarnings("unchecked")
			TypedQuery<Object[]> createNativeQuery = (TypedQuery<Object[]>) entityManager.createQuery(query);
			
			System.out.println("Class:"+createNativeQuery.getClass());
			
			
			List<Object[]> resultList = createNativeQuery.getResultList();
			
			
			
			
			
			
			
			for(Object[] emplo:resultList) {
				System.out.println("===============:"+Arrays.toString(emplo ) );
				
				System.out.println("*******************:"+emplo[0]+",   Name="+emplo[1]);
			}
			
			
			
		//	System.out.println("===============:"+createNativeQuery.getResultList().get(0).getAccount().getAccountNumber());
			
		//	System.out.println("===============:"+createNativeQuery.getResultList().get(0));
			
			// System.out.println("**********"+employeeListQuery.getResultList());
			return resultList;

		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	

	public List<?> getData1(String eName,String eMail) {
	    Session session = sessionFactory.getCurrentSession();
	    
	    String hql = "SELECT u.eName,u.eMail  From  employee3 u WHERE u.eName =? OR u.eMail =?  ";
	    org.hibernate.query.Query query1 = session.createQuery(hql);
	    query1.setParameter(0, eName);
	    query1.setParameter(1, eMail);
	   
	    System.out.println(query1.list());
	    
	    
	    
	    
	    
	    
	    
	    SessionFactory factory= new Configuration().configure().buildSessionFactory();
	    
	    Session s=  factory.openSession();
	    
	    Query query= (Query) s.createQuery("");
	    
	    
	    NativeQuery createSQLQuery = s.createSQLQuery("");
	    
	    
	    factory.close();
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    return query1.list();
	}
	
	
	
	
	
	
	
	public List<EmployeeEntity> getData(){
		System.out.println("***********************************");
		Session session=sessionFactory.getCurrentSession();
		
		
		
		System.out.println("=====================================");
		//List<?> result=session.createQuery("select u.empid,u.ename from employee3 u where empid='2'").list();
		List<?> result=session.createQuery("from EmployeeEntity where empId=2").list();
		
		@SuppressWarnings("unchecked")
		List<EmployeeEntity> resultCasted=(List<EmployeeEntity>)result;
		
		
		System.out.println("Data********:*******"+ resultCasted);
		
		return resultCasted;
	}
	
	
	
	
	
	
	
	// Total Records And Page Logic
		public List<Long> trailInServ(long pageNo) {
			long totalRecords = empRepo.count();

			long y = (totalRecords / 5);
			double x = (totalRecords % 5);

			if (x > 0)
				y++;
		
			
			long page_button=pageNo;
			
			List<Long> list1 = new ArrayList<Long>();
			if(pageNo==0) {
				 page_button=1;
			}
			 //sample value
			
		if (page_button <= 5)
		{

			for (long i = 1; i <= 5; i++) 
			{

				if (i <= y)
				{
					list1.add(i); // adding element
				}

			}

		}else 
		{
			
			
			for (long i = page_button-2; i <= page_button+2; i++) //-2 , +2
			{

				if (i <= y)
				{
					list1.add(i); // adding element
				}

			}
			
		}
		
		
		//list1.add(y);
			
			System.out.println("Total pages:" + y);

			return list1; 
		}

	
	
	
	public 	List<EmployeeEntity> recordsPerPage(int value){
		
		List<EmployeeEntity> data = empRepo.limit(value);
		return data;
		
	}
		
		
	
	
	
	
	

}
