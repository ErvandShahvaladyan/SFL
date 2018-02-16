package org.sfl.validator;

import org.sfl.model.User;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

@Component
public class UserValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object entity, Errors errors) {
        User user = (User) entity;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstname", "user.name.empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastname", "user.surname.empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "user.email.empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "user.password.empty");

        Pattern emailPatern = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

        if (!(emailPatern.matcher(user.getEmail()).matches())) {
            errors.rejectValue("email", "user.email.invalid");
        }

        if (user.getFirstname().length() < 6 || user.getFirstname().length() > 30) {
            errors.rejectValue("firstname", "size.name");
        }

        if (user.getLastname().length() < 6 || user.getLastname().length() > 30) {
            errors.rejectValue("lastname", "size.surname");
        }

        if (user.getPassword().length() < 8 || user.getPassword().length() > 30) {
            errors.rejectValue("password", "size.password");
        }
    }
}
