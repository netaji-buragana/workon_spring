package com.netaji.entity;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;



//import lombok.Data;
//@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="employee3")
public class EmployeeEntity {
	

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="emp_id")
	private long empId;
	
	@Column(name="ename")
	private String eName;
	
	@Column(name="esalary")
	private float eSalary;
	
	@Column(name="mobile")
	private String mobile;
	
    @Column(name="email")
	private String eMail;
	
	/*
	 * @Column(name="address") private String address;
	 */
	
	
	
	@OneToMany(mappedBy="employee", cascade = CascadeType.ALL,fetch = FetchType.LAZY) 	
	private List<AddressEntity> addresses;
	
	
	
	  @OneToOne(mappedBy="employee", cascade = CascadeType.ALL,fetch =FetchType.LAZY) 
	  private AccountEntity account;
	 
	/*
	 * @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	 * 
	 * @JoinTable(name = "Employee_projects" , joinColumns = { @JoinColumn(name =
	 * "emp_id", nullable = false), }, inverseJoinColumns = { @JoinColumn(name =
	 * "project_Id") }
	 * 
	 * 
	 * 
	 * )
	 */
	  
	  @ManyToMany(mappedBy = "employee", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
		private Set<ProjectEntity> projects;//duplicates are not allowed 
	
	
	

	public Set<ProjectEntity> getProjects() {
		return projects;
	}



	public void setProjects(Set<ProjectEntity> projects) {
		this.projects = projects;
	}



	public AccountEntity getAccount() {
		return account;
	}



	public void setAccount(AccountEntity account) {
		this.account = account;
	}



	public EmployeeEntity(List<AddressEntity> addresses) {
		super();
		this.addresses = addresses;
	}



	public EmployeeEntity() {
		super();
	}
	
	
	
	public List<AddressEntity> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<AddressEntity> addresses) {
		this.addresses = addresses;
	}
	
	
	
	

	
	public EmployeeEntity(long empId, String eName, float eSalary, String mobile) {
		super();
		this.empId = empId;
		this.eName = eName;
		this.eSalary = eSalary;
		this.mobile = mobile;
	}

	/*
	 * public EmployeeEntity(long empId, String eName, String mobile, String
	 * address) { super(); this.empId = empId; this.eName = eName; this.mobile =
	 * mobile; this.address = address; }
	 */
	
	

	public EmployeeEntity(long empId, String eName, float eSalary, String mobile, String eMail) {
		super();
		this.empId = empId;
		this.eName = eName;
		this.eSalary = eSalary;
		this.mobile = mobile;
		this.eMail = eMail;
	}
	
	
	
	
	
	

	public EmployeeEntity(long empId, String eName, String mobile, String eMail, AccountEntity account) {
		super();
		this.empId = empId;
		this.eName = eName;
		this.mobile = mobile;
		this.eMail = eMail;
		this.account = account;
	}



	public long getEmpId() {
		return empId;
	}

	public void setEmpId(long empId) {
		this.empId = empId;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public float geteSalary() {
		return eSalary;
	}

	public void seteSalary(float eSalary) {
		this.eSalary = eSalary;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}



	@Override
	public String toString() {
		return "EmployeeEntity [empId=" + empId + ", eName=" + eName + ", eSalary=" + eSalary + ", mobile=" + mobile
				+ ", eMail=" + eMail + "]";
	}

	/*
	 * public String getAddress() { return address; }
	 * 
	 * public void setAddress(String address) { this.address = address; }
	 */

	/*
	 * @Override public String toString() { return "EmployeeEntity [empId=" + empId
	 * + ", eName=" + eName + ", eSalary=" + eSalary + ", mobile=" + mobile +
	 * ", eMail=" + eMail + ", address=" + "" + ", addresses=" + addresses + "]"; }
	 */

	
	
	
   
	
	
	

}
