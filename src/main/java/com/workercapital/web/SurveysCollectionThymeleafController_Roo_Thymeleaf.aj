// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.workercapital.web;

import com.workercapital.domain.Survey;
import com.workercapital.service.api.SurveyService;
import com.workercapital.web.SurveysCollectionThymeleafController;
import com.workercapital.web.SurveysItemThymeleafController;
import io.springlets.data.domain.GlobalSearch;
import io.springlets.data.web.datatables.Datatables;
import io.springlets.data.web.datatables.DatatablesData;
import io.springlets.data.web.datatables.DatatablesPageable;
import io.springlets.data.web.select2.Select2Data;
import java.util.Locale;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.util.UriComponents;

privileged aspect SurveysCollectionThymeleafController_Roo_Thymeleaf {
    
    declare @type: SurveysCollectionThymeleafController: @Controller;
    
    declare @type: SurveysCollectionThymeleafController: @RequestMapping(value = "/surveys", name = "SurveysCollectionThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     */
    public MessageSource SurveysCollectionThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param surveyService
     * @param messageSource
     */
    @Autowired
    public SurveysCollectionThymeleafController.new(SurveyService surveyService, MessageSource messageSource) {
        this.surveyService = surveyService;
        this.messageSource = messageSource;
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "list")
    @ResponseBody
    public ModelAndView SurveysCollectionThymeleafController.list(Model model) {
        return new ModelAndView("/surveys/list");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return UriComponents
     */
    public static UriComponents SurveysCollectionThymeleafController.listURI() {
        return MvcUriComponentsBuilder.fromMethodCall(
                MvcUriComponentsBuilder.on(SurveysCollectionThymeleafController.class).list(null))
                .build().encode();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param search
     * @param pageable
     * @param draw
     * @return ResponseEntity
     */
    @GetMapping(produces = Datatables.MEDIA_TYPE, name = "datatables", value = "/dt")
    @ResponseBody
    public ResponseEntity<DatatablesData<Survey>> SurveysCollectionThymeleafController.datatables(GlobalSearch search, DatatablesPageable pageable, @RequestParam("draw") Integer draw) {
        Page<Survey> surveys = surveyService.findAll(search, pageable);
        long totalSurveysCount = surveys.getTotalElements();
        if (search != null && StringUtils.hasText(search.getText())) {
            totalSurveysCount = surveyService.count();
        }
        DatatablesData<Survey> datatablesData = new DatatablesData<Survey>(surveys, totalSurveysCount, draw);
        return  ResponseEntity.ok(datatablesData);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param search
     * @param pageable
     * @param locale
     * @return ResponseEntity
     */
    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE, name = "select2", value = "/s2")
    @ResponseBody
    public ResponseEntity<Select2Data<Survey>> SurveysCollectionThymeleafController.select2(GlobalSearch search, Pageable pageable, Locale locale) {
        Page<Survey> Surveys = surveyService.findAll(search, pageable);
        String idExpression = "#{id}";
        String textExpression = messageSource.getMessage("expression_survey", null, "#{toString()}", locale);
        Select2Data<Survey> select2Data = new Select2Data<Survey>(Surveys, idExpression, textExpression);
        return  ResponseEntity.ok(select2Data);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param dataBinder
     */
    @InitBinder("survey")
    public void SurveysCollectionThymeleafController.initSurveyBinder(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void SurveysCollectionThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void SurveysCollectionThymeleafController.populateForm(Model model) {
        populateFormats(model);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param survey
     * @param result
     * @param model
     * @return ModelAndView
     */
    @PostMapping(name = "create")
    public ModelAndView SurveysCollectionThymeleafController.create(@Valid @ModelAttribute Survey survey, BindingResult result, Model model) {
        if (result.hasErrors()) {
            populateForm(model);
            
            return new ModelAndView("/surveys/create");
        }
        Survey newSurvey = surveyService.save(survey);
        UriComponents showURI = SurveysItemThymeleafController.showURI(newSurvey);
        return new ModelAndView("redirect:" + showURI.toUriString());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/create-form", name = "createForm")
    public ModelAndView SurveysCollectionThymeleafController.createForm(Model model) {
        populateForm(model);
        
        model.addAttribute(new Survey());
        return new ModelAndView("surveys/create");
    }
    
}
