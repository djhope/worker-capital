package com.workercapital.web;
import com.workercapital.domain.Survey;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.controller.annotations.responses.json.RooJSON;

/**
 * = SurveysCollectionJsonController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Survey.class, pathPrefix = "/api", type = ControllerType.COLLECTION)
@RooJSON
public class SurveysCollectionJsonController {
}
