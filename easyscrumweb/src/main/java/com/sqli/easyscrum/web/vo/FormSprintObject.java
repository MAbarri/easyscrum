package com.sqli.easyscrum.web.vo;

import java.sql.Timestamp;

public class FormSprintObject {
	
	private String nom;
	private String dtd;
	private String status;
	private String description;
	private String dtf;
	private String Priority;
	private int projectid;
	public int getProjectid() {
		return projectid;
	}
	public void setProjectid(int projectid) {
		this.projectid = projectid;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getDtd() {
		return dtd;
	}
	public void setDtd(String dtd) {
		this.dtd = dtd;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDtf() {
		return dtf;
	}
	public void setDtf(String dtf) {
		this.dtf = dtf;
	}
	public String getPriority() {
		return Priority;
	}
	public void setPriority(String priority) {
		Priority = priority;
	}
	public Timestamp getconvertedDtd()
	{return null;}
	public Timestamp getconvertedDtf()
	{return null;}
}
