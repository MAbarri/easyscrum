package com.sqli.easyscrum.entity;


import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "project")
public class Project {

    public List<Sprint> getSprints() {
		return sprints;
	}

	public void setSprints(List<Sprint> sprints) {
		this.sprints = sprints;
	}

	@Id
    @Column(name = "idProject")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer projectId;
    
	@Column(name = "nom")
    private String nomproject;
	
	@Column(name = "langue")
    private String language;
	
	@Column(name = "type")
    private String type;
	
	@Column(name = "Description")
    private String desc;
	
	@Column(name = "tags")
    private String tags;
	
	@Column(name = "logo")
    private String logo;
	
	@Column(name = "Cost")
    private String cost;
	
	@Column(name = "Company")
    private String company;
	
	@Column(name = "Email")
    private String email;
	
	@Column(name = "DateDebut")
    private Timestamp dateDebut;
	
	@Column(name = "DateRouge")
    private Timestamp deadLine;
	
	@Column(name = "DateFin")
    private Timestamp dateFin;
	
	@Column(name = "PStatus")
    private String status;
	
	public Team getWorkteam() {
		return workteam;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public void setWorkteam(Team workteam) {
		this.workteam = workteam;
	}

	@OneToMany(mappedBy="projet")
	private List<Sprint> sprints;
	
	@OneToOne(mappedBy="projet")
	@PrimaryKeyJoinColumn
	private Backlog backlog;
	
	@ManyToOne
    @JoinColumn(name = "id_team")
	private Team workteam;
	
	
	public Backlog getBacklog() {
		return backlog;
	}

	public void setBacklog(Backlog backlog) {
		this.backlog = backlog;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@ManyToOne
	@JoinColumn(name = "iduser")
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
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

	public Timestamp getDeadLine() {
		return deadLine;
	}

	public void setDeadLine(Timestamp deadLine) {
		this.deadLine = deadLine;
	}


	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public String getNomproject() {
		return nomproject;
	}

	public void setNomproject(String nomproject) {
		this.nomproject = nomproject;
	}

	public Timestamp getDateDebut() {
		return dateDebut;
	}

	public void setDateDebut(Timestamp dateDebut) {
		this.dateDebut = dateDebut;
	}

	public Timestamp getDateFin() {
		return dateFin;
	}

	public void setDateFin(Timestamp dateFin) {
		this.dateFin = dateFin;
	}
	public Project(String nom ,String Langue ,String Type ,String Desc ,String Tags ,String Cost ,String Company ,String Email ,Timestamp DeadLine ,String Status,Timestamp dtd,Timestamp Dtf)
	{
		this.nomproject=nom;
		this.company=Company;
		this.cost=Cost;
		this.language=Langue;
		this.type=Type;
		this.desc=Desc;
		this.tags=Tags;
		this.email=Email;
		this.deadLine=DeadLine;
		this.status=Status;
		this.dateDebut=dtd;
		this.dateFin=Dtf;
	}
	public Project()
	{
	}
	
}
