package com.sqli.easyscrum.entity;

import java.util.List;

import javax.persistence.*;


@Entity
@Table(name="backlog")
public class Backlog {
	
	@Id
	@Column(name="IdBackLog")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idback;
	
	@Column(name="Dtpost")
	private String dtPost;
	
	@Column(name="Contenue")
	private String description;
	
	@ManyToOne
    @JoinColumn(name = "id_us")
    private UserStorie storie;
	
	@ManyToOne
    @JoinColumn(name = "id_project")
	private Project projet;
		
	public Backlog()
	{
		
	}
	public Backlog(int id,String desc,String date,UserStorie ustories )
	{
		this.idback=id;
		this.description=desc;
		this.dtPost=date;
		this.storie=ustories;
	}
	public int getIdback() {
		return idback;
	}
	public void setIdback(int idback) {
		this.idback = idback;
	}
	public String getDtPost() {
		return dtPost;
	}
	public void setDtPost(String dtPost) {
		dtPost = dtPost;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
