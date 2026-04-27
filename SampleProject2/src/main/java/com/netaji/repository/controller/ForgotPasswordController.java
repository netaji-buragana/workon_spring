package com.netaji.repository.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.netaji.entity.EmployeeEntity;
import com.netaji.entity.User;
import com.netaji.repo.UserRepository;
import com.netaji.repository.UserRepository1;
import com.netaji.repository.service.EmailService;
import com.netaji.repository.service.MyUserDetailsService1;
import com.netaji.repository.service.UserPrincipal;


@Controller
public class ForgotPasswordController {

	Random random = new Random(1000);

	@Autowired
	private EmailService emailService;
	
	@Autowired
	private MyUserDetailsService1 myuserDetailservice1;
	
	@GetMapping("/forgotpassword")
	public String forgetPasswordFrom() {
		System.out.println("********ForgetPassword");
		return "forgot_password";
	}

	@PostMapping("/sendOtp")
	public String sendOtp(@RequestParam("email") String email, HttpSession session) {
		System.out.println("Email:- " + email);

		int otp = random.nextInt(999999);
		System.out.println("OTP:- " + otp);

		String subject = "Email from EmployeeManagement";

		String message = "Your Otp is <h2>" + otp + "<h2>";

		String to = email;

		boolean flag = this.emailService.sendEmail(subject, message, to);

		if (flag) // if otp send success to email enter verify form
		{
			session.setAttribute("myotp", otp);
			session.setAttribute("email", email);

			return "verify_otp";

		} else {
			return "forgot_password";
		}
	}

	@PostMapping("/verifyOtp")
	public String verifyOtp(@AuthenticationPrincipal UserPrincipal userDetails,@RequestParam("otp") int otp, HttpSession session) {
		int myotp = (int) session.getAttribute("myotp");
		
		System.out.println(otp+","+myotp);
		String email =  (String) session.getAttribute("email");
		
		System.out.println("Mail"+email);

		if (myotp == otp) {
			User user =myuserDetailservice1.getUserByEmail(email);
			System.out.println("User"+user);
			
			if (user == null) 
			{
			
				System.out.println("******User Does not Exist*****");

				return "forgot_password";

			} else
			{
				System.out.println("*******Change here Old Password*****");
				return "change_password";
			}
			
		} else {
			session.setAttribute("message", "InValid Otp");
			return "verfiy_otp";
		}
	}
	
	
	
	
	
	@PostMapping("/changePassword")
	public String search(@RequestParam(defaultValue = "0") String changedPassword,Model modal,HttpSession session) {
		
		System.out.println(changedPassword);
		String email = (String) session.getAttribute("email");
		 User user = myuserDetailservice1.getUserByEmail(email);
		System.out.println("UserName:-  " + user.getUsername());
		 user.setPassword(changedPassword);
		myuserDetailservice1.register(user);
		 System.out.println("******Password Changed Successfully*******");
		 return "redirect:/login?changedPassword";
		
	}
	
	


}