package com.workercapital.web;
import com.workercapital.domain.Survey;
import com.workercapital.service.api.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = SurveyDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = Survey.class)
public class SurveyDeserializer extends JsonObjectDeserializer<Survey> {

    /**
     * TODO Auto-generated field documentation
     *
     */
    public SurveyService surveyService;

    /**
     * TODO Auto-generated field documentation
     *
     */
    public ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param surveyService
     * @param conversionService
     */
    @Autowired
    public SurveyDeserializer(SurveyService surveyService, ConversionService conversionService) {
        this.surveyService = surveyService;
        this.conversionService = conversionService;
    }
}
