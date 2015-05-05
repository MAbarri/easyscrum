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
	private String DtPost;
	
	@Column(name="Contenue")
	private String Description;
	
	@ManyToOne
    @JoinColumn(name = "id_us")
    private UserStorie storie;
		
	public Backlog()
	{
		
	}
	public Backlog(int id,String desc,String date,UserStorie ustories )
	{
		this.Idback=id;
		this.Description=desc;
		this.DtPost=date;
		this.storie=ustories;
	}
	public int getIdback() {
		return Idback;
	}
	public void setIdback(int idback) {
		Idback = idback;
	}
	public String getDtPost() {
		return DtPost;
	}
	public void setDtPost(String dtPost) {
		DtPost = dtPost;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
}
