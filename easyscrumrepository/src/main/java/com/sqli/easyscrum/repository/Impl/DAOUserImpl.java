package com.sqli.easyscrum.repository.Impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.sqli.easyscrum.entity.Backlog;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.Sprint;
import com.sqli.easyscrum.entity.User;
import com.sqli.easyscrum.entity.UserStorie;
import com.sqli.easyscrum.repository.DAOuser;

public class DAOUserImpl implements DAOuser {

		List<User> list = new ArrayList<User>();
	@Override
	public User getUserById(int id) {
		User u=null;
		for(User i:list)
		{
			if(i.getUserId()==id)
				u= i;
		}
		return u;
	}
	public void init()
	{//declaration des listes des foreign key x)
		Set<Project> pjs = new HashSet<Project>();
		Set<Backlog> bklg = new HashSet<Backlog>();
		Set<Sprint> sprt = new HashSet<Sprint>();
		//declaration d'un projet
		Project p =new Project(1, "facebook", "English", "Web App", "an awsome Work", "socialMedia;Blue;Awsome", "12000$", "Sumsung", "face@book.com", "22/12/2014", "Getting Started", "22/04/2014", "22/11/2014");
		//remplissage des listes
		bklg.add(new Backlog(1, "first Backlog", "13/06/2014",new UserStorie(1, "Work Well please")) );
		sprt.add(new Sprint(1,"Main Sprint", "08/09/2014", "28/09/2014", "Delivery"));
		sprt.add(new Sprint(2,"Side Sprint", "08/02/2014", "28/02/2014", "Ready for a Demo"));
		//affectation des liste au projet
		p.setBacklogs(bklg);
		p.setSprints(sprt);
		pjs.add(p);

		Set<Backlog> bklg2 = new HashSet<Backlog>();
		Set<Sprint> sprt2 = new HashSet<Sprint>();
		
		p=new Project(2, "twitter", "British", "Web App", "a good Work", "socialMedia;Blue;Bird", "22000$", "Apple", "tweet@tter.com", "22/12/2013", "Getting Started", "22/04/2013", "22/11/2013");
		
		bklg2.add(new Backlog(2, "second Backlog", "13/06/2013",new UserStorie(2, "A lot of money to offer")) );
		sprt2.add(new Sprint(3,"Final Sprint", "08/01/2015", "28/01/2015", "Working On"));
		
		p.setBacklogs(bklg2);
		p.setSprints(sprt2);
		
		pjs.add(p);
		
		User u = new User(1, "po", "client", "photo", "adresse", true, "project@owner.com", "po","123456",2);
		
		u.setProjects(pjs);
		list.add(u);
		p=null;
		bklg=null;
		pjs=null;
		u=null;
		sprt=null;
		list.add(new User(2, "admin", "boss", "photo", "adresse", true, "boss@boss.boss", "admin","admin",1));
		list.add(new User(3, "developer", "programmer", "photo", "adresse", true, "dev@loper.com", "dev","123456",3));
		list.add(new User(4, "SM", "teamboss", "photo", "adresse", true, "scrum@master.com", "sm","123456",4));
		list.add(new User(5, "simo", "simo", "simo", "simo", true, "simo@boss.boss", "simo","simo",2));
	}
	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}
//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	//session.beginTransaction();
	//User u = (User)session.load(User.class, lgn);
	//return u;
	@Override
	public void creatUser(User u) {
		list.add(u);

	}

	@Override
	public void deleteUser(User u) {
		for(User i:list)
		{
			if(i.getUserId()==u.getUserId())
				list.remove(i);
		}

	}

	@Override
	public void editUser(User u) {
		for(User i:list)
		{
			if(i.getUserId()==u.getUserId())
				i=u;
		}

	}
	
	public User getUserByLogin (String lgn)
	{
		User u=null;
		for(User i:list)
		{
			if(i.getLogin().equals(lgn))
				u= i;
		}
		return u;
		
	}
	public List<User> getAllUsers()
	{
		return list;
	}

}
