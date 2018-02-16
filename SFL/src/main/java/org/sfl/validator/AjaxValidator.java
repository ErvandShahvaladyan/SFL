package org.sfl.validator;

import org.springframework.stereotype.Component;

@Component
public class AjaxValidator {

    public boolean validFirstname(String firstname) {
        return firstname.length() >= 6 && firstname.length() <= 30;
    }

    public boolean validLastname(String lastname) {
        return lastname.length() >= 6 && lastname.length() <= 30;
    }

    public boolean validEmail(String email) {
        return email.contains("@") && email.contains(".");
    }

    public boolean validPassword(String password) {
        return password.length() >= 8 && password.length() <= 20;
    }
}
