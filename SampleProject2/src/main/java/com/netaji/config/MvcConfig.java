package com.netaji.config;

import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class MvcConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		Path fileUploadDir = Paths.get("./File-name");
		String fileUploadPath = fileUploadDir.toFile().getAbsolutePath();
		
		registry.addResourceHandler("/file-name/**").addResourceLocations("file:/"+fileUploadPath+"/");
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("view");
		registry.addViewController("/login").setViewName("login");
	}
	
	
	

}
