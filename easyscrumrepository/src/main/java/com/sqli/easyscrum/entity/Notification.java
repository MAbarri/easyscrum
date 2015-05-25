package com.sqli.easyscrum.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="notification")
public class Notification {

	@Id
	@Column(name="idnotif")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idnotif;
	
	public int getIdnotif() {
		return idnotif;
	}

	public void setIdnotif(int idnotif) {
		this.idnotif = idnotif;
	}

	public int getNormalMails() {
		return normalMails;
	}

	public void setNormalMails(int normalMails) {
		this.normalMails = normalMails;
	}

	public int getTeaminvitMails() {
		return teaminvitMails;
	}

	public void setTeaminvitMails(int teaminvitMails) {
		this.teaminvitMails = teaminvitMails;
	}

	public int getProjectMails() {
		return projectMails;
	}

	public void setProjectMails(int projectMails) {
		this.projectMails = projectMails;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name="NBnormalMails")
	private int normalMails;
	
	@Column(name="NBteaminvitMails")
	private int teaminvitMails;
	
	@Column(name="NBprojectMails")
	private int projectMails;
	
	@OneToOne(mappedBy="notification")
	@PrimaryKeyJoinColumn
	private User user;
}
