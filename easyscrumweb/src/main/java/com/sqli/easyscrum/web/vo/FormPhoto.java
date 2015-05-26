package com.sqli.easyscrum.web.vo;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import com.sqli.easyscrum.business.services.ProjectService;
import com.sqli.easyscrum.business.services.TeamService;
import com.sqli.easyscrum.business.services.UserService;
import com.sqli.easyscrum.entity.Project;
import com.sqli.easyscrum.entity.Team;
import com.sqli.easyscrum.entity.User;

public class FormPhoto {
	
	@Autowired
	private UserService userService;
	@Autowired
	private TeamService teamService;
	@Autowired
	private ProjectService projectService;
	
	public String uploadUserpicture(User u,MultipartFile file,String APP_PATH)
	{
		String name="user_"+Calendar.getInstance().getTime().toString()+"_"+u.getLogin();
		name=name.replace(" ", "");
		name=name.replace(":", "");
		name=name.replace(",", "");
		name=name.replace("//", "/");
		String ext = "jpg";
		name=name+"."+ext;
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				File dir = new File(APP_PATH + File.separator + "useravatar");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + name);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
				return "useravatar"+ "/"+ name;
			} catch (Exception e) {
				return "You failed to upload " + name + " => " + e.getMessage();
			}
		} else {
			return  "You failed to upload " + name
					+ " because the file was empty.";
		}
	}
	
	
	public String uploadTeampicture(Team t,MultipartFile file,String APP_PATH)
	{
		String name="team_"+Calendar.getInstance().getTime().toString()+"_"+t.getName();
		name=name.replace(" ", "");
		name=name.replace(":", "");
		name=name.replace(",", "");
		name=name.replace("//", "/");
		String ext = "jpg";
		name=name+"."+ext;
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				File dir = new File(APP_PATH + File.separator + "teamavatar");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + name);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
				return "teamavatar"+ "/"+ name;
			} catch (Exception e) {
				return "You failed to upload " + name + " => " + e.getMessage();
			}
		} else {
			return  "You failed to upload " + name	+ " because the file was empty.";
		}
	}
		
		
		public String uploadProjectpicture(Project p,MultipartFile file,String APP_PATH)
		{
			String name="project_"+Calendar.getInstance().getTime().toString()+"_"+p.getNomproject();
			name=name.replace(" ", "");
			name=name.replace(":", "");
			name=name.replace(",", "");
			name=name.replace("//", "/");
			String ext = "jpg";
			name=name+"."+ext;
			if (!file.isEmpty()) {
				try {
					byte[] bytes = file.getBytes();

					// Creating the directory to store file
					File dir = new File(APP_PATH + File.separator + "projectavatar");
					if (!dir.exists())
						dir.mkdirs();

					// Create the file on server
					File serverFile = new File(dir.getAbsolutePath()
							+ File.separator + name);
					BufferedOutputStream stream = new BufferedOutputStream(
							new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();
					
					return "projectavatar"+ "/"+ name;
				} catch (Exception e) {
					return "You failed to upload " + name + " => " + e.getMessage();
				}
			} else {
				return  "You failed to upload " + name
						+ " because the file was empty.";
			}
	}
	
	
	
}
