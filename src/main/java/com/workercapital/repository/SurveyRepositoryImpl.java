package com.workercapital.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import com.workercapital.domain.Survey;

/**
 * = SurveyRepositoryImpl
 *
 * TODO Auto-generated class documentation
 *
 */ 
@RooJpaRepositoryCustomImpl(repository = SurveyRepositoryCustom.class)
public class SurveyRepositoryImpl extends QueryDslRepositorySupportExt<Survey> {

    /**
     * TODO Auto-generated constructor documentation
     */
    SurveyRepositoryImpl() {
        super(Survey.class);
    }
}