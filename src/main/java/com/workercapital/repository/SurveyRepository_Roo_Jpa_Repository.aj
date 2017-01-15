// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.workercapital.repository;

import com.workercapital.domain.Survey;
import com.workercapital.repository.SurveyRepository;
import com.workercapital.repository.SurveyRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SurveyRepository_Roo_Jpa_Repository {
    
    declare parents: SurveyRepository extends JpaRepository<Survey, Long>;
    
    declare parents: SurveyRepository extends SurveyRepositoryCustom;
    
    declare @type: SurveyRepository: @Transactional(readOnly = true);
    
}
