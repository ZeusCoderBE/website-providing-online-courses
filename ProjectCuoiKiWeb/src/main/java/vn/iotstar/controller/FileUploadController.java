package vn.iotstar.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.MultipartConfig;

@Controller
public class FileUploadController {
	@Autowired
	ServletContext context;
	@RequestMapping(value = "/xinchao", method = RequestMethod.POST)
	public String handleFileUpload(MultipartHttpServletRequest request) {
		MultipartFile multipartFile = request.getFile("user-file");
		if (multipartFile != null) {
			String originalFileName = multipartFile.getOriginalFilename();

			try {
				// Set the directory path where you want to save the file
				String uploadDir =context.getRealPath("/"+originalFileName);
				// Transfer the file to the specified directory
				File dest = new File(uploadDir);
				multipartFile.transferTo(dest);
				System.out.println("File saved to: " + uploadDir);
				// File has been successfully saved

				// You can return a success message or redirect to another page
				return "File uploaded successfully!";
			} catch (IOException e) {
				e.printStackTrace();
				// Handle the exception, return an error message, or redirect to an error page
				return "Error uploading the file.";
			}
		} else {
			// No file was provided in the request
			return "No file provided in the request.";
		}
	}
}
