package org.sfl.controller;

import org.sfl.model.Catalog;
import org.sfl.model.FileBucket;
import org.sfl.model.User;
import org.sfl.service.CatalogService;
import org.sfl.service.UserService;
import org.sfl.validator.UploadValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
public class UploadController {

    @Autowired
    private CatalogService catalogService;

    @Autowired
    private UserService userService;

    @Autowired
    private UploadValidator uploadValidator;

    private static Logger logger = LoggerFactory.getLogger(UploadValidator.class);

    @InitBinder("fileBucket")
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(uploadValidator);
    }

    @RequestMapping(value = "/addDocument/{id}", method = RequestMethod.GET)
    public String addDocument(@PathVariable("id") long id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        model.addAttribute("fileBucket", new FileBucket());

        List<Catalog> catalogs = catalogService.findAllByUserId(id);
        model.addAttribute("catalogs", catalogs);
        logger.info("Returning manage documents page");

        return "manageDocuments";
    }

    @RequestMapping(value = "/addDocument/{id}", method = RequestMethod.POST)
    public String addDocument(@ModelAttribute("fileBucket") @Valid FileBucket fileBucket,
                              BindingResult result, @PathVariable("id") long id, Model model) throws IOException {
        if (result.hasErrors()) {
            User user = userService.findById(id);
            model.addAttribute("user", user);

            List<Catalog> catalogs = catalogService.findAllByUserId(id);
            model.addAttribute("catalogs", catalogs);
            logger.info("Returning manage documents page");

            return "manageDocuments";
        }
        User user = userService.findById(id);
        model.addAttribute("user", user);
        saveCatalog(fileBucket, user);
        logger.info("Returning redirect addDocument");

        return "redirect:/addDocument/" + id;
    }

    @RequestMapping(value = "/download/{userId}/{catalogId}", method = RequestMethod.GET)
    public String download(@PathVariable long userId,
                           @PathVariable long catalogId,
                           HttpServletResponse response) throws IOException {

        Catalog catalog = catalogService.findById(catalogId);

        response.setContentType(catalog.getType());
        response.setContentLength(catalog.getContent().length);
        response.setHeader("Content-Disposition", "attachment;" +
                " filename=\"" + catalog.getLink() + "\"");

        FileCopyUtils.copy(catalog.getContent(), response.getOutputStream());
        logger.info("Downloading process");

        return "redirect:/addDocument/" + userId;
    }

    @RequestMapping(value = "/delete/{userId}/{catalogId}", method = RequestMethod.GET)
    public String delete(@PathVariable long userId, @PathVariable long catalogId) {
        catalogService.delete(catalogId);
        logger.info("deleting process");

        return "redirect:/addDocument/" + userId;
    }

    private void saveCatalog(FileBucket fileBucket, User user) throws IOException {
        Catalog catalog = new Catalog();
        MultipartFile multipartFile = fileBucket.getFile();

        catalog.setLink(multipartFile.getOriginalFilename());
        catalog.setComment(fileBucket.getDescription());
        catalog.setType(multipartFile.getContentType());
        catalog.setContent(multipartFile.getBytes());
        catalog.setInsertDate(new Date());
        catalog.setUser(user);
        logger.info("Save catalog");

        catalogService.save(catalog);
    }
}
