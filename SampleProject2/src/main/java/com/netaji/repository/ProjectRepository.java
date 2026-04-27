package com.netaji.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.netaji.entity.ProjectEntity;
@Repository
public interface ProjectRepository extends JpaRepository<ProjectEntity, Serializable> {
	
	/*
	 * @Modifying
	 * 
	 * @Query(
	 * value="update projects p set p.title=:title  where p.project_id=:project_id "
	 * ,nativeQuery=true) void update(@Param("project_id") long project_id
	 * ,@Param("title") String title);
	 */
	 

}
