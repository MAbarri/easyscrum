package com.sqli.easyscrum.web.vo;

import com.sqli.easyscrum.entity.Team;
import com.sqli.easyscrum.entity.User;

public class FormTeamObject {


	
	
	private String name;
	private String company;
	private String email;
	private String caption;
	private String photo;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public FormTeamObject(){}
	public FormTeamObject(String nom,String Company,String Email,String Caption,String Photo)
	{
		this.name=nom;
		this.company=Company;
		this.email=Email;
		this.caption=Caption;
		this.photo=Photo;
	}
	public Team toTeam(User boss)
	{
		Team result = new Team(this.caption, this.email, this.company, this.name, this.photo);
		result.setBoss(boss);
		return result;
		
	}
}
