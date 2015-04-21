package com.sqli.easyscrum.web.validator;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.text.ParseException;

public class DateValidator {

	public static boolean isThisDateValid(String dateToValidate,
			String dateFromat) {
		if (dateToValidate == null) {
			return false;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(dateFromat);
		sdf.setLenient(false);
		try {
			Date date = sdf.parse(dateToValidate);
			Date sys_date = Calendar.getInstance().getTime();
			if (date.compareTo(sys_date) < 0) {
				return false;
			}
		} catch (ParseException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}