package com.netaji.repository.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.netaji.entity.EmployeeEntity;
import com.netaji.entity.ProjectEntity;
import com.netaji.repository.service.AddressService;
import com.netaji.repository.service.EmployeeService;
import com.netaji.repository.service.ProjectService;
@Controller
public class ProjectController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private ProjectService projectService;
	
	
	@GetMapping("/projects-info")
	public String accoutsInfo(@RequestParam(defaultValue = "1") int val, Model model, ProjectEntity project) {

		List<Long> pageObj = employeeService.noOfRecords();
		long totalPages = pageObj.get(pageObj.size()-1);
		
		model.addAttribute("firstPage",pageObj.get(0));
		model.addAttribute("lastPage",totalPages);

		if(val>totalPages) {
			val=(int) totalPages;
		}
		
		List<EmployeeEntity> details = employeeService.getDetails(val);
		
		model.addAttribute("emp", details);
		
		
		
		
		model.addAttribute("actionName", "projectsView");
		List<ProjectEntity> projects = projectService.getAllProjects();
		model.addAttribute("projects", projects);
		
		
		
		

		List<Long> pagesObject = employeeService.trailInServ(val);

		model.addAttribute("count1", pagesObject); // This is for total pages printing	
		model.addAttribute("nextPage", pagesObject.get(pagesObject.size()-1));
		model.addAttribute("previousPage", pagesObject.get(0));
		
		
		if(val==0) {
			val=1; // This is for page 
			model.addAttribute("page", val);
		}
		else
			model.addAttribute("page", val); // particular page indication by color
		
		return "project_view";
	}

	@GetMapping("/newproject")
	public String createProjectview(@RequestParam("action") String actionName, Model model, ProjectEntity project,
			EmployeeEntity Emp) {
		model.addAttribute("actionName", actionName);
		List<ProjectEntity> projects = projectService.getAllProjects();
		model.addAttribute("projects", projects);
		return "project_view";
	}

	// create Project
	@PostMapping("/createProject")
	public String newProject(@RequestParam("action") String actionName, @ModelAttribute ProjectEntity project, Model model) {
		projectService.createProject(project);
		model.addAttribute("actionName", actionName);
		List<ProjectEntity> projects = projectService.getAllProjects();
		model.addAttribute("projects", projects);
		return "redirect:/projects-info";
	}

	@GetMapping("/editProject")
	public String editProject(@RequestParam("action") String actionName, @RequestParam("projectId") long projectId,
			ProjectEntity project, Model model) {
		ProjectEntity projectObj = projectService.getProjectById(projectId);
		model.addAttribute("project", projectObj);
		model.addAttribute("actionName", actionName);
		return "project_view";
	}

	@PostMapping("/updateProject")
	public String updateProject(@RequestParam("action") String actionName, @ModelAttribute ProjectEntity project,Model model) {
		model.addAttribute("actionName", actionName);
		
		System.out.println("Projrct Id  "+project.getProjectId());
		
		
		projectService.update(project);
		
		
		
		
		return "redirect:/projects-info";
	}
	
	
	@PostMapping("/assignProject")
	public String assignProject(@RequestParam(defaultValue = "1") int val,@RequestParam("") long empId,@RequestParam("") long projectId,Model model) {
		
		EmployeeEntity assignProject = projectService.assignProject(empId, projectId);
		
List<EmployeeEntity> details = employeeService.getDetails(val);
		
		model.addAttribute("emp", details);
		
		
		
		
		model.addAttribute("actionName", "projectsView");
		List<ProjectEntity> projects = projectService.getAllProjects();
		model.addAttribute("projects", projects);
		
		
		
		return "project_view";
		
	}
	
	
	
	
	
	@GetMapping("/projectdelete/{projectId}") // Extra method to Delete by popup
	public String deleteForAddress(@PathVariable(value = "projectId") long projectId, Model modal) {
		
		
		
		
		projectService.deleteDetails(projectId);
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

		return "project_view";
	}
	
	
	

}
	


