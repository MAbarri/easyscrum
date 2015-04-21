/*
 * EasyScrum Project
 * Copy Right Sqli
 */
package com.sqli.easyscrum.business.exceptions;

public class ItemNotFoundException extends RuntimeException
{
	private static final long serialVersionUID = 1L;

	public ItemNotFoundException(String message)
	{
		super(message);
	}
}
