package com.sqli.easyscrum.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="UserStories")
public class UserStorie {
	
	@Id
	@Column(name="IdUS")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idus;
	
	@Column(name="Libelle")
	private String speech;
	
	@ManyToOne
	@JoinColumn(name="IdBackLog")
	private Backlog backlog;
	
	public Backlog getBacklog() {
		return backlog;
	}
	public void setBacklog(Backlog backlog) {
		this.backlog = backlog;
	}
	public UserStorie()
	{
		
	}
	public UserStorie(String desc)
	{
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
