package org.sfl.validator;

import org.sfl.model.FileBucket;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UploadValidator implements Validator {


    @Override
    public boolean supports(Class<?> aClass) {
        return FileBucket.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object entity, Errors errors) {
        FileBucket fileBucket = (FileBucket) entity;

        if (fileBucket.getFile() != null) {
            if (fileBucket.getFile().getSize() == 0) {
                errors.rejectValue("file", "missing.file");
            }
        }
    }
}
