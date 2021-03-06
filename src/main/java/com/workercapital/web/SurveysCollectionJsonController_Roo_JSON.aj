// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.workercapital.web;

import com.workercapital.domain.Survey;
import com.workercapital.service.api.SurveyService;
import com.workercapital.web.SurveysCollectionJsonController;
import com.workercapital.web.SurveysItemJsonController;
import io.springlets.data.domain.GlobalSearch;
import java.util.Collection;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.util.UriComponents;

privileged aspect SurveysCollectionJsonController_Roo_JSON {
    
    declare @type: SurveysCollectionJsonController: @RestController;
    
    declare @type: SurveysCollectionJsonController: @RequestMapping(value = "/api/surveys", name = "SurveysCollectionJsonController", produces = MediaType.APPLICATION_JSON_VALUE);
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param surveyService
     */
    @Autowired
    public SurveysCollectionJsonController.new(SurveyService surveyService) {
        this.surveyService = surveyService;
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return ResponseEntity
     */
    @GetMapping(name = "list")
    public ResponseEntity<Page<Survey>> SurveysCollectionJsonController.list(GlobalSearch globalSearch, Pageable pageable) {
        
        Page<Survey> surveys = surveyService.findAll(globalSearch, pageable);
        return ResponseEntity.status(HttpStatus.FOUND).body(surveys);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return UriComponents
     */
    public static UriComponents SurveysCollectionJsonController.listURI() {
        return MvcUriComponentsBuilder
            .fromMethodCall(
                MvcUriComponentsBuilder.on(SurveysCollectionJsonController.class).list(null, null))
            .build().encode();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param survey
     * @param result
     * @return ResponseEntity
     */
    @PostMapping(name = "create")
    public ResponseEntity<?> SurveysCollectionJsonController.create(@Valid @RequestBody Survey survey, BindingResult result) {
        
        if (survey.getId() != null || survey.getVersion() != null) {        
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
        
        if (result.hasErrors()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(result);
        }
        
        Survey newSurvey = surveyService.save(survey);
        UriComponents showURI = SurveysItemJsonController.showURI(newSurvey);
        
        return ResponseEntity.created(showURI.toUri()).build();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param surveys
     * @param result
     * @return ResponseEntity
     */
    @PostMapping(value = "/batch", name = "createBatch")
    public ResponseEntity<?> SurveysCollectionJsonController.createBatch(@Valid @RequestBody Collection<Survey> surveys, BindingResult result) {
        
        if (result.hasErrors()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(result);
        }
        
        surveyService.save(surveys);
        
        return ResponseEntity.created(listURI().toUri()).build();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param surveys
     * @param result
     * @return ResponseEntity
     */
    @PutMapping(value = "/batch", name = "updateBatch")
    public ResponseEntity<?> SurveysCollectionJsonController.updateBatch(@Valid @RequestBody Collection<Survey> surveys, BindingResult result) {
        
        if (result.hasErrors()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(result);
        }
        
        surveyService.save(surveys);
        
        return ResponseEntity.ok().build();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return ResponseEntity
     */
    @DeleteMapping(value = "/batch/{ids}", name = "deleteBatch")
    public ResponseEntity<?> SurveysCollectionJsonController.deleteBatch(@PathVariable("ids") Collection<Long> ids) {
        
        surveyService.delete(ids);
        
        return ResponseEntity.ok().build();
    }
    
}
