package com.netaji.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.netaji.eNum.AccountType;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "bank_account3")
@Embeddable()
public class AccountEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "bank_id")
	private long bankid;

	private String accountNumber;
	private String ifsc;
	private Integer accountType;

	@OneToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "employee_id1", referencedColumnName = "emp_id", nullable = false)
	private EmployeeEntity employee;

	public AccountEntity() {
		super();
	}
	
	
	
	
	

	public AccountEntity(String accountNumber) {
		super();
		this.accountNumber = accountNumber;
	}






	public AccountEntity(long bankid, String accountNumber, String ifsc, Integer accountType, EmployeeEntity employee) {
		super();
		this.bankid = bankid;
		this.accountNumber = accountNumber;
		this.ifsc = ifsc;
		this.accountType = accountType;
		this.employee = employee;
	}






	public AccountEntity(String accountNumber, String ifsc, Integer accountType, EmployeeEntity employee) {
		super();
		this.accountNumber = accountNumber;
		this.ifsc = ifsc;
		this.accountType = accountType;
		this.employee = employee;
	}






	public long getBankid() {
		return bankid;
	}

	public void setBankid(long bankid) {
		this.bankid = bankid;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getIfsc() {
		return ifsc;
	}

	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}

	public Integer getAccountType() {
		return accountType;
	}

	public void setAccountType(Integer accountType) {
		this.accountType = accountType;
	}

	public EmployeeEntity getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeEntity employee) {
		this.employee = employee;
	}

	public String getAccountTypeValue() {
		return AccountType.getAcccountTypeName(accountType);
	}






	@Override
	public String toString() {
		return "AccountEntity [bankid=" + bankid + ", accountNumber=" + accountNumber + ", ifsc=" + ifsc
				+ ", accountType=" + accountType + ", employee=" + employee + "]";
	}
	
	
	
	
	
	

}
