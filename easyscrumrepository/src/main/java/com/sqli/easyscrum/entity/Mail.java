package com.sqli.easyscrum.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="email")
public class Mail {

	@Id
	@Column(name="idEmail")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idmail;
	
	@Column(name="title")
	private String title;
	
	@Column(name="text")
	private String text;
	
	@Column(name="Dateenvoi")
	private String dateenvoi;
	
	@Column(name="vue")
	private boolean vue;
	
	@ManyToOne
	@JoinColumn(name="idsender")
	private User sender;

	@ManyToOne
	@JoinColumn(name="idreciever")
	private User Reciever;
	
	public Mail(){}
	public Mail( String title,String text,String dateenvoi)
	{
		this.dateenvoi=dateenvoi;
		this.text=text;
		this.title=title;
		this.vue=false;
	}
	public int getIdmail() {
		return idmail;
	}
	public void setIdmail(int idmail) {
		this.idmail = idmail;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getDateenvoi() {
		return dateenvoi;
	}
	public void setDateenvoi(String dateenvoi) {
		this.dateenvoi = dateenvoi;
	}
	public boolean isVue() {
		return vue;
	}
	public void setVue(boolean vue) {
		this.vue = vue;
	}
	public User getSender() {
		return sender;
	}
	public void setSender(User sender) {
		this.sender = sender;
	}
	public User getReciever() {
		return Reciever;
	}
	public void setReciever(User reciever) {
		Reciever = reciever;
	}


}
