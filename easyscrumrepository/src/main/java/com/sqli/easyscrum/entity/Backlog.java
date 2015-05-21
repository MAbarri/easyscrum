package com.sqli.easyscrum.entity;

import java.util.List;

import javax.persistence.*;


@Entity
@Table(name="backlog")
public class Backlog {
	
	@Id
	@Column(name="IdBackLog")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idback;
	
	@Column(name="Dtpost")
	private String dtPost;
	
	@Column(name="Contenue")
	private String description;
	
	@OneToMany(mappedBy="backlog")
    private List<UserStorie> stories;
	
	public List<UserStorie> getStories() {
		return stories;
	}
	public void setStories(List<UserStorie> stories) {
		this.stories = stories;
	}
	public Project getProjet() {
		return projet;
	}
	public void setProjet(Project projet) {
		this.projet = projet;
	}
	@OneToOne
    @JoinColumn(name = "id_project")
	private Project projet;
		
	public Backlog()
	{
		
	}
	public Backlog(String desc,String date)
	{
		this.description=desc;
		this.dtPost=date;
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
		this.dtPost = dtPost;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
