package com.netaji.repository.controller;

import java.util.ArrayList;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.netaji.eNum.AddressType;
import com.netaji.entity.AccountEntity;
import com.netaji.entity.AddressEntity;
import com.netaji.entity.EmployeeEntity;
import com.netaji.entity.User;
import com.netaji.repository.service.AddressService;
import com.netaji.repository.service.EmployeeService;
import com.netaji.repository.service.MyUserDetailsService1;
import com.netaji.repository.service.UserPrincipal;

import net.bytebuddy.implementation.bytecode.ByteCodeAppender.Size;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private AddressService addressService;
	
	
	@Autowired
	private MyUserDetailsService1 userdetailService;
	

	
	  @GetMapping("/display")
	  public String view() {
		  // m.addAttribute("msg","Hello");
	  return "index"; }
	 

	// done retrieve by page
	@GetMapping("/page")
	public String viewDetails1(@AuthenticationPrincipal UserPrincipal userDetails,  @RequestParam(defaultValue = "0") int val, Model modal) {
		
		
		
		System.out.println(AddressType.getAddressTypeName(1));
		
		
		
		
		String username = userDetails.getUsername();
		User data = userdetailService.getByUserName(username);
		
		
		modal.addAttribute("userName",data.getUsername().toUpperCase());
		modal.addAttribute("imageId",data.getId());
		modal.addAttribute("image",data.getImage());
		
		modal.addAttribute("photo",data.getPhotos());
		
	
		
		List<Long> pageObj = employeeService.noOfRecords();
		long totalPages = pageObj.get(pageObj.size()-1);
		
		modal.addAttribute("firstPage",pageObj.get(0));
		modal.addAttribute("lastPage",totalPages);

		if(val>totalPages) {
			val=(int) totalPages;
		}
		
		List<EmployeeEntity> details = employeeService.getDetails(val);
		
		
//	List<?> data1 = employeeService.getData1("ramu1","ramu@gmail.com");
	//	employeeService.getData();
	
		
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
		
		
		
System.out.println("Total Data:"+details+"***");     //tatal data with Address




          String addressTypeName = AddressType.getAddressTypeName(2);   //Type Of Address 
          
          System.out.println("Address Type:"+addressTypeName);
          
          
          
          
          
          
          

		return "view";
	}

	/*
	 * @GetMapping("/addDetails") public String addEmp() {
	 * 
	 * return "add"; }
	 */

	@PostMapping("/insert")
	public String addDetails(@ModelAttribute EmployeeEntity employeeEntity,@ModelAttribute AddressEntity addressEntity,@ModelAttribute AccountEntity accountEntiry, Model modal) {
		
		
		//employeeEntity.setAddresses(addressEntity);
		
		AddressEntity addressData=new AddressEntity( addressEntity.getLine1(), addressEntity.getLine2(), addressEntity.getStreet(), addressEntity.getVillage(), addressEntity.getCity(), addressEntity.getState(),addressEntity.getCountry(), addressEntity.getPin(), addressEntity.getAddressType(), employeeEntity);
		
		AccountEntity accountData=new AccountEntity( accountEntiry.getAccountNumber(),accountEntiry.getIfsc(),accountEntiry.getAccountType(), employeeEntity);
		
		List<EmployeeEntity> mailDetails = employeeService.findByeMil(employeeEntity.geteMail());
		
		List<EmployeeEntity> mobileDetails = employeeService.findByfindBymobile(employeeEntity.getMobile());
		
		
		System.out.println("Mobile Number:"+employeeEntity.getMobile());
		
		
		/*
		 * System.out.println("Address:**********"+employeeEntity.getAddresses().size()+
		 * "************");
		 */
		
		
		
		
		
		
		
		/*
		 * List<EmployeeEntity> list = new ArrayList<EmployeeEntity>();
		 * list.add(employeeEntity); list.addAll((Collection<? extends EmployeeEntity>)
		 * addressEntity);
		 */
		
		
		
		
		
		if(mailDetails.isEmpty() && mobileDetails.isEmpty()) 
		{
			System.out.println(employeeEntity+"Successfully Added");
			System.out.println(addressEntity+"Successfully Added");
			
			
			
			
			List<AddressEntity> list=new ArrayList<>();
			list.add(addressData);
			
			employeeEntity.setAddresses(list);
			employeeEntity.setAccount(accountData);
			
			employeeService.addDetails(employeeEntity);
			//adddressService.addDetails(data);
			
			
			modal.addAttribute("details","Successfully Added");
			
		}
		else {
			modal.addAttribute("details","Already Having This credentials");
		}
	
		int val = 0;
	
		List<Long> pageObj = employeeService.noOfRecords();
		long totalPages = pageObj.get(pageObj.size()-1);
		
		modal.addAttribute("firstPage",pageObj.get(0));
		modal.addAttribute("lastPage",totalPages);

		if(val>totalPages) {
			val=(int) totalPages;
		}
		
		List<EmployeeEntity> details = employeeService.getDetails(val);
		for(EmployeeEntity e: details) {
			System.out.println("emp name.."+e.getEmpId()+"::"+e.getAddresses().size());
		}
	
		
		modal.addAttribute("emp", details);

		List<Long> pagesObject = employeeService.trailInServ(val);

		modal.addAttribute("count1", pagesObject); // This is for total pages printing	
		modal.addAttribute("nextPage", pagesObject.get(pagesObject.size()-1)+2);
		modal.addAttribute("previousPage", pagesObject.get(0));
		
		
		if(val==0) {
			val=1; // This is for page 
			modal.addAttribute("page", val);
		}
		else
		modal.addAttribute("page", val); // particular page indication by color
		
		
		return "view";
	}

	// editById?action=edit/
	@GetMapping("/editById")
	public String editById(@AuthenticationPrincipal UserPrincipal userDetails,@RequestParam(defaultValue = "0") int val,@RequestParam("action") String actionName, @RequestParam("id") String empid, Model modal) {

		System.out.println(actionName + "***************");
		
		
		
		String username = userDetails.getUsername();
		User data = userdetailService.getByUserName(username);
		
		
		modal.addAttribute("userName",data.getUsername().toUpperCase());
		modal.addAttribute("imageId",data.getId());
		
		
		
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

		// int val = 0;

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
		
		return "view";
	}

	@PostMapping("/update")
	public String updateById(@AuthenticationPrincipal UserPrincipal userDetails,@ModelAttribute EmployeeEntity employeeEntity, ModelMap modal) {
		
		
		
		String username = userDetails.getUsername();
		User data = userdetailService.getByUserName(username);
		
		
		modal.addAttribute("userName",data.getUsername().toUpperCase());
		modal.addAttribute("imageId",data.getId());
	
	
		
		List<AddressEntity> list=new ArrayList<>();
		
		
		employeeEntity.setAddresses(list);
		
		
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

		return "view";
	}
	
	
	
	
	
	@GetMapping("/updateAddress")
	public String updateByIdAddress(@AuthenticationPrincipal UserPrincipal userDetails,@ModelAttribute AddressEntity addressEntity, ModelMap modal) {
		
		//System.out.println("*****************"+addressEntity);
		
		
		
		String username = userDetails.getUsername();
		User userdata = userdetailService.getByUserName(username);
		
		
		modal.addAttribute("userName",userdata.getUsername().toUpperCase());
		modal.addAttribute("imageId",userdata.getId());
		
		
		//employeeEntity = employeeService.editById(employeeEntity.getEmpId());
		
		
		AddressEntity data=new AddressEntity(addressEntity.getId(), addressEntity.getLine1(), addressEntity.getLine2(), addressEntity.getStreet(), addressEntity.getVillage(), addressEntity.getCity(), addressEntity.getState(),addressEntity.getCountry(), addressEntity.getPin(), addressEntity.getAddressType());
		
		
		
	//	addressService.addDetails(data);
		
	//	System.out.println("*****************"+data);
		
		
		/*
		 * String s=addressEntity.getLine1();
		 * 
		 * String[] arrOfStr = s.split(",");
		 * 
		 * for (String a : arrOfStr) System.out.println(a);
		 * 
		 * System.out.println("Id Values:"+addressEntity.getId()+addressEntity.getLine1(
		 * ));
		 */
		
	//	AddressEntity addObj = adddressService.editById(addressEntity.getId());
		
		
		
		List<AddressEntity> list=new ArrayList<>();
		list.add(data);
		
	//	employeeEntity.setAddresses(list);
		
		//System.out.println("Id Value:"+addressEntity.getId());
		//adddressService.addDetails(data);
	//	employeeService.addDetails(employeeEntity);
		
		// EmployeeEntity empObj = employeeService.editById(emp);
		// m.addAttribute("e", empObj);
		
	//	if(employeeEntity!=null && addressEntity.getId()!=0)
	//	modal.addAttribute("update", "Record Successfully Updated");
		
		if(addressEntity.getId()==0)
			modal.addAttribute("details","Successfully Added");

		int val = 0;


		List<Long> pageObj = employeeService.noOfRecords();
		long totalPages = pageObj.get(pageObj.size()-1);
		
		modal.addAttribute("firstPage",pageObj.get(0));
		modal.addAttribute("lastPage",totalPages);

		if(val>totalPages) {
			val=(int) totalPages;
		}
		else
		modal.addAttribute("page", val); // particular page indication by color

		return "view";
	}
	
	
	
	
	
	
	
	

	@GetMapping("/delete1/{empId}") // Extra method to Delete by popup
	public String deleteDeteil1(@AuthenticationPrincipal UserPrincipal userDetails,@PathVariable(value = "empId") long empId, Model modal) {
		
		
		String username = userDetails.getUsername();
		User data = userdetailService.getByUserName(username);
		
		
		modal.addAttribute("userName",data.getUsername().toUpperCase());
		modal.addAttribute("imageId",data.getId());
		
		
		employeeService.deleteDetails(empId);
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

		return "redirect:/page?delete";
	}

	@GetMapping("/searchAll")
	public String search(@AuthenticationPrincipal UserPrincipal userDetails,@RequestParam(defaultValue = "0") long empId, @RequestParam(defaultValue = "") String eName,
			@RequestParam(defaultValue = "0") float eSalary, @RequestParam(defaultValue = "") String mobile,
			 @RequestParam(defaultValue = "") String eMail ,@RequestParam(defaultValue="")String val1,Model modal) {
		
		
		String username = userDetails.getUsername();
		User userdata = userdetailService.getByUserName(username);
		
		
		modal.addAttribute("userName",userdata.getUsername().toUpperCase());
		modal.addAttribute("imageId",userdata.getId());
		
		
		
		
		if(!StringUtils.isEmpty(val1)) {
			
			
			System.out.println("****************************************************");
			
			List<EmployeeEntity> data = employeeService.recordsPerPage(Integer.parseInt(val1));
			
			
			
			System.out.println(data);
			modal.addAttribute("emp", data);
			
			modal.addAttribute("value", val1);
			
			
			
		}
		else {

		EmployeeEntity employee = new EmployeeEntity(empId, eName, eSalary, mobile,eMail);
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
		
		
		System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq"+emp);
		
		
		  if(empId==0 || eSalary==0)
		  {
			  String id=" ";
		  modal.addAttribute("id",id);
		  System.out.println("000");
		  
		  }
		  
		  if(empId>0 )
		  
		  {
			  modal.addAttribute("deleteid",empId); 
			  
		  }
		  
		  if( eSalary>0) { modal.addAttribute("salary",eSalary); }
		  modal.addAttribute("name",eName);
		  
		  modal.addAttribute("mobile",mobile); modal.addAttribute("address",eMail);
		 
		}
	
		
		
		return "view";
	}
	
	
	
	

	
	/*
	 * // trail for dynamic pagination
	 * 
	 * @GetMapping("/trail") public String trail(@RequestParam(defaultValue = "0")
	 * long val, Model modal) {
	 * 
	 * List<Long> pageObj = employeeService.noOfRecords(); long totalPages =
	 * pageObj.get(pageObj.size() - 1);
	 * 
	 * modal.addAttribute("firstPage", pageObj.get(0));
	 * modal.addAttribute("lastPage", totalPages);
	 * 
	 * if (val > totalPages) { val = totalPages; }
	 * 
	 * List<EmployeeEntity> details = employeeService.getDetails((int) val);
	 * 
	 * modal.addAttribute("emp", details);
	 * 
	 * List<Long> pagesObject = employeeService.trailInServ(val);
	 * 
	 * modal.addAttribute("count1", pagesObject); // This is for total pages
	 * printing modal.addAttribute("nextPage", pagesObject.get(pagesObject.size() -
	 * 1)); modal.addAttribute("previousPage", pagesObject.get(0));
	 * 
	 * if (val == 0) { val = 1; // This is for page modal.addAttribute("page", val);
	 * } else modal.addAttribute("page", val); // particular page indication by
	 * color
	 * 
	 * return "view"; }
	 */
	
	
	
	
	
	
	@GetMapping("/addNewAddress")
	public String editById1(@AuthenticationPrincipal UserPrincipal userDetails,@RequestParam("action") String actionName, @RequestParam("id") String empid, Model modal) {

		
		String username = userDetails.getUsername();
		User data = userdetailService.getByUserName(username);
		
		
		modal.addAttribute("userName",data.getUsername().toUpperCase());
		modal.addAttribute("imageId",data.getId());
		
		
		
		System.out.println(actionName + "***************");
		EmployeeEntity empObj = employeeService.editById(Integer.parseInt(empid));
		modal.addAttribute("b", empObj);
		
		//long addressTableId = empObj.getAddresses().get(0).getId();
		
		
		
		
		
		System.out.println("***+++++++:"+empObj);

		modal.addAttribute("actionName", actionName);

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
		
		return "view";
	}
	

	
	
	
	
	
	@GetMapping("/editAddress")
	public String editForAddress(@AuthenticationPrincipal UserPrincipal userDetails,@RequestParam("action") String actionName, @RequestParam("id") String id,@RequestParam("eid") String empId, Model modal) {
		
		
		
		
		
		String username = userDetails.getUsername();
		User data = userdetailService.getByUserName(username);
		
		
		modal.addAttribute("userName",data.getUsername().toUpperCase());
		modal.addAttribute("imageId",data.getId());
		
		
		
		
		modal.addAttribute("selectSection",id);
		
		System.out.println(actionName + "***************");
		EmployeeEntity empObj1 = employeeService.editById(Integer.parseInt(empId));
		modal.addAttribute("b", empObj1);
		
		//long addressTableId = empObj.getAddresses().get(0).getId();
		
		

		System.out.println(actionName + "***************");
		AddressEntity empObj = addressService.editById(Integer.parseInt(id));
		
		
		System.out.println(empObj.getId());
		
		modal.addAttribute("addressData", empObj);
		
		//long addressTableId = empObj.getAddresses().get(0).getId();
		
		
		
		
		
		System.out.println("***+++++++:"+empObj);

		modal.addAttribute("actionName", actionName);

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
		
		return "view";
	}
	
	
	
	
	@GetMapping("/deleteForAddress/{id}") // Extra method to Delete by popup
	public String deleteForAddress(@AuthenticationPrincipal UserPrincipal userDetails,@PathVariable(value = "id") long id, Model modal) {
		
		
		String username = userDetails.getUsername();
		User data = userdetailService.getByUserName(username);
		
		
		modal.addAttribute("userName",data.getUsername().toUpperCase());
		modal.addAttribute("imageId",data.getId());
		
		
		
		
		addressService.deleteDetails(id);
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

		return "redirect:/page?delete";
	}
	
	
	
	
	
	
	@PostMapping("/updateAll")
	public String update(@ModelAttribute EmployeeEntity employeeEntity,@ModelAttribute AddressEntity addressEntity, ModelMap modal) {
		AddressEntity data=new AddressEntity(addressEntity.getId(), addressEntity.getLine1(), addressEntity.getLine2(), addressEntity.getStreet(), addressEntity.getVillage(), addressEntity.getCity(), addressEntity.getState(),addressEntity.getCountry(), addressEntity.getPin(), addressEntity.getAddressType(), employeeEntity);
		
	//	AddressEntity addObj = adddressService.editById(addressEntity.getId());
		
		System.out.println("*************++++++++++======"+addressEntity.getId());
		
		List<AddressEntity> list=new ArrayList<>();
		list.add(data);
		
		employeeEntity.setAddresses(list);
		
		System.out.println("Id Value:"+addressEntity.getId());
		//adddressService.addDetails(data);
		employeeService.addDetails(employeeEntity);
		
		// EmployeeEntity empObj = employeeService.editById(emp);
		// m.addAttribute("e", empObj);
		
		if(employeeEntity!=null && addressEntity.getId()!=0)
		modal.addAttribute("update", "Record Successfully Updated");
		
		if(addressEntity.getId()==0)
			modal.addAttribute("details","Successfully Added");

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
		
		System.out.println("**********"+details.get(2).getAddresses());

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

		return "view";
	}
	
	
	
	
	
	@GetMapping("/recordsPerPage")
	public String recordsPerPage(@RequestParam(defaultValue = "0") int val1, Model modal) {
		
		
		
		
		List<EmployeeEntity> data = employeeService.recordsPerPage(val1);
		
		
		
		System.out.println(data);
		modal.addAttribute("emp", data);
		
		modal.addAttribute("value", val1);
		
		
		
		
		
		
		/*
		 * System.out.println(AddressType.getAddressTypeName(1));
		 * 
		 * 
		 * 
		 * List<Long> pageObj = employeeService.noOfRecords(); long totalPages =
		 * pageObj.get(pageObj.size()-1);
		 * 
		 * modal.addAttribute("firstPage",pageObj.get(0));
		 * modal.addAttribute("lastPage",totalPages);
		 * 
		 * if(val1>totalPages) { val1=(int) totalPages; }
		 * 
		 * List<EmployeeEntity> details = employeeService.getDetails(val1);
		 * 
		 * 
		 * 
		 * 
		 * 
		 * modal.addAttribute("emp", details);
		 * 
		 * List<Long> pagesObject = employeeService.trailInServ(val1);
		 * 
		 * modal.addAttribute("count1", pagesObject); // This is for total pages
		 * printing modal.addAttribute("nextPage",
		 * pagesObject.get(pagesObject.size()-1)); modal.addAttribute("previousPage",
		 * pagesObject.get(0));
		 * 
		 * 
		 * if(val1==0) { val1=1; // This is for page modal.addAttribute("page", val1); }
		 * else modal.addAttribute("page", val1); // particular page indication by color
		 * 
		 * 
		 * 
		 * System.out.println("Total Data:"+details+"***"); //tatal data with Address
		 * 
		 * 
		 * 
		 * 
		 * String addressTypeName = AddressType.getAddressTypeName(2); //Type Of Address
		 * 
		 * System.out.println("Address Type:"+addressTypeName);
		 */

		return "view";
	}
	
	
	
	

}
