package com.sqli.easyscrum.core.server;

import java.io.File;
import java.text.NumberFormat;

public class SystemInfo {
	
	 private Runtime runtime = Runtime.getRuntime();

	    public String Info() {
	        StringBuilder sb = new StringBuilder();
	        sb.append(this.OsInfo());
	        sb.append(this.MemInfo());
	        sb.append(this.DiskInfo());
	        return sb.toString();
	    }

	    public String OSname() {
	        return System.getProperty("os.name");
	    }

	    public String OSversion() {
	        return System.getProperty("os.version");
	    }

	    public String OsArch() {
	        return System.getProperty("os.arch");
	    }

	    public long totalMem() {
	        return Runtime.getRuntime().totalMemory();
	    }

	    public long usedMem() {
	        return Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
	    }

	    public String MemInfo() {
	        NumberFormat format = NumberFormat.getInstance();
	        StringBuilder sb = new StringBuilder();
	        long maxMemory = runtime.maxMemory();
	        long allocatedMemory = runtime.totalMemory();
	        long freeMemory = runtime.freeMemory();
	        sb.append("<tr><td><label>Free memory: </label></td><td>");
	        sb.append(format.format((freeMemory / 1024)/ 1024));
	        sb.append(" Mb </td></tr>");
	        sb.append("<tr><td><label>Allocated memory: </label></td><td>");
	        sb.append(format.format((allocatedMemory / 1024)/ 1024));
	        sb.append(" Mb </td></tr>");
	        sb.append("<tr><td><label>Max memory: </label></td><td>");
	        sb.append(format.format((maxMemory / 1024)/ 1024));
	        sb.append(" Mb </td></tr>");
	        sb.append("<tr><td><label>Total free memory: </label></td><td>");
	        sb.append(format.format(((freeMemory + (maxMemory - allocatedMemory)) / 1024)/ 1024));
	        sb.append(" Mb </td></tr>");
	        return sb.toString();

	    }

	    public String OsInfo() {
	        StringBuilder sb = new StringBuilder();
	        sb.append("<tr><td><label>OS: </label></td><td>");
	        sb.append(this.OSname());
	        sb.append("</td></tr>");
	        sb.append("<tr><td><label>Version: </label></td><td>");
	        sb.append(this.OSversion());
	        sb.append("</td></tr>");
	        sb.append("<tr><td><label>OS architecture : </label></td><td>");
	        String arch = System.getenv("PROCESSOR_ARCHITECTURE");
	        String wow64Arch = System.getenv("PROCESSOR_ARCHITEW6432");
	        String realArch = arch.endsWith("64")|| wow64Arch != null && wow64Arch.endsWith("64")? "64" : "32";
	        
	        sb.append(realArch);
	        sb.append("</td></tr>");
	        sb.append("<tr><td><label>Available processors (cores): </label></td><td>");
	        sb.append(runtime.availableProcessors());
	        sb.append("</td></tr>");
	        return sb.toString();
	    }

	    public String DiskInfo() {
	        /* Get a list of all filesystem roots on this system */
	        File[] roots = File.listRoots();
	        StringBuilder sb = new StringBuilder();
	        NumberFormat format = NumberFormat.getInstance();

	        /* For each filesystem root, print some info */
	        for (File root : roots) {
	            sb.append("<tr><td><label>File system root: </label></td><td>");
	            sb.append(root.getAbsolutePath());
	            sb.append("</td></tr>");
	            sb.append("<tr><td><label>Total space (bytes): </label></td><td>");
	            sb.append(format.format(((root.getTotalSpace() / 1024)/ 1024)/ 1024));
	            sb.append(" Gb</td></tr>");
	            sb.append("<tr><td><label>Free space (bytes): </label></td><td>");
	            sb.append(format.format(((root.getFreeSpace() / 1024)/ 1024)/ 1024));
	            sb.append(" Gb</td></tr>");
	            sb.append("<tr><td><label>Usable space (bytes): </label></td><td>");
	            sb.append(format.format(((root.getUsableSpace() / 1024)/ 1024)/ 1024));
	            sb.append(" Gb</td></tr>");
	        }
	        return sb.toString();
	    }

}
