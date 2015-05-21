package com.sqli.easyscrum.web.vo;

import java.util.ArrayList;
import java.util.List;

import com.sqli.easyscrum.entity.Mail;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.Team;
import com.sqli.easyscrum.entity.User;

public class Mails {
	
	public Mail TeamInvitation(User reciever,User sender,Team team)
	{
		Mail invitation = new Mail("Team Invitation",
				"Hello "+reciever.getNom()+" "+reciever.getPrenom()+"<br>I am "+sender.getNom()+" "
						+sender.getPrenom()+", and I am a Scrum Master, I found Your profil and i want you to join my Team "+team.getName()
						+".<br>I have already sent you an invitation, to accept it there is a \"Join Team\" button down here,"
						+"Click it and Start Your experience with us !<br>Have a Good Day","22/12/2013");
		invitation.setSender(sender);
		invitation.setReciever(reciever);
		invitation.setAttachement(String.valueOf(team.getIdteam()));
		//mail types :
		//0 for presentation mail
		//1 for team invitation mail
		//2 for random mail
		invitation.setMailtype(1);
		return invitation;
	}
	public Mail JobApplication(User reciever,User sender,Team team,Project project)
	{
		Mail invitation = new Mail("Job application",
				"Hello "+reciever.getNom()+" "+reciever.getPrenom()+"<br>I am "+sender.getNom()+" "
						+sender.getPrenom()+", and I am a Scrum Master, I found Your project \""+project.getNomproject()+"\" and i think my Team \""+team.getName()
						+"\" will be a perfect choice to be it's maker<br>I have already sent you a job application, to accept it there is a \"Accept application\" button down here,"
						+"Click it and Start Your experience with us !<br>Have a Good Day","22/12/2013");
		invitation.setSender(sender);
		invitation.setReciever(reciever);
		invitation.setAttachement(String.valueOf(team.getProjects())+";"+String.valueOf(project.getProjectId()));
		//mail types :
		//0 for presentation mail
		//1 for team invitation mail
		//2 for Job Application mail
		//3 for random mail
		invitation.setMailtype(2);
		return invitation;
	}
	
	public List<Mail> JobAppNotifs(Team team,Project project)
	{
		List<Mail> mails = new ArrayList<Mail>();
		for(User i :team.getMembers())
		{
			Mail invitation = new Mail("New Job application",
					"Hello "+i.getNom()+" "+i.getPrenom()+"<br>I am "+team.getBoss().getNom()+" "
							+team.getBoss().getPrenom()+", and I am your Team Manager, Our Team \""+team.getName()+"\" just aquired a new project : Project \""+project.getNomproject()
							+"\" , I encourage you to go and check it out, read it's Backlog ans send me whatever remarques you have.<br>When starting the project, i will send you another message.<br>Have a Good Day","22/12/2013");
			invitation.setSender(team.getBoss());
			invitation.setReciever(i);
			invitation.setAttachement(String.valueOf(team.getProjects())+";"+String.valueOf(project.getProjectId()));
			//mail types :
			//0 for presentation mail
			//1 for team invitation mail
			//2 for Job Application mail
			//3 for Job Application mail notification
			//4 for random mail
			invitation.setMailtype(3);
			mails.add(invitation);
		}
		return mails;
	}
}
