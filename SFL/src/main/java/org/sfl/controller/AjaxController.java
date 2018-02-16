package org.sfl.controller;

import org.sfl.response.AjaxResponse;
import org.sfl.validator.AjaxValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AjaxController {

    @Autowired
    private AjaxValidator ajaxValidator;

    private AjaxResponse ajaxResponse = new AjaxResponse();

    @RequestMapping(value = "/checkFirstname", method = RequestMethod.POST)
    public @ResponseBody
    AjaxResponse checkFirstName(@RequestParam("firstname") String firstname) {
        if (ajaxValidator.validFirstname(firstname)) {
            ajaxResponse.setStatus("SUCCESS");
        } else {
            ajaxResponse.setStatus("FAIL");
        }

        return ajaxResponse;
    }

    @RequestMapping(value = "/checkLastname", method = RequestMethod.POST)
    public @ResponseBody
    AjaxResponse checkLastname(@RequestParam("lastname") String lastname) {
        if (ajaxValidator.validLastname(lastname)) {
            ajaxResponse.setStatus("SUCCESS");
        } else {
            ajaxResponse.setStatus("FAIL");
        }

        return ajaxResponse;
    }

    @RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
    public @ResponseBody
    AjaxResponse checkEmail(@RequestParam("email") String email) {
        if (ajaxValidator.validEmail(email)) {
            ajaxResponse.setStatus("SUCCESS");
        } else {
            ajaxResponse.setStatus("FAIL");
        }

        return ajaxResponse;
    }

    @RequestMapping(value = "/checkPassword", method = RequestMethod.POST)
    public @ResponseBody
    AjaxResponse checkPassword(@RequestParam("password") String password) {
        if (ajaxValidator.validPassword(password)) {
            ajaxResponse.setStatus("SUCCESS");
        } else {
            ajaxResponse.setStatus("FAIL");
        }

        return ajaxResponse;
    }
}
