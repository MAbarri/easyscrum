package com.sqli.easyscrum.entity;

import javax.persistence.*;

@Entity
@Table(name="sprint")
public class Sprint {
	@Id
	@Column(name="IdSprint")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idsprint;
	
	@Column(name="Sprintname")
	private String nom;
	
	@Column(name="DateDebut")
	private String dtd;
	
	@Column(name="DateFin")
	private String dtf;
	
	@Column(name="status")
	private String status;
	
	public Sprint(){
		
	}
	public Sprint (int id,String name,String datedebut,String Datefin,String stat)
	{
		this.idsprint=id;
		this.nom=name;
		this.dtd=datedebut;
		this.dtf=Datefin;
		this.status=stat;
	}
	public int getIdsprint() {
		return idsprint;
	}
	public void setIdsprint(int idsprint) {
		this.idsprint = idsprint;
	}
	public String getDtd() {
		return dtd;
	}
	public void setDtd(String dtd) {
		this.dtd = dtd;
	}
	public String getDtf() {
		return dtf;
	}
	public void setDtf(String dtf) {
		this.dtf = dtf;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
