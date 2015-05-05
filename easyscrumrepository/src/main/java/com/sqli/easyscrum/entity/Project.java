package com.sqli.easyscrum.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "project")
public class Project {

    @Id
    @Column(name = "idSM")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer projectId;
    
	@Column(name = "nom")
    private String nomproject;
	
	@Column(name = "langue")
    private String language;
	
	@Column(name = "type")
    private String Type;
	
	@Column(name = "Description")
    private String desc;
	
	@Column(name = "tags")
    private String Tags;
	
	@Column(name = "Cost")
    private String cost;
	
	@Column(name = "Company")
    private String Company;
	
	@Column(name = "Email")
    private String Email;
	
	@Column(name = "DateDebut")
    private String dateDebut;
	
	@Column(name = "DateRouge")
    private String DeadLine;
	
	@Column(name = "DateFin")
    private String dateFin;
	
	@Column(name = "PStatus")
    private String status;
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		status = status;
	}
	
	@ManyToOne
    @JoinColumn(name = "backlog")
	private Backlog bg;

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type = type;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getTags() {
		return Tags;
	}

	public void setTags(String tags) {
		Tags = tags;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getCompany() {
		return Company;
	}

	public void setCompany(String company) {
		Company = company;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getDeadLine() {
		return DeadLine;
	}

	public void setDeadLine(String deadLine) {
		DeadLine = deadLine;
	}

	public Backlog getBg() {
		return bg;
	}

	public void setBg(Backlog bg) {
		this.bg = bg;
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

	public String getDateDebut() {
		return dateDebut;
	}

	public void setDateDebut(String dateDebut) {
		this.dateDebut = dateDebut;
	}

	public String getDateFin() {
		return dateFin;
	}

	public void setDateFin(String dateFin) {
		this.dateFin = dateFin;
	}
	public Project(int num,String nom ,String Langue ,String Type ,String Desc ,String Tags ,String Cost ,String Company ,String Email ,String DeadLine ,Backlog backl ,String Status,String dtd,String Dtf)
	{
		this.projectId=num;
		this.nomproject=nom;
		this.Company=Company;
		this.bg=backl;
		this.cost=Cost;
		this.language=Langue;
		this.Type=Type;
		this.desc=Desc;
		this.Tags=Tags;
		this.Email=Email;
		this.DeadLine=DeadLine;
		this.status=Status;
		this.dateDebut=dtd;
		this.dateFin=Dtf;
	}
	public Project()
	{
	}
	
}
