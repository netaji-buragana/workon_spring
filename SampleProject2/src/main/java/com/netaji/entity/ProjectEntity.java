package com.netaji.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity

@Table(name = "projects")
public class ProjectEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(name = "project_Id")
	private long projectId;

	@Column(name = "title")
	private String title;

	/*
	 * @ManyToMany(mappedBy = "projects", cascade = CascadeType.ALL, fetch =
	 * FetchType.LAZY)
	 */
	
	 
	  @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
		@JoinTable(name = "Employee_projects1" , 
		joinColumns = { @JoinColumn(name = "project_Id", nullable = false), },
		inverseJoinColumns = { @JoinColumn(name = "emp_id") }
				)
	private Set<EmployeeEntity> employee;

	public ProjectEntity() {

	}

	public long getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Set<EmployeeEntity> getEmployee() {
		return employee;
	}

	public void setEmployee(Set<EmployeeEntity> employee) {
		this.employee = employee;
	}

	

}
