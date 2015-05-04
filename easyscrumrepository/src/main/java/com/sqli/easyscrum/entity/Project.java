package com.sqli.easyscrum.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
	
	@Column(name = "DateDebut")
    private String dateDebut;
	
	@Column(name = "DateFin")
    private String dateFin;

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
	public Project(int num,String nom,String dtd,String Dtf)
	{
		this.projectId=num;
		this.nomproject=nom;
		this.dateDebut=dtd;
		this.dateFin=Dtf;
	}
	public Project()
	{
	}
	
}
