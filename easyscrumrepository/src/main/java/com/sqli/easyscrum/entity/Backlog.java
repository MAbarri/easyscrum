package com.sqli.easyscrum.entity;

import java.util.Set;

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
	
	@OneToMany(mappedBy="Backlog")
    private Set<UserStorie> stories;
	
	public Set<UserStorie> getStories() {
		return stories;
	}
	public void setStories(Set<UserStorie> stories) {
		this.stories = stories;
	}
	public Project getProjet() {
		return projet;
	}
	public void setProjet(Project projet) {
		this.projet = projet;
	}
	@ManyToOne
    @JoinColumn(name = "id_project")
	private Project projet;
		
	public Backlog()
	{
		
	}
	public Backlog(int id,String desc,String date)
	{
		this.idback=id;
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
		dtPost = dtPost;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
