package com.netaji.repository.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.netaji.eNum.AccountType;
import com.netaji.eNum.AddressType;
import com.netaji.entity.AccountEntity;
import com.netaji.entity.AddressEntity;
import com.netaji.entity.EmployeeEntity;
import com.netaji.repository.service.AccountService;
//import com.netaji.repository.service.AccountService;
import com.netaji.repository.service.AddressService;
import com.netaji.repository.service.EmployeeService;

@Controller
public class AccountController {
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private AddressService addressService;
	
@Autowired
private AccountService accountService;
	
	
	
	@GetMapping("/accounts-info")
	public String viewDetails1(@RequestParam(defaultValue = "0") int val, Model modal) {
		
	//	System.out.println(AccountType.getAccountTypeName(AccountType.getAccountType()));
		
		
		List<Long> pageObj = employeeService.noOfRecords();
		long totalPages = pageObj.get(pageObj.size()-1);
		
		modal.addAttribute("firstPage",pageObj.get(0));
		modal.addAttribute("lastPage",totalPages);

		if(val>totalPages) {
			val=(int) totalPages;
		}
		
		List<EmployeeEntity> details = employeeService.getDetails(val);
		
		
		modal.addAttribute("emp", details);

		List<Long> pagesObject = employeeService.trailInServ(val);

		modal.addAttribute("count1", pagesObject); // This is for total pages printing	
		modal.addAttribute("nextPage", pagesObject.get(pagesObject.size()-1));
		modal.addAttribute("previousPage", pagesObject.get(0));
		
		
		if(val==0) {
			val=1; // This is for page 
			modal.addAttribute("page", val);
		}
		else
		modal.addAttribute("page", val); // particular page indication by color

          String addressTypeName = AddressType.getAddressTypeName(2);   //Type Of Address 
          
          System.out.println("Address Type:"+addressTypeName);

		return "view1";
	}
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/editByIdAccount")
	public String editById(@RequestParam(defaultValue = "0") int val,@RequestParam("action") String actionName, @RequestParam("id") String empid, Model modal) {

		System.out.println(actionName + "***************");
		EmployeeEntity empObj = employeeService.editById(Integer.parseInt(empid));
		modal.addAttribute("b", empObj);
		
		//long addressTableId = empObj.getAddresses().get(0).getId();
		
		System.out.println(empObj.getAddresses().size());
		
		
		
		List<Integer> list1=new ArrayList<>();
		for(int i=1;i<=empObj.getAddresses().size();i++) {
			list1.add(i);
		}//list.add(e);
		modal.addAttribute("list3",list1);
		
		
		
		System.out.println("***+++++++:"+empObj);

		modal.addAttribute("actionName", actionName);

		

		List<Long> pageObj = employeeService.noOfRecords();
		long totalPages = pageObj.get(pageObj.size()-1);
		
		modal.addAttribute("firstPage",pageObj.get(0));
		modal.addAttribute("lastPage",totalPages);

		if(val>totalPages) {
			val=(int) totalPages;
		}
		
		List<EmployeeEntity> details = employeeService.getDetails(val);
	
		
		modal.addAttribute("emp", details);
		
		
		
		

		List<Long> pagesObject = employeeService.trailInServ(val);

		modal.addAttribute("count1", pagesObject); // This is for total pages printing	
		modal.addAttribute("nextPage", pagesObject.get(pagesObject.size()-1));
		modal.addAttribute("previousPage", pagesObject.get(0));
		
		
		if(val==0) {
			val=1; // This is for page 
			modal.addAttribute("page", val);
		}
		else
		modal.addAttribute("page", val); // particular page indication by color
		
		return "view1";
	}
	
	
	
	
	
	@PostMapping("/updateAccount")
	public String updateByIdAccount(@ModelAttribute EmployeeEntity employeeEntity,@ModelAttribute AccountEntity accountEntiry, Model modal) {
		
		
		//employeeEntity.setAddresses(addressEntity);
		
		
		
		AccountEntity accountData=new AccountEntity(accountEntiry.getBankid(),accountEntiry.getAccountNumber(),accountEntiry.getIfsc(),accountEntiry.getAccountType(), employeeEntity);
		
		
		
		employeeEntity.setAccount(accountData);
		
		employeeService.addDetails(employeeEntity);
		
		
		
		if(employeeEntity!=null )
		modal.addAttribute("update", "Record Successfully Updated");
		
		

		int val = 0;


		List<Long> pageObj = employeeService.noOfRecords();
		long totalPages = pageObj.get(pageObj.size()-1);
		
		modal.addAttribute("firstPage",pageObj.get(0));
		modal.addAttribute("lastPage",totalPages);

		if(val>totalPages) {
			val=(int) totalPages;
		}
		
		List<EmployeeEntity> details = employeeService.getDetails(val);
		
		System.out.println(details);
		
		modal.addAttribute("emp", details);
		
		

		List<Long> pagesObject = employeeService.trailInServ(val);

		modal.addAttribute("count1", pagesObject); // This is for total pages printing	
		modal.addAttribute("nextPage", pagesObject.get(pagesObject.size()-1));
		modal.addAttribute("previousPage", pagesObject.get(0));
		
		
		if(val==0) {
			val=1; // This is for page 
			modal.addAttribute("page", val);
		}
		else
		modal.addAttribute("page", val); // particular page indication by color

		return "view1";
	}
	
	
	
	@GetMapping("/addNewAccount")
	public String addAccount(@ModelAttribute EmployeeEntity employeeEntity,@ModelAttribute AccountEntity accountEntity, Model modal) {	
		
		AccountEntity accountData=new AccountEntity(accountEntity.getAccountNumber(),accountEntity.getIfsc(),accountEntity.getAccountType(), employeeEntity);
				
		
		employeeEntity.setAccount(accountData);
		
		employeeService.addDetails(employeeEntity);
		
		

		int val = 0;


		List<Long> pageObj = employeeService.noOfRecords();
		long totalPages = pageObj.get(pageObj.size()-1);
		
		modal.addAttribute("firstPage",pageObj.get(0));
		modal.addAttribute("lastPage",totalPages);

		if(val>totalPages) {
			val=(int) totalPages;
		}
		
		List<EmployeeEntity> details = employeeService.getDetails(val);
		
		System.out.println(details);
		
		modal.addAttribute("emp", details);
		
		

		List<Long> pagesObject = employeeService.trailInServ(val);

		modal.addAttribute("count1", pagesObject); // This is for total pages printing	
		modal.addAttribute("nextPage", pagesObject.get(pagesObject.size()-1));
		modal.addAttribute("previousPage", pagesObject.get(0));
		
		
		if(val==0) {
			val=1; // This is for page 
			modal.addAttribute("page", val);
		}
		else
		modal.addAttribute("page", val); // particular page indication by color

		return "view1";
	}
	
	
	
	
	

	@GetMapping("/deleteAccount/{bankid}") // Extra method to Delete by popup
	public String deleteForAddress(@PathVariable(value = "bankid") long bankid, Model modal) {
		
		
		
		
		accountService.deleteDetails(bankid);
		modal.addAttribute("delete", "Deleted Successfully");
		
		
		

		int val = 0;

		List<Long> pageObj = employeeService.noOfRecords();
		long totalPages = pageObj.get(pageObj.size()-1);
		
		modal.addAttribute("firstPage",pageObj.get(0));
		modal.addAttribute("lastPage",totalPages);

		if(val>totalPages) {
			val=(int) totalPages;
		}
		
		List<EmployeeEntity> details = employeeService.getDetails(val);
		
		modal.addAttribute("emp", details);

		List<Long> pagesObject = employeeService.trailInServ(val);

		modal.addAttribute("count1", pagesObject); // This is for total pages printing	
		modal.addAttribute("nextPage", pagesObject.get(pagesObject.size()-1));
		modal.addAttribute("previousPage", pagesObject.get(0));
		
		if(val==0) {
			val=1; // This is for page 
			modal.addAttribute("page", val);
		}
		else
		modal.addAttribute("page", val); // particular page indication by color

		return "view1";
	}
	
	
	
	
	
	
	@GetMapping("/search-account")
	public String search(@RequestParam(defaultValue = "0") long empId, @RequestParam(defaultValue = "") String eName,
			@RequestParam(defaultValue = "") String accountNumber, @RequestParam(defaultValue = "") String mobile,
			 @RequestParam(defaultValue = "") String eMail ,Model modal) {
		
		AccountEntity account = new AccountEntity(accountNumber);
		
		
		
		System.out.println("*********************"+account.getAccountNumber());

		EmployeeEntity employee = new EmployeeEntity(empId, eName,  mobile,eMail,account);
		List<EmployeeEntity> emp = employeeService.search(employee);
		
		
		if(emp.isEmpty()) {
			
			
			modal.addAttribute("nodata","No Data Found");
			
			   
			int val = 0;

			List<Long> pageObj = employeeService.noOfRecords();
			long totalPages = pageObj.get(pageObj.size()-1);
			
			modal.addAttribute("firstPage",pageObj.get(0));
			modal.addAttribute("lastPage",totalPages);

			if(val>totalPages) {
				val=(int) totalPages;
			}
			
			List<EmployeeEntity> details = employeeService.getDetails(val);
			
			
			
			
			System.out.println("All Data:"+details);

			List<Long> pagesObject = employeeService.trailInServ(val);

			modal.addAttribute("count1", pagesObject); // This is for total pages printing	
			modal.addAttribute("nextPage", pagesObject.get(pagesObject.size()-1));
			modal.addAttribute("previousPage", pagesObject.get(0));
			
			if(val==0) {
				val=1; // This is for page 
				modal.addAttribute("page", val);
			}
			else
			modal.addAttribute("page", val); // particular page indication by color
			
			
			
		}
		else
		modal.addAttribute("emp", emp);
				
		  if(empId==0 )
		  {
			  String id=" ";
		  modal.addAttribute("id",id);
		  System.out.println("000");
		  
		  }
		  
		  if(empId>0 )
		  
		  {
			  modal.addAttribute("deleteid",empId); 
			  
		  }
		  
		  modal.addAttribute("accountNumber",accountNumber);
		  modal.addAttribute("name",eName);
		  
		  modal.addAttribute("mobile",mobile); modal.addAttribute("address",eMail);
		 
		
	
		
		
		return "view1";
	}
	
	
	
	
	
	
	
	
	
	@GetMapping("/search-account1")
	public String search1(@RequestParam(defaultValue = "0") long empId, @RequestParam(defaultValue = "") String eName,
			@RequestParam(defaultValue = "") String accountNumber, @RequestParam(defaultValue = "") String mobile,
			 @RequestParam(defaultValue = "") String eMail ,Model modal) {
		
		AccountEntity account = new AccountEntity(accountNumber);
		
		
		
		System.out.println("*********************"+account.getAccountNumber());

		EmployeeEntity employee = new EmployeeEntity(empId, eName,  mobile,eMail,account);
		List<Object[]> emp1 = employeeService.search1(employee);
		
		
		for(Object[] data:emp1) {
			System.out.println("Total New Data:"+Arrays.toString(data));
			System.out.println("------------------------------------------------------");
			System.out.println(data[0]+","+data[2]+","+data[3]+","+data[4]+","+data[5]+","+data[6]+","+data[7]);
		}
		
		
		
		
		
		
		
		if(emp1.isEmpty()) {
			
			
			modal.addAttribute("nodata","No Data Found");
			
			   
			int val = 0;

			List<Long> pageObj = employeeService.noOfRecords();
			long totalPages = pageObj.get(pageObj.size()-1);
			
			modal.addAttribute("firstPage",pageObj.get(0));
			modal.addAttribute("lastPage",totalPages);

			if(val>totalPages) {
				val=(int) totalPages;
			}
			
			List<EmployeeEntity> details = employeeService.getDetails(val);
			
			
			
			
			System.out.println("All Data:"+details);

			List<Long> pagesObject = employeeService.trailInServ(val);

			modal.addAttribute("count1", pagesObject); // This is for total pages printing	
			modal.addAttribute("nextPage", pagesObject.get(pagesObject.size()-1));
			modal.addAttribute("previousPage", pagesObject.get(0));
			
			if(val==0) {
				val=1; // This is for page 
				modal.addAttribute("page", val);
			}
			else
			modal.addAttribute("page", val); // particular page indication by color
			
			
			
		}
		else
		modal.addAttribute("emp1", emp1);
				
		  if(empId==0 )
		  {
			  String id=" ";
		  modal.addAttribute("id",id);
		  System.out.println("000");
		  
		  }
		  
		  if(empId>0 )
		  
		  {
			  modal.addAttribute("deleteid",empId); 
			  
		  }
		  
		  modal.addAttribute("accountNumber",accountNumber);
		  modal.addAttribute("name",eName);
		  
		  modal.addAttribute("mobile",mobile); modal.addAttribute("address",eMail);
		 
		
	
		
		
		return "view1";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}