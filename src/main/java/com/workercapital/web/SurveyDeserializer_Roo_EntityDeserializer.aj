// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.workercapital.web;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonNode;
import com.workercapital.domain.Survey;
import com.workercapital.web.SurveyDeserializer;
import io.springlets.web.NotFoundException;
import java.io.IOException;
import org.springframework.boot.jackson.JsonComponent;

privileged aspect SurveyDeserializer_Roo_EntityDeserializer {
    
    declare @type: SurveyDeserializer: @JsonComponent;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param jsonParser
     * @param context
     * @param codec
     * @param tree
     * @return Survey
     * @throws IOException
     */
    public Survey SurveyDeserializer.deserializeObject(JsonParser jsonParser, DeserializationContext context, ObjectCodec codec, JsonNode tree) throws IOException {
        String idText = tree.asText();
        Long id = conversionService.convert(idText, Long.class);
        Survey survey = surveyService.findOne(id);
        if (survey == null) {
            throw new NotFoundException("Survey not found");
        }
        return survey;
    }
    
}
