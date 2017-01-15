package com.workercapital.domain;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.entity.RooJpaEntity;
import javax.validation.constraints.NotNull;

/**
 * = Survey
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJavaBean
@RooToString
@RooJpaEntity
public class Survey {

    /**
     * TODO Auto-generated field documentation
     *
     */
    @NotNull
    private String questionText;
}
