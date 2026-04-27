package com.netaji.repository.controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.netaji.entity.User;
import com.netaji.repository.UserRepository1;
import com.netaji.repository.service.MyUserDetailsService1;
import com.netaji.repository.service.UserPrincipal;

@Controller
public class SecurityController {

	@Autowired
	private MyUserDetailsService1 userdetailService;

	@Autowired
	private UserRepository1 imageRepository;
	
	
	@Autowired
	private EntityManager entityManager;

	@GetMapping("/register")
	public String view() {
//	   m.addAttribute("msg", "Hello");
		return "register";
	}

	@PostMapping("/saveImage1")
	public String saveImage(@ModelAttribute User user, @RequestParam("file") MultipartFile file) throws IOException {
		user.setName(file.getOriginalFilename());
		user.setData(file.getBytes());
		imageRepository.save(user);
		return "redirect:/";
	}

	@GetMapping("/image/{id}")
	public ResponseEntity<byte[]> getImage(@PathVariable Long id, HttpServletResponse response, Model model)
			throws IOException {
		User user = imageRepository.findById(id).orElse(null);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		headers.setContentLength(user.getData().length);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(user.getData(), headers, HttpStatus.OK);

		System.out.println("Return Data:" + responseEntity);

		model.addAttribute("images", responseEntity);

		/*
		 * if (image != null) { // response.setContentType(image.getContentType());
		 * InputStream is = new ByteArrayInputStream(image.getData()); IOUtils.copy(is,
		 * response.getOutputStream()); }
		 */

		return responseEntity;
	}

	/*
	 * @PostMapping("/signUp") public String newProject( @ModelAttribute User
	 * user,@RequestParam("fileImage") MultipartFile multipartFile, Model model)
	 * throws IOException {
	 * 
	 * System.out.println("*************"+user.getPhotos());
	 * 
	 * 
	 * 
	 * String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
	 * user.setFileName(fileName);
	 * 
	 * User saveData = userdetailService.register(user);
	 * 
	 * String uploadDir = "./File-name"+saveData.getId();
	 * 
	 * 
	 * 
	 * FileOutputStream fos = new FileOutputStream(uploadDir);
	 * 
	 * 
	 * 
	 * 
	 * 
	 * Path uploadPath =Paths.get(uploadDir);
	 * 
	 * if(!Files.exists(uploadPath)) { Files.createDirectories(uploadPath); }
	 * 
	 * 
	 * try (InputStream inputStream=multipartFile.getInputStream()){ Path filePath =
	 * uploadPath.resolve(fileName);
	 * Files.copy(inputStream,filePath,StandardCopyOption.REPLACE_EXISTING);
	 * }catch(IOException e) { throw new
	 * IOException("Could not save uploaded file "+fileName ); }
	 * 
	 * 
	 * 
	 * 
	 * return "redirect:/login?message"; }
	 */

	@GetMapping("/dis")
	public String getData(@AuthenticationPrincipal UserPrincipal userDetails, Model model) {

		String username = userDetails.getUsername();
		User data = userdetailService.getByUserName(username);

		model.addAttribute("userName", data.getUsername().toUpperCase());
		// System.out.println(data.getData());

		model.addAttribute("data", data);

		return "user";

	}

	/*
	 * @GetMapping("/image1/{id}") public ResponseEntity<byte[]>
	 * getImage(@PathVariable Long id) throws IOException {
	 * 
	 * 
	 * User user= userdetailService.getById(id);
	 * 
	 * // Image image = imageRepository.findById(id).orElse(null); HttpHeaders
	 * headers = new HttpHeaders(); headers.setContentType(MediaType.IMAGE_JPEG);
	 * 
	 * headers.setContentLength(user.getPhotos().length); //
	 * headers.setContentLength(image.getData().length);
	 * 
	 * ResponseEntity<byte[]> responseEntity = new
	 * ResponseEntity<>(user.getPhotos(), headers, HttpStatus.OK);
	 * 
	 * // ResponseEntity<byte[]> responseEntity = new
	 * ResponseEntity<>(image.getData(), headers, HttpStatus.OK);
	 * 
	 * System.out.println("Return Data:"+responseEntity);
	 * 
	 * 
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
	 */

	@PostMapping("/userDetails")
	public String userDetails(@ModelAttribute User user, @RequestParam("file") MultipartFile file, Model model)
			throws IOException {
		
		if(!file.isEmpty()) {
			System.out.println("File Name****************************"+file.getBytes());

		user.setName(file.getOriginalFilename());
		user.setData(file.getBytes());

		imageRepository.save(user);
		}
		
		userdetailService.update(user);

		return "redirect:/login";
	}

	

	/*
	 * @PostMapping("/users/save") public RedirectView saveUser(User user,
	 * 
	 * @RequestParam("image") MultipartFile multipartFile) throws IOException {
	 * 
	 * String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
	 * user.setPhotos(fileName);
	 * 
	 * User savedUser = repo.save(user);
	 * 
	 * String uploadDir = "user-photos/" + savedUser.getId();
	 * 
	 * FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
	 * 
	 * return new RedirectView("/users", true); }
	 */

}
