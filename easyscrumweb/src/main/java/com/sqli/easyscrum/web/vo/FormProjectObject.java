package com.sqli.easyscrum.web.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.sqli.easyscrum.entity.Backlog;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.entity.UserStorie;

public class FormProjectObject {
	
	private String nomp;
	private String sel1;
	private String sel2;
	private String description;
	private String tags;
	private String backlogtitle;
	private String ustext;
	private String time;
	private String cost;
	private String company;
	private String email;

	public String getNomp() {
		return nomp;
	}

	public void setNomp(String nomp) {
		this.nomp = nomp;
	}

	public String getSel1() {
		return sel1;
	}

	public void setSel1(String sel1) {
		this.sel1 = sel1;
	}

	public String getSel2() {
		return sel2;
	}

	public void setSel2(String sel2) {
		this.sel2 = sel2;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getBacklogtitle() {
		return backlogtitle;
	}

	public void setBacklogtitle(String backlogtitle) {
		this.backlogtitle = backlogtitle;
	}

	public String getUstext() {
		return ustext;
	}

	public void setUstext(String ustext) {
		this.ustext = ustext;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNom() {
		return nomp;
	}

	public void setNom(String nomp) {
		this.nomp = nomp;
	}
	
	//current time------------------------
	// 1) create a java calendar instance
	Calendar calendar = Calendar.getInstance();
	 
	// 2) get a java.util.Date from the calendar instance.
	//		    this date will represent the current instant, or "now".
	java.util.Date now = calendar.getTime();
	 
	// 3) a java current time (now) instance
	Timestamp currentTimestamp = new Timestamp(now.getTime());
	

	public Project toProject(User user)
	{
		List<UserStorie> lus = new ArrayList<UserStorie>();

		Backlog newback = new Backlog(this.getBacklogtitle(), currentTimestamp);
		
		String userstories = this.getUstext().substring(5);
		String[] parts = userstories.split(";and;");
		for(int i=0;i<parts.length;i++)
		{
		UserStorie us=new UserStorie(parts[i]);
		us.setBacklog(newback);
		lus.add(us);
		}
		
		
		newback.setStories(lus);
		//get current time plus the value of days entered by the user
		Calendar cal = Calendar.getInstance();
		cal.setTime(currentTimestamp);
		cal.add(Calendar.DAY_OF_WEEK, Integer.valueOf(this.getTime()));
		Timestamp nextTimestamp = new Timestamp(cal.getTime().getTime());
		
		Project prj = new Project( this.getNom(), this.getSel2(), this.getSel1(), this.getDescription(), this.getTags(), this.getCost(), this.getCompany(), this.getEmail(), nextTimestamp, "getting started",currentTimestamp , null);
		prj.setBacklog(newback);
		prj.setUser(user);
		return prj;
	}
	
}
