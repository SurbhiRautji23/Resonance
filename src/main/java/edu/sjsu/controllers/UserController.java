package edu.sjsu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import edu.sjsu.helpers.BadRequestException;
import edu.sjsu.helpers.EmailNotification;
import edu.sjsu.helpers.Utility;
import edu.sjsu.models.User;
import edu.sjsu.services.UserService;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@RestController
@ComponentScan
@Component("UserController")
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	 @Autowired
	EmailNotification emailNotification;

	@RequestMapping(value = "/signup", method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<User> createUser(@Valid @RequestBody User user, BindingResult result, HttpServletResponse response) {

		User userob = null;
		
	    //this call validated that email is not already in use
        userService.isEmailAvailable(user.getEmail());

        String tokenString = Utility.verificationTokenGenerator(user.getEmail());
        String encryptPass = Utility.passwordEncrypter(user.getPassword());
        
		try {
			userob = new User(user.getName(), user.getEmail(), encryptPass, user.getCountry(), user.getState(), tokenString, false);

		} catch (Exception e) {

			System.out.println("Exception");

		}

		userService.create(userob);
		emailNotification.sendEmailonSignUp(user.getEmail(), user.getName(),tokenString);
		userob.setPassword(null);
        userob.setToken(null);
		return new ResponseEntity<User>(userob, HttpStatus.CREATED);
	}
	
    @RequestMapping(value = "/verify/{email}/{token}", method = RequestMethod.GET, produces = "application/json")
    public String verifyUser(@PathVariable(value = "email") String  email, @PathVariable(value = "token") String  token) {


        User user = userService.getUserByEmail(email);
        System.out.println("Email: "+email);
        System.out.println("Email: "+user.getEmail());
        if(user.getToken().equals(token))
        {
            user.setVerified(true);
            userService.create(user);
            user.setPassword(null);
            user.setToken(null);
            return "Email Account verified";
        }
        else{
            throw new BadRequestException("Incorrect user");
        }
    }
   
    
    @RequestMapping(value = "/login", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public ResponseEntity<User> validateUser(@Valid @RequestBody User tmpUser, BindingResult result, HttpServletResponse response) {

    	System.out.println("Email : "+tmpUser.getEmail());
        User user = userService.getUserByEmail(tmpUser.getEmail());
        String savedPass = user.getPassword();
        String enteredPass = Utility.passwordEncrypter(tmpUser.getPassword());

        if(!user.isVerified()){
            throw new BadRequestException("Please verify your email address");
        }

        //compare given password with the actual password
        if (savedPass != null) {
            if (savedPass.equals(enteredPass)) {
             
                user.setPassword(null);
                return new ResponseEntity<User>(user, HttpStatus.OK);
            } else {
                throw new BadRequestException("Incorrect Password");
            }
        } else {
            throw new BadRequestException("User not found.");
        }
    }
}
