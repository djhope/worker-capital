// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.workercapital.domain;

import com.workercapital.domain.Survey;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Survey_Roo_Jpa_Entity {
    
    declare @type: Survey: @Entity;
    
    /**
     * TODO Auto-generated attribute documentation
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Survey.id;
    
    /**
     * TODO Auto-generated attribute documentation
     */
    @Version
    @Column(name = "version")
    private Integer Survey.version;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    public Long Survey.getId() {
        return this.id;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     */
    public void Survey.setId(Long id) {
        this.id = id;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Integer
     */
    public Integer Survey.getVersion() {
        return this.version;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param version
     */
    public void Survey.setVersion(Integer version) {
        this.version = version;
    }
    
}