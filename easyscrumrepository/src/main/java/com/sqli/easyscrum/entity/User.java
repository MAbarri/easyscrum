package com.sqli.easyscrum.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Marrafi
 */
@Entity
@Table(name = "user")
public class User extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "userId")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer userId;
    @Column(name = "nomComplet")
    private String nomComplet;
    @Column(name = "login")
    private String login;




    public User() {
    }


	public User(Integer userId) {
        this.userId = userId;
    }

    public User(Integer userId, String nomComplet, Boolean actif, String email, String login) {
        this.userId = userId;
        this.nomComplet = nomComplet;
        this.login = login;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getNomComplet() {
        return nomComplet;
    }

    public void setNomComplet(String nomComplet) {
        this.nomComplet = nomComplet;
    }



    public String getLogin() {
        return login;
    }

    


	public void setLogin(String login) {
        this.login = login;
    }
	


    
}
