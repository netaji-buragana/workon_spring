package com.netaji.repository.service;

import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.netaji.entity.EmployeeEntity;
import com.netaji.entity.ProjectEntity;
import com.netaji.repository.EmployeeRepository;
import com.netaji.repository.ProjectRepository;
@Service
public class ProjectService {
	@Autowired
	private ProjectRepository projectRepo;
	
	
	@Autowired
	private EmployeeRepository empRepo;
	
	@Autowired
	private EntityManager entityManager;
	

	public List<ProjectEntity> getAllProjects() {
		return projectRepo.findAll();
	}

	public ProjectEntity createProject(ProjectEntity project) {
		return projectRepo.save(project);
	}

	public ProjectEntity getProjectById(long projectId) {
		return projectRepo.findById(projectId).get();
	}
	
	
	
	public EmployeeEntity assignProject(long empId, long projectId) {
		EmployeeEntity employee = empRepo.findById(empId).get();
		 ProjectEntity project = projectRepo.findById(projectId).get();
		
		 
		Set<ProjectEntity> projects = employee.getProjects();
		projects.add(project);
		
	    Set<EmployeeEntity> employee2 = project.getEmployee();
	    employee2.add(employee);
	     
	        
	     empRepo.save(employee);
		 projectRepo.save(project);
		 return employee;
		 }
	
	
	
	public void deleteDetails(long id) {
		projectRepo.deleteById(id);
	}

	@Transactional
	public void update(ProjectEntity project) {
		
		
	//	projectRepo.update(project.getProjectId(),project.getTitle() );
		
		
		
		
		 CriteriaBuilder criteriaBulider = entityManager.getCriteriaBuilder();
		 CriteriaUpdate<ProjectEntity> update = criteriaBulider.createCriteriaUpdate(ProjectEntity.class);
		 Root e = update.from(ProjectEntity.class);
		 update.set("title", project.getTitle());
		 update.where(criteriaBulider.equal(e.get("projectId"), project.getProjectId()));
		 entityManager.createQuery(update).executeUpdate();
		 
		 
		 
		/*
		 * String query ="update ProjectEntity p  set p.title="+project.getTitle()
		 * +"  where p.projectId="+project.getProjectId();
		 * 
		 * System.out.println("Query is++++++++++++++++++++++:"+query);
		 * 
		 * Query createQuery = entityManager.createQuery(query);
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 * @SuppressWarnings("unchecked") TypedQuery<Object[]> createNativeQuery =
		 * (TypedQuery<Object[]>) entityManager.createQuery(query);
		 */
					
					
					
					
				
					
					
		 
		 
		 
		
			
		 
	}
	
	
	
	
}
