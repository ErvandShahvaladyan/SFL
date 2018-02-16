package org.sfl.controller;

import org.sfl.model.User;
import org.sfl.repository.UserRepository;
import org.sfl.service.SecurityService;
import org.sfl.service.UserService;
import org.sfl.validator.UserValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    private static Logger logger = LoggerFactory.getLogger(MainController.class);

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.addValidators(userValidator);
    }

    @RequestMapping(value = {"/", "/login"}, method = RequestMethod.GET)
    public String login() {
        logger.info("Returning login page");

        return "login";
    }

    /**
     * This method will list all existing users
     */
    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String welcome(Model model) {
        logger.info("Returning welcome page");

        List<User> users = userService.findAll();
        model.addAttribute("users", users);

        return "welcome";
    }

    @RequestMapping(value = {"/register", "/addNewUser"}, method = RequestMethod.GET)
    public String register(Model model) {
        logger.info("Returning register page");
        model.addAttribute("userForm", new User());

        return "register";
    }

    /**
     * This method will be called on form submission, handling POST request for
     * saving user in database. It also validates the user input
     */
    @RequestMapping(value = "/registerSuccess", method = RequestMethod.POST)
    public String register(@ModelAttribute("userForm") @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            logger.info("Returning register page");

            return "register";
        }
        logger.info("Returning redirect welcome page");
        userService.save(user);
        securityService.autoLogin(user.getFirstname(), user.getPassword());

        return "redirect:/welcome";
    }

    /**
     * This method will provide the medium to update an existing user.
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") long id, Model model) {
        logger.info("Returning edit page");
        User user = userService.findById(id);
        model.addAttribute("userForm", user);

        return "edit";
    }

    /**
     * This method will be called on form submission, handling POST request for
     * updating user in database. It also validates the user input
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String edit(@ModelAttribute("userForm") @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            logger.info("Returning edit page");

            return "edit";
        }
        logger.info("Returning redirect welcome page");
        userService.update(user);

        return "redirect:/welcome";
    }

    /**
     * This method will delete an user by it's id value.
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") long id) {
        logger.info("deleting process");
        userService.delete(id);

        return "redirect:/welcome";
    }

    /**
     * This method handles logout requests.
     * Toggle the handlers if you are RememberMe functionality is useless in your app.
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletResponse response, HttpServletRequest request) {
        logger.info("Logout procss");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }

        return "redirect/login?logout";
    }

}
