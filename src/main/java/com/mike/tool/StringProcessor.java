package com.mike.tool;

import java.util.Random;

public class StringProcessor {

	public static String getFileExtension(String filename) throws IllegalArgumentException{
		
		String fileExtension;
		
		int dotIndex = filename.lastIndexOf('.');
		if (!(dotIndex == -1)) {
		  fileExtension = filename.substring(dotIndex + 1);
		} else {
		  throw new IllegalArgumentException("input filename lack of extension(.)");
		}
		
		return fileExtension; //"jpg" without "."
	}
	
	public static String getFilename(String path) throws IllegalArgumentException{
		
		String filename;
		
		int dotIndex = path.lastIndexOf('/');
		if (!(dotIndex == -1)) {
		  filename = path.substring(dotIndex + 1);
		} else {
		  throw new IllegalArgumentException("input path lack of \"/\"");
		}
		
		return filename; //"dog.jpg"
	}
	
	public static String getUrlLastSegment(String url) {
		
		String lastSegment = getFilename(url);
		return lastSegment;
	}
	
	public static String nullToEmpty(String input) {
		if(input == null) {
			return "";
		}else {
			return input;
		}
	}
	
	public static String blankToNull(String input) {
		if(input == null) {
			return input;
		}else {
			return emptyToNull(input.trim());
		}
	}
	
	public static String emptyToNull(String input) {
		if(input.isEmpty()) {
			return null;
		}else {
			return input;
		}
	}
	
	public static String getUserNameFromEmail(String email) {
		String username;
		int atIndex = email.lastIndexOf('@');
		if (!(atIndex == -1)) {
		  username = email.substring(0,atIndex);
		} else {
		  throw new IllegalArgumentException("email format is not correct");
		}
		return username;
	}
	
	public static String pathAddRandomQueryParams(String path) {
		String output = path.concat("?").concat(Integer.toString(new Random().nextInt()));
		return output;
	}
	
	public static boolean isCellphoneNumber(String number) {
		if (number == null || number.isBlank()) {
		    return false;
		}else {
			String regex = "^09[0-9]{2}(-)?[0-9]{3}(-)?[0-9]{3}$";
			return number.matches(regex);
		}
	}
	

}
