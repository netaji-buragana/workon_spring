/*
 * package com.netaji.repository.controller;
 * 
 * import java.io.IOException;
 * 
 * import javax.servlet.http.HttpServletResponse;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.PathVariable; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.bind.annotation.RestController; import
 * org.springframework.web.multipart.MultipartFile;
 * 
 * import com.netaji.entity.ImageTable; import
 * com.netaji.repository.ImageTableRepository;
 * 
 * @RestController
 * 
 * @RequestMapping("/api/images") public class ImageController {
 * 
 * @Autowired private ImageTableRepository imageTableRepository;
 * 
 * @PostMapping("/upload") public String uploadImage(@RequestParam("imageFile")
 * MultipartFile file) throws IOException {
 * 
 * // convert the file to a byte[] byte[] bytes = file.getBytes();
 * 
 * // create the ImageTable object ImageTable imageTable = new ImageTable();
 * imageTable.setImage(bytes);
 * 
 * // save the object to the database imageTableRepository.save(imageTable);
 * return "redirect:/upload"; }
 * 
 * //Step 4: Retrieving Image
 * 
 * @GetMapping("/retrieve/{imageId}") public byte[] getImage(@PathVariable Long
 * imageId, HttpServletResponse response) throws IOException {
 * 
 * // get the image object from the database ImageTable retrievedImage =
 * imageTableRepository.findById(imageId).get();
 * 
 * // convert the image object to a byte[] byte[] bytes =
 * retrievedImage.getImage();
 * 
 * // response.getOutputStream().write(bytes);
 * 
 * return bytes; }
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * }
 */