package com.sqli.easyscrum.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "team")
public class Team {
	
	private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "idteam")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer idteam;
    
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getKarma() {
		return Karma;
	}

	public void setKarma(int karma) {
		Karma = karma;
	}
	@Column(name = "caption")
    private String caption;
	
	@Column(name = "photo")
    private String photo;
    
    @Column(name = "name")
    private String name;
    
    @Column(name = "creationDate")
    private String creationDate;
    
    @Column(name = "company")
    private String company;
    
    @Column(name = "email")
    private String email;
    
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
	@Column(name = "available")
    private boolean available;
    
    @Column(name = "Karma")
    private int Karma;
    
    @ManyToMany(mappedBy="teams",cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    private List<User> members;
    
    @ManyToOne(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
	@JoinColumn(name="teamchef")
	private User boss;
    
    @OneToMany(mappedBy="workteam")
	private List<Project> projects;
    
    public Integer getIdteam() {
		return idteam;
	}

	public void setIdteam(Integer idteam) {
		this.idteam = idteam;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public List<User> getMembers() {
		return members;
	}

	public void setMembers(List<User> members) {
		this.members = members;
	}

	public User getBoss() {
		return boss;
	}

	public void setBoss(User boss) {
		this.boss = boss;
	}

	public List<Project> getProjects() {
		return projects;
	}

	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}
    public Team(){
    	
    }
    public Team(String caption,String email,String company,String name,String Photo)
    {
    	this.caption=caption;
    	//this.creationDate=creationdate;
    	this.email=email;
    	this.company=company;
    	this.name=name;
    	this.photo=Photo;
    }
    
}
