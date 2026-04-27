package com.netaji.repository.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.netaji.entity.Image;
import com.netaji.repository.ImageRepository;

@Controller
public class ImageController1 {
	@Autowired
	private ImageRepository imageRepository;

	@GetMapping("/uploadImage")
	public String uploadImage(Model model) {
		// model.addAttribute("image", new Image());
		return "uploadImage";
	}
	/*
	 * @PostMapping("/saveImage") public String saveImage(@ModelAttribute Image
	 * image, @RequestParam("file") MultipartFile file) throws IOException {
	 * image.setName(file.getOriginalFilename()); image.setData(file.getBytes());
	 * imageRepository.save(image); return "redirect:/"; }
	 * 
	 * @GetMapping("/image/{id}") public ResponseEntity<byte[]>
	 * getImage(@PathVariable Long id, HttpServletResponse response,Model model)
	 * throws IOException { Image image = imageRepository.findById(id).orElse(null);
	 * HttpHeaders headers = new HttpHeaders();
	 * headers.setContentType(MediaType.IMAGE_JPEG);
	 * headers.setContentLength(image.getData().length); ResponseEntity<byte[]>
	 * responseEntity = new ResponseEntity<>(image.getData(), headers,
	 * HttpStatus.OK);
	 * 
	 * System.out.println("Return Data:"+responseEntity);
	 * 
	 * 
	 * model.addAttribute("images",responseEntity);
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * if (image != null) { // response.setContentType(image.getContentType());
	 * InputStream is = new ByteArrayInputStream(image.getData()); IOUtils.copy(is,
	 * response.getOutputStream()); }
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * return responseEntity; }
	 * 
	 * 
	 */

}