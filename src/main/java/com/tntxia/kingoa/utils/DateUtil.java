package com.tntxia.kingoa.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public static String getDateStr(Date date, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}

	public static String getNowString(String format) {
		Date now = new Date(System.currentTimeMillis());
		return (new SimpleDateFormat(format)).format(now);
	}
	
	public static String getCurrentDateStr() {
		return getNowString("yyyy-MM-dd");
	}

}
