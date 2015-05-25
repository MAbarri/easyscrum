package com.sqli.easyscrum.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "user")
public class User {

	private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "iduser")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer userId;
    
    @OneToMany(mappedBy="user",cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    private List<Project> projects;
	
	@OneToMany(mappedBy="sender",cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    private List<Mail> sentmails;
	
	@OneToMany(mappedBy="Reciever",cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    private List<Mail> recievedmails;
	
	@OneToMany(mappedBy="boss",cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    private List<Team> teamchef;
	
	@OneToMany(mappedBy="user",cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    private List<Activities> ativities;
	
	@ManyToMany
    private List<Team> teams;
	
	public List<Activities> getAtivities() {
		return ativities;
	}

	public void setAtivities(List<Activities> ativities) {
		this.ativities = ativities;
	}

	@OneToOne
    @JoinColumn(name = "iduser")
	private Notification notification;    
	
	public Notification getNotification() {
		return notification;
	}

	public void setNotification(Notification notification) {
		this.notification = notification;
	}

	@Column(name = "nom")
    private String nom;
    
    @Column(name = "prenom")
    private String prenom;
    
    @Column(name = "adresse")
    private String adresse;
    
    @Column(name = "email")
    private String email;
    
    @Column(name = "photo")
    private String photo;
    
    @Column(name = "login")
    private String login;
    
    @Column(name = "needteam")
    private boolean needteam;
    
    @Column(name = "password")
    private String password;

    @Column(name = "Telephone")
    private String telephone;
    
    @Column(name = "Speciality")
    private String Speciality;

    public Integer getUserId() {
		return userId;
	}

    public List<Project> getProjects() {
		return projects==null?new ArrayList<Project>():projects;
	}


	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}
	
	public List<Team> getTeamchef() {
		return teamchef;
	}

	public void setTeamchef(List<Team> teamchef) {
		this.teamchef = teamchef;
	}

	public List<Team> getTeams() {
		return teams;
	}

	public void setTeams(List<Team> teams) {
		this.teams = teams;
	}
 
	public List<Mail> getSentmails() {
		return sentmails;
	}

	public void setSentmails(List<Mail> sentmails) {
		this.sentmails = sentmails;
	}

	public List<Mail> getRecievedmails() {
		return recievedmails;
	}

	public void setRecievedmails(List<Mail> recievedmails) {
		this.recievedmails = recievedmails;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	public String getPrenom() {
		return prenom;
	}


	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}


	public String getAdresse() {
		return adresse;
	}


	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public String getLogin() {
		return login;
	}


	public void setLogin(String login) {
		this.login = login;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}
    
    public boolean isNeedteam() {
		return needteam;
	}

	public void setNeedteam(boolean needteam) {
		this.needteam = needteam;
	}
    
	public String getTelephone() {
		return telephone;
	}


	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}


	public String getSpeciality() {
		return Speciality;
	}


	public void setSpeciality(String speciality) {
		Speciality = speciality;
	}

	@Column(name = "type")
    private int type;


    public int getType() {
		return type;
	}


	public void setType(int type) {
		this.type = type;
	}


	public User() {
    }


	public User(Integer userId) {
        this.userId = userId;
    }

    public User(String nom, String prenom , String photo, String adresse, Boolean actif, String email, String login,String pass,int tp) {
        this.adresse=adresse;
        this.nom=nom;
        this.prenom=prenom;
        this.photo=photo;
        this.email=email;
        this.login = login;
        this.password=pass;
        this.type=tp;
    }

    
}
