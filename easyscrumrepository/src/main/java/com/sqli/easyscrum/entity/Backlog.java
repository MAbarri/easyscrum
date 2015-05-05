package com.sqli.easyscrum.entity;

import java.util.List;

import javax.persistence.*;


@Entity
@Table(name="backlog")
public class Backlog {
	
	@Id
	@Column(name="IdBackLog")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int Idback;
	
	@Column(name="Dtpost")
	private String dtPost;
	
	@Column(name="Contenue")
	private String description;
	
	@ManyToOne
    @JoinColumn(name = "id_us")
    private UserStorie storie;
		
	public Backlog()
	{
		
	}
	public Backlog(int id,String desc,String date,UserStorie ustories )
	{
		this.Idback=id;
		this.description=desc;
		this.dtPost=date;
		this.storie=ustories;
	}
	public int getIdback() {
		return Idback;
	}
	public void setIdback(int idback) {
		Idback = idback;
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
