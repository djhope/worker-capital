package com.workercapital.web;
import com.workercapital.domain.Survey;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;

/**
 * = SurveysCollectionThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Survey.class, type = ControllerType.COLLECTION)
@RooThymeleaf
public class SurveysCollectionThymeleafController {
}
