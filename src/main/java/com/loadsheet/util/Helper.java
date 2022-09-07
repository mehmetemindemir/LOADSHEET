package com.loadsheet.util;

import java.io.File;
import java.io.FileWriter;
import java.net.InetAddress;
import java.security.MessageDigest;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.ResourceBundle;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.loadsheet.oracle.pool.ConnectionPool;

import oracle.jdbc.internal.OracleTypes;
public class Helper {
	public static ResourceBundle bundle = null;
	
	public static String checkNullStringDB(String s){
		if(s==null){
			return "null";
		}else{
			return "'"+s+"'";
		}
	
	}  
	public static String insDBTurkishCharacter(String str) {
		return Helper.getTurkish(Helper.utfConvJetmilStrNew(str));
	}
	public static String getDBTurkishCharacter(String str) {
		return Helper.utfConvJetmilStrNew(str);
	}
	public static boolean isvalid(long idnum){
		
		try {
			
			if( idnum > Long.parseLong("99999999999") || idnum < Long.parseLong("10000000000")) 
			return false;
			
			long tmpl,tmp;
			tmp=idnum/100;
			tmpl=idnum/100;
			int odd_sum,even_sum,total,chkDigit2,chkDigit1;
			int[] numArray=new int[9];
			for(int i=8; i>=0;i--){
				numArray[i]=(int)(tmpl%10);				
				tmpl=tmpl/10;
			}
			odd_sum=numArray[8]+numArray[6]+numArray[4]+numArray[2]+numArray[0];
			even_sum=numArray[7]+numArray[5]+numArray[3]+numArray[1];
			
			total=odd_sum*3+even_sum;
			chkDigit1=(10-(total%10))%10;
			
			odd_sum=chkDigit1+ numArray[7]+numArray[5]+numArray[3]+numArray[1];
			even_sum=numArray[8]+numArray[6]+numArray[4]+numArray[2]+numArray[0];
			total=odd_sum*3+even_sum;
			chkDigit2=(10-(total%10))%10;
			System.out.println("Tmp: "+tmp);
			tmp=tmp*100+chkDigit1*10+chkDigit2;
			System.out.println(tmp+":"+chkDigit1+":"+chkDigit2);
			if(tmp!=idnum){
				return false;
			}
			return true;
		} catch (Exception e) {
			errorLogger(Helper.class, e);
			return false;
		}
		
	}
	public static String isOnlineCheckin(String userCheckin){
		String retVal="";
		try {
			if(userCheckin.trim().equals("ONLINECHECKIN")||userCheckin.trim().equals("MOBILECHECKIN")){
				
				retVal="color: green;font-weight:bold";
			}
		} catch (Exception e) {
			errorLogger(Helper.class, e);
		}
		return retVal;
	}
	
	public static int getUserType(String userPosition){
		int userType=1;
		try {
			if(userPosition.equals("MANIFESTO")){
				userType=1;
			}else if(userPosition.equals("PERSONEL")) {
				userType=2;
			}else if(userPosition.equals("SEF")){
				userType=3;
			}else if(userPosition.equals("SPV")){
				userType=4;
			}else if(userPosition.equals("DIRECTOR")){
				userType=5;
			}else if(userPosition.equals("ADMIN")){
				userType=6;
			}
		} catch (Exception e) {
			errorLogger(Helper.class, e);
		}
		return userType;
	}
	public static String removeTirnak(String s){
		/** tirnak isareti calismasi **/
		char testChar = '\'';
		char[] myCharArray = s.toCharArray();
		s = " ";
		for(int i=1;i<myCharArray.length;i++){
			if(myCharArray[i]!=testChar){
				s += myCharArray[i];
			}
		}
		/** tirnak isareti calismasi **/		
		return s;
	
	}
	public static String atlasMilesType(String card){
		String returnData="";
		try {
			if(card.equals("BRONZ")){
				returnData="";
			}else if(card.equals("SILVER")){
				returnData="";
			}else if(card.equals("GOLD")){
				returnData="";
			}else if(card.equals("JUNIOR")){
				returnData="";
			}else if(card.equals("PLATINUM")){
				returnData="";
			}else if(card.equals("BUSINESS")){
				returnData="";
			}else if(card.equals("GIFT CARD")){
				returnData="";
			}
		} catch (Exception e) {
			
		}
		return returnData;
	}
	public static String stringDateFormat(String strDate,String delim) {
		try {
			String[] str = new String[3];
			Calendar cal = Calendar.getInstance();
			if(delim!=null && delim.equals("")==false){
				str = strDate.split(delim);
			}else{
				String strYear 	= strDate.substring(0,4);
				String strMonth = strDate.substring(4,6);
				String strDay	= strDate.substring(6,8);
				str[0] = strDay;
				str[1] = strMonth;
				str[2] = strYear;
			}
			int year 	 = Integer.valueOf(str[2]);
			int month 	 = Integer.valueOf(str[1]) - 1;
			int date 	 = Integer.valueOf(str[0]);	
			cal.set(year, month, date);
			return Helper.date2String(cal.getTime());
		} catch (Exception e) {
		}
		return null;
	}
	public static Date dateFormatConvert(String strDate,String format){
    	Date date = null;
    	try{
    		if (strDate.indexOf(".0Z") > -1) {
                strDate =strDate.replace("T", " ");
                strDate =strDate.replace(".0Z", "");
            }
    		date = (new SimpleDateFormat(format, Locale.FRENCH)).parse(strDate); 
    	}catch(Exception e){
    		Helper.errorLogger(Helper.class, e,"[strDate]:" + strDate + " [format]:" + format);
    	}
    	return date;
    }
	public static Date string2Date(String strDate) {
		try {			
			String[] str = strDate.split("/");
			Calendar cal = Calendar.getInstance();
			int year = Integer.valueOf(str[2]);
			int month = Integer.valueOf(str[1]) - 1;
			int date = Integer.valueOf(str[0]);

			cal.set(year, month, date);
			return cal.getTime();
		} catch (Exception e) {
		}
		return null;
	}
	public static String getWeekOfDay(String currentDate){
		String finalDay="";
		try {
			SimpleDateFormat format1=new SimpleDateFormat("dd/MM/yyyy");
			Date dt1=format1.parse(currentDate);
			DateFormat format2=new SimpleDateFormat("EEEE"); 
			finalDay=format2.format(dt1);
		} catch (Exception e) {

		}
		return finalDay;
	}
	public static String getLastDayDate() {
		try {			
			String strDate=Helper.getToDate();
			String[] str = strDate.split("/");
			Calendar cal = Calendar.getInstance();
			int year = Integer.valueOf(str[2]);
			int month = Integer.valueOf(str[1])-1;
			int date = Integer.valueOf(str[0])-1;
			
			cal.set(year, month, date);
			SimpleDateFormat sdf = new SimpleDateFormat();
			sdf.applyPattern("dd/MM/yyyy");
			return sdf.format(cal.getTime());
		} catch (Exception e) {
		}
		return null;
	}
	public static double dateDifferent(Date from, Date to, int differentType) {

		if (from == null) {
			from = new Date();
		}
		if (to == null) {
			to = new Date();
		}

		Calendar calendar1 = Calendar.getInstance();
		Calendar calendar2 = Calendar.getInstance();
		calendar1.setTime(from);
		calendar2.setTime(to);
		long milliseconds1 = calendar1.getTimeInMillis();
		long milliseconds2 = calendar2.getTimeInMillis();
		double diff = milliseconds2 - milliseconds1;
		 
		double left = 0;
		if (differentType == Calendar.SECOND) {
			left = (diff / 1000l);
		} else if (differentType == Calendar.MINUTE) {
			left = (diff / (60l * 1000l));
		} else if (differentType == Calendar.HOUR) {
			left = (diff / (60l * 60l * 1000l));
		} else if (differentType == Calendar.DATE) {
			//left = Helper.roundDecimal((diff / (24d * 60d * 60d * 1000d)));
			left = (diff / (24d * 60d * 60d * 1000d));
			/** TODO **/
		}else if (differentType == Calendar.MILLISECOND) {
			left = diff;
		}else if (differentType == Calendar.YEAR) {
			left = Helper.roundDouble((diff / (365d * 24d * 60d * 60d * 1000d)));
		}
		
		
		return left;
	}
	public static double roundDouble(double input){
		return Math.round(input * Math.pow(10, (double) 2.0)) / Math.pow(10, (double) 2.0);	
    }
	
	public static double roundDecimal(double price) {
		DecimalFormat twoDigits = new DecimalFormat("0,00");
		return Double.valueOf(twoDigits.format(price));
	}
	public static String checkNullintDB(String s){
		if(s==null){
			return "null";
		}else{
			return s;
		}
		
	}
	public static String utfConvStrTRForSQL(String str) {
		int unicodeIntValue = 0;
		String unicodeString = "";
		if(str == null) return null;
		try {
			int length = str.length();
			for(int i=0; i<length;i++) {
				unicodeIntValue = str.charAt(i);
				//System.out.println("unicodeIntValue:"+unicodeIntValue +" - "+(char) unicodeIntValue);
				if (unicodeIntValue == 304) {
					unicodeString +="" + (char)221;
					continue;
				}
				if (unicodeIntValue == 305) {
					unicodeString += "" + (char)253;
					continue;
				}
				if (unicodeIntValue == 351) {
					unicodeString += "" + (char)254;
					continue;
				}
				if (unicodeIntValue == 350) {
					unicodeString += "" + (char)222;
					continue;
				}
				if (unicodeIntValue == 286) {
					unicodeString += "" + (char)208;
					continue;
				}
				if (unicodeIntValue == 287) {
					unicodeString += "" + (char)240;
					continue;
				}
				unicodeString += (char) unicodeIntValue;
			}

			return unicodeString;
		}
		catch (Exception e) {
			
		}
		return unicodeString;
	}	
	public static String getLanguage(HttpServletRequest request){
		String lang = "TR";
		try{
			if(request==null){
				lang = "TR";
			}else if(Helper.request2String(request,"lang").length()==2){
				lang = Helper.request2String(request,"lang").toUpperCase();
			}else if(request.getSession().getAttribute(Constants.SESSION_LANG)!=null){
				lang = (String)request.getSession().getAttribute(Constants.SESSION_LANG);
			}
			lang = lang.toUpperCase();
		}catch (Exception e) {
		}
		return lang;
	}
	public static String removeForbiddenChar(String str) {
    	if(str!=null && str.length()>0){
    		String EMAIl_PATTERN = "[()?:!,'+/;+&$#%€~|^<>\"]";
			str = str.replaceAll(EMAIl_PATTERN, "");
    	}
		return str;
	}
	
	public static String removeForbiddenLetters(String s){
		return s.replaceAll("[^a-zA-Z0-9]", "");
	}

	public static int request2int(HttpServletRequest request, String field) {
		int result = 0;
		try {
			String str = request.getParameter(field);
			
			if((str==null || str.trim().length()==0) ){
				if(request.getAttribute(field)!=null){
					str = String.valueOf(request.getAttribute(field));
				}
			}
			str = checkNulls(str, "0");
			str = str.replace("<değişken>","");
			str = str.replace("km","");
			str = str.trim();
			if (str != null && str.length() > 0){
				result = Integer.valueOf(str);
			}
		} catch (Exception e) {
			System.out.println("An error occured in Helper.java - request2int() : "+e.getMessage());
		}
		return result;
	}

	public static String checkNulls(Object value, String newVal) {
		try {
			if (value == null)
				return newVal;
			else {
				String str = String.valueOf(value).trim();
				if(str.length()<1)
					return newVal;
				else
					return str;	
			}
		} catch (Exception e) {
			System.out.println("An error occured in Helper.java - checkNulls() : "+e.getMessage());
		}
		return "";
	}
	public static String checkNullsBoardingCard(Object value, String newVal) {
		try {
			if (value == null)
				return newVal;
			else {
				String str = String.valueOf(value);
				if(str.length()<1)
					return newVal;
				else
					return str;	
			}
		} catch (Exception e) {
			System.out.println("An error occured in Helper.java - checkNulls() : "+e.getMessage());
		}
		return "";
	}
	
	public static int string2int(String s){
		try{
			return Integer.parseInt(s);
		}catch(Exception e){
			return 0;
		}
	}

	public static String request2String(HttpServletRequest request, String field) {
		String result = "";
		try {
			Object obj = request.getParameter(field);
			if(obj==null){
				if(obj==null){
					obj = request.getAttribute(field);
				}
			}
			if (obj != null) {
				result = checkNulls(obj, "");
				
				result = removeForbiddens(result);
			}
		} catch (Exception e) {
			System.out.println("An error occured in Helper.java - request2String() : "+e.getMessage());
		}
		return result;
	}

	public static String date2String(Date date) {
		if(date!=null){
			SimpleDateFormat sdf = new SimpleDateFormat();
			sdf.applyPattern("dd/MM/yyyy");
			return sdf.format(date);
		}else{
			return "";
		}
	}
	public static String date2String(Date date,String format) {
		if(date!=null){
			SimpleDateFormat sdf = new SimpleDateFormat();
			sdf.applyPattern(format);
			return sdf.format(date);
		}else{
			return "";
		}
	}
	
	public static Locale getLocale(String language){
		String firstLang 	= "tr";
		String secondLang 	= "TR";

		if(language==null || language.equals("")) 
			language	="TR";
		if (language!=null && language.equals("EN")){
			firstLang 	= "en";
			secondLang 	= "US";								
		}else if(language!=null && language.equals("IR")){
			language 	= "IR";
			firstLang 	= "ir";
			secondLang 	= "IR";		
		}else if(language!=null && language.equals("UA")){
			language 	= "UA";
			firstLang 	= "ua";
			secondLang 	= "UA";		
		}else if(language!=null && language.equals("RU")){
			language 	= "RU";
			firstLang 	= "ru";
			secondLang 	= "RU";		
		}
		else if(language!=null && language.equals("FR")){
			language 	= "FR";
			firstLang 	= "fr";
			secondLang 	= "FR";		
		}
		else if(language!=null && language.equals("DE")){
			language 	= "DE";
			firstLang 	= "de";
			secondLang 	= "DE";		
		}else if(language!=null && language.equals("NL")){
			language 	= "NL";
			firstLang 	= "nl";
			secondLang 	= "NL";		
		}
		else{
			language 	= "TR"; 
			firstLang 	= "tr";
			secondLang 	= "TR";
		}
		return new Locale(firstLang,secondLang);
	}
	public static String getTurkish(String str) { 
		int unicodeIntValue = 0; 
		String unicodeString = ""; 
		if(str == null) return null; 
	
		try {
			int length = str.length(); 
			for(int i=0; i<length;i++){ 
				unicodeIntValue = str.charAt(i);
	 
				if (unicodeIntValue == 304) { 
					unicodeString += "" + (char)221; 
					continue; 
				}
				if (unicodeIntValue == 305) { 
					unicodeString += "" + (char)253; 
					continue; 
				}
		
				if (unicodeIntValue == 351) { 
					unicodeString += "" + (char)254; 
					continue; 
				}

				if (unicodeIntValue == 350) { 
					unicodeString += "" + (char)222; 
					continue; 
				}

				if (unicodeIntValue == 286) { 
					unicodeString += "" + (char)208; 
					continue; 
				}

				if (unicodeIntValue == 287) { 
					unicodeString += "" + (char)240; 
					continue; 
				}

				unicodeString += (char) unicodeIntValue; 
			}
			return unicodeString; 
		 }catch (Exception e) { 
			 //Helper.errorLogger(Helper.class, e);
		 }
	  return unicodeString; 
	}
	public static String utfConvJetmilStrTr(String str) {
		int unicodeIntValue = 0;
		String unicodeString = "";
		if(str == null) return null;
		try {
			int length = str.length();
		 
			for(int i=0; i<length;i++) {

				unicodeIntValue = str.charAt(i);

				if (unicodeIntValue == 220) {
					unicodeString += "Ü";
					continue;
				}
				if (unicodeIntValue == 252) {
					unicodeString += "ü";
					continue;
				}
				if (unicodeIntValue == 214) {
					unicodeString += "Ö";
					continue;
				}
				if (unicodeIntValue == 246) {
					unicodeString += "ö";
					continue;
				}
				if (unicodeIntValue == 199) {
					unicodeString += "Ç";
					continue;
				}
				if (unicodeIntValue == 231) {
					unicodeString += "ç";
					continue;
				}

				if (unicodeIntValue == 221 ) {
					unicodeString += "İ";
					continue;
				}
				if (unicodeIntValue == 253) {
					unicodeString += "ı";
					continue;
				}
			
				if (unicodeIntValue == 254 || unicodeIntValue == 95) {
					unicodeString += "ş";
					continue;
				}
				if (unicodeIntValue == 222 || unicodeIntValue == 94) {
					unicodeString += "Ş";
					continue;
				}
				if (unicodeIntValue == 208) {
					unicodeString += "Ğ";
					continue;
				}
				if (unicodeIntValue == 240) {
					unicodeString += "ğ";
					continue;
				}
				unicodeString += (char) unicodeIntValue;
			}
			return unicodeString;
		} catch (Exception e) {
			//Helper.errorLogger(Helper.class, e);
			return "";
		}
	}
	public static String trWordConvertEn(String str){
		String retval="";
		int unicodeIntValue = 0;
		try {
			int length = str.length();
			 
			for(int i=0; i<length;i++) {

				unicodeIntValue = str.charAt(i);
				System.out.println("C :"+unicodeIntValue);
				if(unicodeIntValue==199){//Ç
					retval+="C";
					continue;
				}else
				if(unicodeIntValue==220){//Ü
					retval+="U";
					continue;
				}else
				if(unicodeIntValue==286){//Ğ
					retval+="G";
					continue;
				}else
				if(unicodeIntValue==350){//Ş
					retval+="S";
					continue;
				}else
				if(unicodeIntValue==304){//İ
					retval+="I";
					continue;
				}
				if(unicodeIntValue==214){//Ö
					retval+="O";
					continue;
				}else{		
				retval += (char) unicodeIntValue;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return retval;
	}
	
	public static String utfConvStrEng(String str) {
		int unicodeIntValue = 0;
		String unicodeString = "";
		String ucValue = "";
		if(str == null) return null;
		try {
			int length = str.length();
			
			for(int i=0; i<length;i++) {
				unicodeIntValue = str.charAt(i);
				if (unicodeIntValue==38){//& ile basliyorsa
					ucValue = ""+str.charAt(i)+str.charAt(i+1)+str.charAt(i+2)+str.charAt(i+3)+str.charAt(i+4);
					if (ucValue!=null && ucValue.equals("&#304")){unicodeString += "I";i = i+5;continue;}
					if (ucValue!=null && ucValue.equals("&#305")){unicodeString += "i";i = i+5;continue;}
					if (ucValue!=null && ucValue.equals("&#214")){unicodeString += "O";i = i+5;continue;}
					if (ucValue!=null && ucValue.equals("&#246")){unicodeString += "o";i = i+5;continue;}
					if (ucValue!=null && ucValue.equals("&#220")){unicodeString += "U";i = i+5;continue;}
					if (ucValue!=null && ucValue.equals("&#252")){unicodeString += "u";i = i+5;continue;}
					if (ucValue!=null && ucValue.equals("&#199")){unicodeString += "C";i = i+5;continue;}
					if (ucValue!=null && ucValue.equals("&#231")){unicodeString += "c";i = i+5;continue;}
					if (ucValue!=null && ucValue.equals("&#286")){unicodeString += "G";i = i+5;continue;}
					if (ucValue!=null && ucValue.equals("&#287")){unicodeString += "g";i = i+5;continue;}
					if (ucValue!=null && ucValue.equals("&#350")){unicodeString += "S";i = i+5;continue;}
					if (ucValue!=null && ucValue.equals("&#351")){unicodeString += "s";i = i+5;continue;}
				}

				if (unicodeIntValue == 221 || unicodeIntValue == 304) {
					unicodeString += "I";
					continue;
				}
				if (unicodeIntValue == 253 || unicodeIntValue == 305) {
					unicodeString += "i";
					continue;
				}
				if (unicodeIntValue == 254 || unicodeIntValue == 351) {
					unicodeString += "s";
					continue;
				}
				if (unicodeIntValue == 222 || unicodeIntValue == 350) {
					unicodeString += "S";
					continue;
				}
				if (unicodeIntValue == 208 || unicodeIntValue == 286) {
					unicodeString += "G";
					continue;
				}
				if (unicodeIntValue == 240 || unicodeIntValue == 287) {
					unicodeString += "g";
					continue;
				}
				if (unicodeIntValue == 231) {
					unicodeString += "c";
					continue;
				}
				if (unicodeIntValue == 199) {
					unicodeString += "C";
					continue;
				}
				if (unicodeIntValue == 252) {
					unicodeString += "u";
					continue;
				}
				if (unicodeIntValue == 220) {
					unicodeString += "U";
					continue;
				}
				if (unicodeIntValue == 246) {
					unicodeString += "o";
					continue;
				}
				if (unicodeIntValue == 214) {
					unicodeString += "O";
					continue;
				}
				//System.out.println(unicodeIntValue+" - "+(char) unicodeIntValue);

				unicodeString += (char) unicodeIntValue;
			}
			return unicodeString;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	public static String utfConvJetmilStrNew(String str) {
		int unicodeIntValue = 0;
		String unicodeString = "";
		if(str == null) return null;
		try {
			int length = str.length();
			
			for(int i=0; i<length;i++) {
				
				unicodeIntValue = str.charAt(i);			
				
				if (unicodeIntValue == 220) {
					unicodeString += "Ü";
					continue;
				}
				if (unicodeIntValue == 252) {
					unicodeString += "ü";
					continue;
				}
				if (unicodeIntValue == 214) {
					unicodeString += "Ö";
					continue;
				}
				if (unicodeIntValue == 246) {
					unicodeString += "ö";
					continue;
				}
				if (unicodeIntValue == 199) {
					unicodeString += "Ç";
					continue;
				}
				if (unicodeIntValue == 231) {
					unicodeString += "ç";
					continue;
				}

				if (unicodeIntValue == 221 || unicodeIntValue==237 ) {
					unicodeString += "İ";
					continue;
				}
				if (unicodeIntValue == 253 || unicodeIntValue==236) {
					unicodeString += "ı";
					continue;
				}
				
				if (unicodeIntValue == 254 || unicodeIntValue == 95) {
					unicodeString += "ş";
					continue;
				}
				if (unicodeIntValue == 222 || unicodeIntValue == 94) {
					unicodeString += "Ş";
					continue;
				}
				if (unicodeIntValue == 208) {
					unicodeString += "Ğ";
					continue;
				}
				if (unicodeIntValue == 240) {
					unicodeString += "ğ";
					continue;
				}
				//System.out.println(unicodeIntValue+":"+unicodeString);
				unicodeString += (char) unicodeIntValue;
			}
			return unicodeString;
		} catch (Exception e) {
			//Helper.errorLogger(Helper.class, e);
			//return Constants.EMPTY;
			return "";
		}
	}
	public static String utfConvStr(String str) {
		int unicodeIntValue = 0;
		String unicodeString = "";
		if(str == null) return null;
		try {
			int length = str.length();
			
			for(int i=0; i<length;i++) {
				unicodeIntValue = str.charAt(i);
				//System.out.println("unicodeIntValue:"+unicodeIntValue);
				if (unicodeIntValue == 220) {
					unicodeString += "Ü";
					continue;
				}
				if (unicodeIntValue == 252) {
					unicodeString += "ü";
					continue;
				}
				if (unicodeIntValue == 214) {
					unicodeString += "Ö";
					continue;
				}
				if (unicodeIntValue == 246) {
					unicodeString += "ö";
					continue;
				}
				if (unicodeIntValue == 199) {
					unicodeString += "Ç";
					continue;
				}
				if (unicodeIntValue == 231) {
					unicodeString += "ç";
					continue;
				}

				if (unicodeIntValue == 221) {
					unicodeString += "İ";
					continue;
				}
				if (unicodeIntValue == 253) {
					unicodeString += "ı";
					continue;
				}
				if (unicodeIntValue == 254) {
					unicodeString += "ş";
					continue;
				}
				if (unicodeIntValue == 222) {
					unicodeString += "Ş";
					continue;
				}
				if (unicodeIntValue == 208) {
					unicodeString += "Ğ";
					continue;
				}
				if (unicodeIntValue == 240) {
					unicodeString += "ğ";
					continue;
				}
				if (unicodeIntValue == 13) {
					unicodeString += "<br>";
					continue;
				}
				unicodeString += (char) unicodeIntValue;
			}

		
		} catch (Exception e) {
			System.out.println("utfConvStr HATA");	
		}
		return unicodeString;
	}	

	public static String getMessage(HttpSession session,String key) {
		try{
			bundle = (ResourceBundle)session.getAttribute("bundle");
			if(bundle==null){				
				bundle = ResourceBundle.getBundle("loadshet.resources.ADSDCS",Helper.getLocale("TR"));
				session.setAttribute("bundle",bundle);
			}
			return Helper.utfConvStr(bundle.getString(key));
		}catch (Exception e) {

		}
		return key;
	}
	
    public static String optionSelect(String val1,String val2){
    	String returnVal="";
    	try {
    		if(val1!=null && val1.trim().equals(val2.trim())){
        		returnVal=" selected ";
        	}
		} catch (Exception e) {
			System.out.println("An error occured in Helper.java - optionSelect() : "+e.getMessage());
		}
    	
    	return returnVal;
    }

	public static void loadSessionDefaultValues(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(144000); 
		session.setAttribute(Constants.USER_NAME,Constants.USER_NAME_VALUE);
		session.setAttribute(Constants.USER_AGENCY_NUMBER,Constants.USER_AGENCY_NUMBER_VALUE);
		session.removeAttribute("LOGFORMLOGGED");
		session.removeAttribute("pageprocesss");
		
		String lang = "TR";
		if(Helper.request2String(request,"lang")!=null && Helper.request2String(request,"lang").length()==2){
			lang = Helper.request2String(request,"lang");
		}else{
			if(session.getAttribute(Constants.SESSION_LANG)!=null){
				lang = (String)session.getAttribute(Constants.SESSION_LANG);
			}else{			
				lang = Helper.checkNulls(lang,"TR");			
			}
		}
		lang = lang.toUpperCase();
		if(lang!=null && !lang.equals("TR") && !lang.equals("EN") && !lang.equals("RU")&& !lang.equals("FR")&& !lang.equals("NL")&& !lang.equals("DE") &&!lang.equals("UA")){
			lang = "EN";
		}
		session.setAttribute(Constants.SESSION_LANG,lang);
		session.setAttribute(Constants.USER_LANG,lang);
		System.out.println("Lang: "+"adsdcs.resources.ADSDCS"+Helper.getLocale(lang));
		session.setAttribute("bundle",ResourceBundle.getBundle("loadshet.resources.ADSDCS",Helper.getLocale(lang)));
		
	}
    
	public static String getLanguageCode(HttpServletRequest request){
		String lang = "TR";
		try{
			if(request.getSession().getAttribute(Constants.SESSION_LANG)!=null){
				lang = (String)request.getSession().getAttribute(Constants.SESSION_LANG);
			}else{
				lang = Helper.checkNulls(lang,"TR");
				
			}
			lang = lang.toLowerCase() + "-" + lang.toUpperCase();
		}catch (Exception e) {
				
		}
		return lang;
	}

    public static String getToDate(){
    	String returnVal=Helper.date2String(new Date());
    	return returnVal;
    }
    public static String getToDate(int day){
    	Date today = new Date();               
        SimpleDateFormat formattedDate = new SimpleDateFormat("dd/MM/yyyy");            
        Calendar c = Calendar.getInstance();        
        c.add(Calendar.DATE, day);  // number of days to add      
        String tomorrow = (String)(formattedDate.format(c.getTime()));
    	return tomorrow;
    }
    public static int getToDateYear(){
    	SimpleDateFormat sdf = new SimpleDateFormat();
		sdf.applyPattern("yyyy");
		return Integer.parseInt( sdf.format(new Date()));
    }
    public static String getFlightTime(long time){
    	String returnTime = "00:00";
    	String hourStr = null;
    	String minStr = null;
    	long timeMod = 0;
    	try{
    		if(time>86400){
    			time = time - 86400;
    		}
    		timeMod = time % 3600;
    		
    		time = time - timeMod;
    		if((time/3600) < 10){
    			hourStr = "0"+(time/3600);
    		}else{
    			hourStr = ""+(time/3600);
    		}
    		if((timeMod/60)<10){
    			minStr = "0"+(timeMod/60);
    		}else{
    			minStr = ""+(timeMod/60);
    		}
    		/** once saati hesapla **/
    		
    		returnTime = hourStr+":"+minStr;
    		
    	}catch(Exception e){
    		returnTime = "00:00";
    	}
    	return returnTime;
    }
	public static String getTime(long time){
		try {

			int ltime = 0;
			String strtime = ""+time;
			ltime = strtime.length();
			
			long deptimehh = 0;
			String strdeptimehh = "";
			long deptimemm = 0;
			String strdeptimemm = "";
			
			if(ltime < 1){
				deptimehh = time/60;
				strdeptimehh = ""+deptimehh;
				deptimemm = (time - (deptimehh*60));
				strdeptimemm = ""+deptimemm;
			}else{
				deptimehh = time/3600;
				strdeptimehh = ""+deptimehh;
				deptimemm = (time - (deptimehh*3600))/60;
				strdeptimemm = ""+deptimemm;
			}
			
			if (strdeptimehh.length()==1){strdeptimehh = "0"+strdeptimehh;}
			if (strdeptimemm.length()==1){strdeptimemm = "0"+strdeptimemm;}

			return strdeptimehh+":"+strdeptimemm;

		} catch (Exception e) {
			return "0";
		}
	}
	
	public static double string2Double(String str, double retVal){
		double dVal = retVal;
		try{
			dVal = Double.parseDouble(str);
			
		}catch(Exception e){
			dVal = retVal;
			
		}
		return dVal;
	} 
	
	public static long string2Long(String str, long retVal){
		long dVal = retVal;
		try{
			dVal = Long.parseLong(str);
			
		}catch(Exception e){
			dVal = retVal;
			
		}
		return dVal;
	} 
	
	public static String dateFormatConvert(String requestDateStr, String requestDateFormat, String responseDateFormat,String language){
		
		// requestDateFormat: yyyy-MM-dd'T'hh:mm:ss (TAIS format)
		String returnDateStr = "";
		try{
			if(requestDateStr==null || requestDateStr.equals("") || requestDateStr.equals("null")){
				return "";
			}
			String[] monthArr = new String[12];
			String[] monthArrMon = new String[12];
			String[] dayArr = new String[7];
			
			if (language!=null && language.equals("EN")){
				
				monthArrMon[0] = "JAN";
				monthArrMon[1] = "FEB";
				monthArrMon[2] = "MAR";
				monthArrMon[3] = "APR";
				monthArrMon[4] = "MAY";
				monthArrMon[5] = "JUN";
				monthArrMon[6] = "JUL";
				monthArrMon[7] = "AGU";
				monthArrMon[8] = "SEP";
				monthArrMon[9] = "OCT";
				monthArrMon[10] = "NOV";
				monthArrMon[11] = "DEC";
			
				monthArr[0] = "January";
				monthArr[1] = "February";
				monthArr[2] = "March";
				monthArr[3] = "April";
				monthArr[4] = "May";
				monthArr[5] = "June";
				monthArr[6] = "July";
				monthArr[7] = "August";
				monthArr[8] = "September";
				monthArr[9] = "October";
				monthArr[10] = "November";
				monthArr[11] = "December";
			
				dayArr[0] = "Sunday";
				dayArr[1] = "Monday";
				dayArr[2] = "Tuesday";
				dayArr[3] = "Wednesday";
				dayArr[4] = "Thursday";
				dayArr[5] = "Friday";
				dayArr[6] = "Saturday";				
			}else{

				monthArrMon[0] = "JAN";
				monthArrMon[1] = "FEB";
				monthArrMon[2] = "MAR";
				monthArrMon[3] = "APR";
				monthArrMon[4] = "MAY";
				monthArrMon[5] = "JUN";
				monthArrMon[6] = "JUL";
				monthArrMon[7] = "AGU";
				monthArrMon[8] = "SEP";
				monthArrMon[9] = "OCT";
				monthArrMon[10] = "NOV";
				monthArrMon[11] = "DEC";
				
				monthArr[0] = "Ocak";
				monthArr[1] = "Şubat";
				monthArr[2] = "Mart";
				monthArr[3] = "Nisan";
				monthArr[4] = "Mayıs";
				monthArr[5] = "Haziran";
				monthArr[6] = "Temmuz";
				monthArr[7] = "Ağustos";
				monthArr[8] = "Eylül";
				monthArr[9] = "Ekim";
				monthArr[10] = "Kasım";
				monthArr[11] = "Aralık";
				
				dayArr[0] = "Pazar";
				dayArr[1] = "Pazartesi";
				dayArr[2] = "Salı";
				dayArr[3] = "Çarşamba";
				dayArr[4] = "Perşembe";
				dayArr[5] = "Cuma";
				dayArr[6] = "Cumartesi";
			}
			 
			
			if(requestDateStr.indexOf(".0Z")>-1){
				requestDateStr = requestDateStr.substring(0,requestDateStr.indexOf(".0Z"));
				//System.out.println(requestDateStr);
			}			

			//System.out.println("requestDateStr:"+requestDateStr);
			String requestDay = null;
			String requestMonth = null;
			String requestYear = null;

			Calendar cal = null;
			Date thisDate = (new SimpleDateFormat(requestDateFormat,Locale.ENGLISH)).parse(requestDateStr);
			if(cal==null) cal = new GregorianCalendar();
			cal.setTime(thisDate);

			int monthInt = cal.get(Calendar.MONTH) + 1;
			int dayInt = cal.get(Calendar.DAY_OF_MONTH);
			int weekDayInt = cal.get(Calendar.DAY_OF_WEEK);
			int yearInt = cal.get(Calendar.YEAR);
			int hourInt = cal.get(Calendar.HOUR_OF_DAY);
			int minuteInt = cal.get(Calendar.MINUTE);
			int secondInt = cal.get(Calendar.SECOND);

			String monthStr = ""+monthInt; 
			String dayStr = ""+dayInt;
			String hourStr = ""+hourInt;
			String minuteStr = ""+minuteInt;
			String secondStr = ""+secondInt;
			
			if(monthStr.length()==1) monthStr = "0"+monthStr;
			if(dayStr.length()==1) dayStr = "0"+dayStr;

			if(hourStr.length()==1) hourStr = "0"+hourStr;
			if(minuteStr.length()==1) minuteStr = "0"+minuteStr;
			if(secondStr.length()==1) secondStr = "0"+secondStr;
			
			//System.out.println("monthStr:"+monthStr);


			if(responseDateFormat.equals("dd/mm/yyyy")){
				returnDateStr = dayStr + "/" + monthStr + "/" + yearInt;
			}else if(responseDateFormat.equals("yyyymmdd")){
				returnDateStr = yearInt + monthStr + dayStr;
			}else if(responseDateFormat.equals("dd-mm-yyyy")){
				returnDateStr = dayStr + "-" + monthStr + "-" + yearInt;
			}else if(responseDateFormat.equals("yyyy-mm-dd")){
				returnDateStr = yearInt + "-" + monthStr + "-" + dayStr;
			}else if(responseDateFormat.equals("dd.mm.yyyy")){
				returnDateStr = dayStr + "." + monthStr + "." + yearInt;
			}else if(responseDateFormat.equals("dd MONTH yyyy DAY")){
				returnDateStr = dayStr + " " + monthArr[monthInt-1] + " " + yearInt +" "+dayArr[weekDayInt-1];
			}else if(responseDateFormat.equals("dd MONTH yyyy")){
				returnDateStr = dayStr + " " + monthArr[monthInt-1] + " " + yearInt;
			}else if(responseDateFormat.equals("dd MONTH yy")){
				returnDateStr = dayStr + " " + monthArr[monthInt-1] + " " + ((yearInt+"").substring(2,4));
			}else if(responseDateFormat.equals("dd-mm-yyyy hh24:mi")){
				returnDateStr = dayStr + "-" + monthStr + "-" + yearInt +" "+hourStr+":"+minuteStr;
			}else if(responseDateFormat.equals("yyyy-mm-dd hh24:mi:ss")){
				returnDateStr = yearInt + "-" + monthStr + "-" + dayStr+" "+hourStr+":"+minuteStr+":"+secondStr;
			}else if(responseDateFormat.equals("yyyy-MM-dd'T'hh:mm:ss.0Z")){
				returnDateStr = yearInt + "-" + monthStr + "-" + dayStr+"T"+hourStr+":"+minuteStr+":"+secondStr+".0Z";
			}else if(responseDateFormat.equals("yyyy-mm-dd hh24:mi")){
				returnDateStr = yearInt + "-" + monthStr + "-" + dayStr+" "+hourStr+":"+minuteStr;
			}else if(responseDateFormat.equals("dd.mm.yyyy hh24:mi")){
				returnDateStr = dayStr + "." + monthStr + "." + yearInt+" "+hourStr+":"+minuteStr;
			}else if(responseDateFormat.equals("dd MONTH yyyy DAY hh24:mi")){
				returnDateStr = dayStr + " " + monthArr[monthInt-1] + " " + yearInt +" "+dayArr[weekDayInt-1]+" "+hourStr+":"+minuteStr;
			}else if(responseDateFormat.equals("dd MONTH yyyy hh24:mi")){
				returnDateStr = dayStr + " " + monthArr[monthInt-1] + " " + yearInt+" "+hourStr+":"+minuteStr;
			}else if(responseDateFormat.equals("dd MONTH yy hh24:mi")){
				returnDateStr = dayStr + " " + monthArr[monthInt-1] + " " + ((yearInt+"").substring(2,4))+" "+hourStr+":"+minuteStr;
			}else if(responseDateFormat.equals("ddMONyy")){
				returnDateStr = dayStr + monthArrMon[monthInt-1] + (yearInt+"").substring(2,4);
			}

		
		}catch(Exception e){
			System.out.println("Helper.java - dateFormatConvert() : "+e.getMessage());
		}
		return returnDateStr;
	
	}
	
	public static String dateFormatConverter(String requestDateStr, String requestDateFormat, String responseDateFormat){
        
        // requestDateFormat: yyyy-MM-dd'T'hh:mm:ss (TAIS format)
        String returnDateStr = "";
        try{
               String[] monthArr = new String[12];
               String[] monthArrMon = new String[12];
               String[] dayArr = new String[7];
               
               
               
               
               
               if(requestDateStr.indexOf(".0Z")>-1){
                      requestDateStr = requestDateStr.substring(0,requestDateStr.indexOf(".0Z"));
               }                   


               if(requestDateFormat!=null && requestDateFormat.equals("dd/mm/yyyy")){
                      requestDateFormat = "dd/MM/yyyy";
               }
               
               Calendar cal = null;
               Date thisDate = (new SimpleDateFormat(requestDateFormat,Locale.ENGLISH)).parse(requestDateStr);
               if(cal==null) cal = new GregorianCalendar();
               cal.setTime(thisDate);
               
               int monthInt = cal.get(Calendar.MONTH) + 1;
               int dayInt          = cal.get(Calendar.DAY_OF_MONTH);
               int weekDayInt      = cal.get(Calendar.DAY_OF_WEEK);
               int yearInt = cal.get(Calendar.YEAR);
               int hourInt = cal.get(Calendar.HOUR_OF_DAY);
               int minuteInt       = cal.get(Calendar.MINUTE);
               int secondInt       = cal.get(Calendar.SECOND);

               String monthStr     = ""+monthInt; 
               String dayStr              = ""+dayInt;
               String hourStr             = ""+hourInt;
               String minuteStr    = ""+minuteInt;
               String secondStr    = ""+secondInt;
               
               if(monthStr.length()==1) monthStr = "0"+monthStr;
               if(dayStr.length()==1) dayStr = "0"+dayStr;

               if(hourStr.length()==1) hourStr = "0"+hourStr;
               if(minuteStr.length()==1) minuteStr = "0"+minuteStr;
               if(secondStr.length()==1) secondStr = "0"+secondStr;
               
               if(responseDateFormat.equals("dd/mm/yyyy")){
                      returnDateStr = dayStr + "/" + monthStr + "/" + yearInt;
               }else if(responseDateFormat.equals("yyyymmdd")){
                      returnDateStr = yearInt + monthStr + dayStr;
               }else if(responseDateFormat.equals("dd-mm-yyyy")){
                      returnDateStr = dayStr + "-" + monthStr + "-" + yearInt;
               }else if(responseDateFormat.equals("yyyy-mm-dd")){
                      returnDateStr = yearInt + "-" + monthStr + "-" + dayStr;
               }else if(responseDateFormat.equals("dd.mm.yyyy")){
                      returnDateStr = dayStr + "." + monthStr + "." + yearInt;
               }else if(responseDateFormat.equals("dd MONTH yyyy DAY")){
                      returnDateStr = dayStr + " " + monthArr[monthInt-1] + " " + yearInt +" "+dayArr[weekDayInt-1];
               }else if(responseDateFormat.equals("dd MONTH yyyy")){
                      returnDateStr = dayStr + " " + monthArr[monthInt-1] + " " + yearInt;
               }else if(responseDateFormat.equals("dd MONTH yy")){
                      returnDateStr = dayStr + " " + monthArr[monthInt-1] + " " + ((yearInt+"").substring(2,4));
               }else if(responseDateFormat.equals("dd-mm-yyyy hh24:mi")){
                      returnDateStr = dayStr + "-" + monthStr + "-" + yearInt +" "+hourStr+":"+minuteStr;
               }else if(responseDateFormat.equals("yyyy-mm-dd hh24:mi:ss")){
                      returnDateStr = yearInt + "-" + monthStr + "-" + dayStr+" "+hourStr+":"+minuteStr+":"+secondStr;
               }else if(responseDateFormat.equals("yyyy-MM-dd'T'hh:mm:ss.0Z")){
                      returnDateStr = yearInt + "-" + monthStr + "-" + dayStr+"T"+hourStr+":"+minuteStr+":"+secondStr+".0Z";
               }else if(responseDateFormat.equals("yyyy-mm-dd hh24:mi")){
                      returnDateStr = yearInt + "-" + monthStr + "-" + dayStr+" "+hourStr+":"+minuteStr;
               }else if(responseDateFormat.equals("dd.mm.yyyy hh24:mi")){
                      returnDateStr = dayStr + "." + monthStr + "." + yearInt+" "+hourStr+":"+minuteStr;
               }else if(responseDateFormat.equals("dd MONTH yyyy DAY hh24:mi")){
                      returnDateStr = dayStr + " " + monthArr[monthInt-1] + " " + yearInt +" "+dayArr[weekDayInt-1]+" "+hourStr+":"+minuteStr;
               }else if(responseDateFormat.equals("dd MONTH yyyy hh24:mi")){
                      returnDateStr = dayStr + " " + monthArr[monthInt-1] + " " + yearInt+" "+hourStr+":"+minuteStr;
               }else if(responseDateFormat.equals("dd MONTH yy hh24:mi")){
                      returnDateStr = dayStr + " " + monthArr[monthInt-1] + " " + ((yearInt+"").substring(2,4))+" "+hourStr+":"+minuteStr;
               }else if(responseDateFormat.equals("ddMONyy")){
                      returnDateStr = dayStr + monthArrMon[monthInt-1] + (yearInt+"").substring(2,4);
               }else if(responseDateFormat.equals("dd.mm.yyyy DAY")){
                      returnDateStr =  dayStr + "." + monthStr + "." + yearInt +" "+dayArr[weekDayInt-1];
               }else if(responseDateFormat.equals("yyyy/mm/dd hh24:mi:ss")){
                      returnDateStr = yearInt + "/" + monthStr + "/" + dayStr+" "+hourStr+":"+minuteStr+":"+secondStr;
               }else if(responseDateFormat.equals("dd/mm/yyyy hh24:mi:ss")){
                      returnDateStr = dayStr+ "/" + monthStr + "/" + yearInt +" "+hourStr+":"+minuteStr+":"+secondStr;
               }else if(responseDateFormat.equals("dd MONTH")){
                      returnDateStr = dayStr + " " + monthArr[monthInt-1];
               }else if(responseDateFormat.equalsIgnoreCase("yymmddhh24miss")){
                      returnDateStr = yearInt + monthStr + dayStr+hourStr+minuteStr+secondStr;
               }

        
        }catch(Exception e){
               Helper.errorLogger(Helper.class, e,"[requestDateStr]:" + requestDateStr + " [requestDateFormat]:" + requestDateFormat + " [responseDateFormat]:"+ responseDateFormat);
        }
        return returnDateStr;
  
  }

	
	public static String selected(String str1,String str2){
		String returnVal="";		
		if(str1!=null && str2!=null &&  str1.trim().equals(str2.trim())){
			returnVal=" selected='selected' ";
		}
		return returnVal;
	}
	public static String BrowserVersion(HttpServletRequest request){
		String userAgent=request.getHeader("user-agent");
		String substring	= null;
		String browserName	= null;
		int indFirefox=userAgent.indexOf("Firefox");
		String result="";
		double browserVersion = 0; 
		if(userAgent.indexOf("MSIE")>-1){
			substring=userAgent.substring(userAgent.indexOf("MSIE")).split(";")[0];
		    browserName=substring.split(" ")[0];
		    String browserVer=substring.split(" ")[1];
		    browserVersion = Double.valueOf(browserVer).doubleValue();
		    result=browserName+":"+browserVersion;
		}else if(indFirefox>-1){
			result=userAgent.substring(indFirefox,userAgent.length());
		}
		return result;
	}
	
	public static double compareDates(Date firstDate, Date secondDate){
		if(firstDate.getTime()>secondDate.getTime()){
			return Double.parseDouble("-1");
		}
		return Double.parseDouble("0");
		
	}

	public static void log2File(String fileName,String content,boolean isAppend){
		try{
			fileName = fileName + ".txt";
			FileWriter fw = new FileWriter(new File("/arsiv/eticket/tmp/"+fileName),isAppend);
			fw.write(content.trim());
			fw.close();
		}catch(Exception e){
			System.out.println("Helper.java - log2File() : "+e.getMessage());
		}
	}
	public static void errorLogger(Class className,Exception e){
		ErrorHandler eh = new ErrorHandler(className,e);
		eh.setLogtype("error");
		eh.setServerName("SRV1");
		eh.logwrite();		
	}
	public static void errorLogger(Class className,Exception e,String extraInfo){
		ErrorHandler eh = new ErrorHandler(className,e);
		eh.setLogtype("error");
		eh.setServerName("SRV1");
		eh.setExtraInfo(extraInfo);
		eh.logwrite();		
	}
	public static List<String> parsingString(String data,String x){
		List<String> retData=new ArrayList<String>();
		try {
			String[] flight=null;
			StringTokenizer flightsCount=new StringTokenizer(data,x);
			while (flightsCount.hasMoreTokens()) {
				retData.add(flightsCount.nextToken().trim());
				
			}
		} catch (Exception e) {
			System.out.println("Error Helper parsingString : "+ e.getMessage());
		}
		return retData;
	}
	
	public static Date dateAddMinute(Date date, int minute) {
		Date newdate = date;
		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			cal.add(Calendar.MINUTE, minute);
			newdate = cal.getTime();

		} catch (Exception e) {
			Helper.errorLogger(Helper.class, e);
		}
		return newdate;
	}
	 public static String getHash(String txt, String hashType) {
	    try {
	            MessageDigest md = MessageDigest.getInstance(hashType);
	            byte[] array = md.digest(txt.getBytes());
	            StringBuffer sb = new StringBuffer();
	            for (int i = 0; i < array.length; ++i) {
	                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
	            }
	            return sb.toString();
	        } catch (java.security.NoSuchAlgorithmException e) {
	            errorLogger(Helper.class, e);
	        }
	        return null;
    }	
	 public static long getSqlLngResult(Connection conn,String sqlStr){
			long resultStr = 0;
			try {
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sqlStr);
				while(rs.next()){
					resultStr = rs.getLong("result");
				}
				rs.close();
				st.close();			
			
			} catch (Exception e) {
				Helper.errorLogger(Helper.class, e);
			}
			return resultStr;
		}
	 
	 public static String generateMD5(String password){
	    	StringBuffer sb = new StringBuffer();
	    	try{ 
		        MessageDigest md = MessageDigest.getInstance("MD5");
		        md.update(password.getBytes());		 
		        byte byteData[] = md.digest();		 
		        //convert the byte to hex format method 1	        
		        for (int i = 0; i < byteData.length; i++) {
		        	sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		        }
	    	}catch (Exception e) {
	    		Helper.errorLogger(Helper.class, e);
			}
	        return sb.toString();
	    }
	 
		public static int getRandomNumberInRange(int min, int max) {

			if (min >= max) {
				throw new IllegalArgumentException("max must be greater than min");
			}

			Random r = new Random();
			return r.nextInt((max - min) + 1) + min;
		}
		public static void clearAllSession(HttpSession session){
			Enumeration enumeration = session.getAttributeNames();
			while (enumeration.hasMoreElements()) {
				String visit = (String) enumeration.nextElement();
				if(visit.equals("language")==false && visit.equals("bundle")==false)
					session.removeAttribute(visit);				
			}
		}
		

	    
	    public static boolean validateString(String str) {
			if (str.indexOf('\'') > 0)
				return false;
			if (str.indexOf('\"') > 0)
				return false;
			if (str.indexOf('`') > 0)
				return false;
			if (str.indexOf(']') > 0)
				return false;
			if (str.indexOf('[') > 0)
				return false;
			if (str.indexOf('*') > 0)
				return false;
			if (str.indexOf('-') > 0)
				return false;
			if (str.indexOf('.') > 0)
				return false;
			if (str.indexOf(',') > 0)
				return false;
			if (str.indexOf(';') > 0)
				return false;
			if (str.indexOf('?') > 0)
				return false;
			if (str.indexOf('&') > 0)
				return false;
			if (str.indexOf('!') > 0)
				return false;
			if (str.indexOf('#') > 0)
				return false;
			if (str.indexOf('~') > 0)
				return false;
			if (str.indexOf('~') > 0)
				return false;
			return true;
		}
	    public static String fileExtention(String fileName){
			String extension = "";
			int i = fileName.lastIndexOf('.');
			int p = Math.max(fileName.lastIndexOf('/'), fileName.lastIndexOf('\\'));
			
			if (i > p) {
			    extension = fileName.substring(i+1);
			}
			return extension;
	     }
	    public static String removeChar(String text, char removeChar){
			
			String returnString = "";
			int count = text.length();
			for(int i=0;i<count;i++){
				if(text.charAt(i) == removeChar) continue;
				
				returnString += (char) text.charAt(i);
			}
			
			return returnString;
			
		}
	    public static String getServerIPAddress(){
			String ipAddress = "127.0.0.1";
			try{
				InetAddress ip;
				ip = InetAddress.getLocalHost();
				ipAddress = ip.getHostAddress();
				ip = null;
			}catch(Exception e){
				Helper.errorLogger(Helper.class, e);
			}
			
			return ipAddress;
		}
	    public static int randInt(int min, int max) {
	        Random rand = new Random();
	        int randomNum = rand.nextInt((max - min) + 1) + min;
	        return randomNum;
	    }
	    public static boolean checkAjaxRequest(HttpServletRequest request){
	    	boolean retState=false;
	    	try{
	    		if(request.getSession()!=null && request.getSession().getAttribute(Constants.AJAX_TOKEN)!=null && request2String(request, "_token").equals(request.getSession().getAttribute(Constants.AJAX_TOKEN))
	    		){
	    			retState=true;
	    			
	    		}

			}catch(Exception e){
				Helper.errorLogger(Helper.class, e);
			}
	    	System.out.println("User :"+retState);
	    	return retState;
	    }
	    public static void sysConsoleOut(String data){
	    	try {
				if(Constants.SYS_CONSOLE_OUT){
					System.out.println(data);
				}
			} catch (Exception e) {
				Helper.errorLogger(Helper.class, e);
			}
	    }
	  public static String checkUserNameCharacter(String data){
		  
		  try {
			  data=data.trim();
			  data=data.replace("?", "");
			  data=data.replace("Ö", "O");
			  data=data.replace("Ü", "U");
			  data=data.replace("Ş", "S");
			  data=data.replace("İ", "I");
			  data=data.replace("Ç", "C");
			  data=data.replace("Ğ", "G");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		  return data;
	  }
	  public static String getCurrentDateTimeMS() {
	        Date dNow = new Date();
	        SimpleDateFormat ft = new SimpleDateFormat("yyMMddhhmmssMs");
	        String datetime = ft.format(dNow);
	        return datetime;
	    }
	  public static String checkUserSession(int userId,String sessionId){
			
			Connection conn = ConnectionPool.getConnection();
			String retval="NOK";
			int totalSessionTimeout=0;
			int totalOtherSession=0;
			try{
				String sqlString = "begin ADSDCS.dcs_pkg_03.checkUsersession("+userId+",'"+sessionId+"',?,?) ;end;";
				//System.out.println("Update User session: "+sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, OracleTypes.NUMBER);
				sqlStmt.registerOutParameter(2, OracleTypes.NUMBER);
				sqlStmt.execute();
				totalOtherSession  =sqlStmt.getInt(1); 
				totalSessionTimeout  =sqlStmt.getInt(2); 
				
				
				if(totalOtherSession<1)
					retval="OTHER";
				if(totalSessionTimeout>0)
					retval="TIMEOUT";
					
				sqlStmt.close();	
			
			}catch(Exception e){
				Helper.errorLogger(Helper.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}
			return retval;
		}
	  public static void upUserSession(int userId,String sessionId){
			
			Connection conn = ConnectionPool.getConnection();
			try{
				String sqlString = "begin dcs_pkg_03.upUserSessionActivite('"+userId+"','"+sessionId+"'); end;";
				//System.out.println("Update User session: "+sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.execute();
				sqlStmt.close();			
			}catch(Exception e){
				Helper.errorLogger(Helper.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}
		}
	  
	 
	  public static String removeForbiddens(String s){
		  
		  StringBuffer sb = new StringBuffer();
		  byte[] stringArray = s.getBytes();
		  
		  for(int i=0;i<stringArray.length;i++){
			  
			  if((stringArray[i] >= 45 && stringArray[i] <= 57) || (stringArray[i] >= 65 && stringArray[i] <= 90) || (stringArray[i] >= 97 && stringArray[i] <= 122) || stringArray[i] == 43){
				  sb.append((char) stringArray[i] );
			  }
		  }
		  
		  return sb.toString();
		  
		  
	  }
	  
}