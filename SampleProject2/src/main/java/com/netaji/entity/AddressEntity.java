package com.netaji.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.eclipse.jdt.internal.compiler.ast.FalseLiteral;

import com.netaji.eNum.AddressType;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "address3")
public class AddressEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private long id;

	@Column(name = "line1")
	private String line1;

	@Column(name = "line2")
	private String line2;

	@Column(name = "street")
	private String street;

	@Column(name = "village")
	private String village;

	@Column(name = "city")
	private String city;

	@Column(name = "state")
	private String state;

	@Column(name = "country")
	private String country;

	@Column(name = "pin")
	private String pin;

	@Column(name = "address_type")
	private Integer addressType;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "employee_id", referencedColumnName = "emp_id", nullable = false)
	private EmployeeEntity employee;
	
	
	
	/*
	 * @OneToOne(mappedBy="address1", cascade = CascadeType.ALL,fetch =
	 * FetchType.LAZY) private SectionEntity section;
	 */

	
	public AddressEntity() {
		super();
	}
	
	
	
	

	public AddressEntity(AddressEntity addressEntity,EmployeeEntity employeeEntity) {
		super();
	}





	public AddressEntity(String line1, String line2, String street, String village, String city, String state,
			String country, String pin, Integer addressType, EmployeeEntity employee) {
		super();

		this.line1 = line1;
		this.line2 = line2;
		this.street = street;
		this.village = village;
		this.city = city;
		this.state = state;
		this.country = country;
		this.pin = pin;
		this.addressType = addressType;
		this.employee = employee;

	}
	
	
	
	
	
	
	
	
	
	

	public AddressEntity(long id, String line1, String line2, String street, String village, String city, String state,
			String country, String pin, Integer addressType) {
		super();
		this.id = id;
		this.line1 = line1;
		this.line2 = line2;
		this.street = street;
		this.village = village;
		this.city = city;
		this.state = state;
		this.country = country;
		this.pin = pin;
		this.addressType = addressType;
	}





	public AddressEntity(long id, String line1, String line2, String street, String village, String city, String state,
			String country, String pin, Integer addressType, EmployeeEntity employee) {
		super();
		this.id = id;
		this.line1 = line1;
		this.line2 = line2;
		this.street = street;
		this.village = village;
		this.city = city;
		this.state = state;
		this.country = country;
		this.pin = pin;
		this.addressType = addressType;
		this.employee = employee;
	}

	public AddressEntity(String state) {
		super();
		this.state = state;
	}

	public String getLine1() {
		return line1;
	}

	public void setLine1(String line1) {
		this.line1 = line1;
	}

	public String getLine2() {
		return line2;
	}

	public void setLine2(String line2) {
		this.line2 = line2;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getVillage() {
		return village;
	}

	public void setVillage(String village) {
		this.village = village;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public Integer getAddressType() {
		return addressType;
	}

	public void setAddressType(Integer addressType) {
		this.addressType = addressType;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	public String getAddressTypeValue() {
		return  AddressType.getAddressTypeName(addressType);
	}

	@Override
	public String toString() {
		return "Address [" + "  " + line1 + " " + line2 + ", street=" + street + ", village=" + village + ", city="
				+ city + ", state=" + state + ", country=" + country + ", pin=" + pin + ", addressType="
				+ AddressType.getAddressTypeName(addressType) + "]";
	}

}
