package com.sqli.easyscrum.entity;

import java.sql.Timestamp;

import javax.persistence.*;

@Entity
@Table(name="sprint")
public class Sprint {
	@Id
	@Column(name="IdSprint")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idsprint;
	
	@Column(name="Sprintname")
	private String nom;
	
	@Column(name="DateDebut")
	private Timestamp dtd;
	
	@Column(name="description")
	private String description;
	
	@Column(name="priority")
	private String priority;
	
	@ManyToOne
    @JoinColumn(name = "id_project")
	private Project projet;
	
	public Project getProjet() {
		return projet;
	}
	public void setProjet(Project projet) {
		this.projet = projet;
	}
	public String getNom() {
		return nom;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	@Column(name="DateFin")
	private Timestamp dtf;
	
	@Column(name="status")
	private String status;
	
	public Sprint(){
		
	}
	public Sprint (String name,Timestamp datedebut,Timestamp Datefin,String description,String priority)
	{
		this.nom=name;
		this.dtd=datedebut;
		this.dtf=Datefin;
		this.description=description;
		this.priority=priority;
		this.status="Starting";
	}
	public int getIdsprint() {
		return idsprint;
	}
	public void setIdsprint(int idsprint) {
		this.idsprint = idsprint;
	}
	public Timestamp getDtd() {
		return dtd;
	}
	public void setDtd(Timestamp dtd) {
		this.dtd = dtd;
	}
	public Timestamp getDtf() {
		return dtf;
	}
	public void setDtf(Timestamp dtf) {
		this.dtf = dtf;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	/*Status values :
	 * Starting : 20%
	 * Working On : 40%
	   Testing : 60%
	   Ready for a Demo : 80%
	   Delivery : 99%
	 */
	
	
}
