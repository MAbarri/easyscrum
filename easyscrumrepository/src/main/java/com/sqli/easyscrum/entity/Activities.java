package com.sqli.easyscrum.entity;

import java.sql.Timestamp;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="activities")
public class Activities {

	@Id
	@Column(name="idactivities")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idactivs;
	
	@Column(name="dateactivitie")
	private Timestamp dtActivities;
	
	@Column(name="activitie")
	private String activities;
	
	@Column(name="atachement")
	private String atachement;
	
	@ManyToOne
	@JoinColumn(name="idUser")
	private User user;

	public int getIdactivs() {
		return idactivs;
	}

	public void setIdactivs(int idactivs) {
		this.idactivs = idactivs;
	}

	public Timestamp getDtActivities() {
		return dtActivities;
	}

	public void setDtActivities(Timestamp dtActivities) {
		this.dtActivities = dtActivities;
	}


	public String getActivities() {
		return activities;
	}

	public void setActivities(String activities) {
		this.activities = activities;
	}

	public String getAtachement() {
		return atachement;
	}

	public void setAtachement(String atachement) {
		this.atachement = atachement;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	/*
	 * this table is filled using triggers
	 * 
	 * sent mail trigger

delimiter #

create trigger sent_mail after insert on email
for each row
begin
  insert into activities (activitie, dateactivitie,idUser) values  ('Sent Email',now(),NEW.idsender);
end#

delimiter ;
	*
	*
	*Created project trigger
	*
	*
delimiter #

create trigger created_project after insert on project
for each row
begin
  insert into activities (activitie, dateactivitie,idUser) values  ('Created Project',now(),NEW.iduser);
end#

delimiter ;
	*
	*
	*updated Project
	*
	
delimiter #

create trigger updated_project after update on project
for each row
begin
  insert into activities (activitie, dateactivitie,idUser) values  ('Updated Project',now(),OLD.iduser);
end#

delimiter ;


	*
	*
	*Deleted Project
	*
	
delimiter #

create trigger Deleted_project after delete on project
for each row
begin
  insert into activities (activitie, dateactivitie,idUser) values  ('Deleted Project',now(),OLD.iduser);
end#

delimiter ;


	*
	*
	*Created Team 
	*
	
delimiter #

create trigger Created_Team after insert on team
for each row
begin
  insert into activities (activitie, dateactivitie,idUser) values  ('Created Team',now(),OLD.teamchef);
end#

delimiter ;


	*
	*
	*updated profil
	*
	
delimiter #

create trigger update_profil after update on user
for each row
begin
  insert into activities (activitie, dateactivitie,idUser) values  ('Updated Account',now(),OLD.iduser);
end#

delimiter ;



	 */
	
}
