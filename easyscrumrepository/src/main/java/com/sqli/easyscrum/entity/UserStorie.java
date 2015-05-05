package com.sqli.easyscrum.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="UserStories")
public class UserStorie {
	
	@Id
	@Column(name="IdUS")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idus;
	
	@Column(name="Libelle")
	private String speech;
	
	
	public UserStorie()
	{
		
	}
	public UserStorie(int id,String desc)
	{
		this.idus=id;
		this.speech=desc;
	}
	public int getIdus() {
		return idus;
	}
	public void setIdus(int idus) {
		this.idus = idus;
	}
	public String getSpeech() {
		return speech;
	}
	public void setSpeech(String speech) {
		this.speech = speech;
	}
}
