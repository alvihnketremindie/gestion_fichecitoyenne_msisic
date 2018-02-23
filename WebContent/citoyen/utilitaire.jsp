<%@ page import="java.util.*"%>
 <%!
public  java.util.Calendar toCalendar(java.util.Date date){ 
	 java.util.Calendar cal = java.util.Calendar.getInstance();
  cal.setTime(date);
  return cal;
}
 
 
 String nomPropre (String nom) {
	  return nom.toUpperCase();
   }
 
String dateFrancais( java.util.Date madate){
	 java.util.Calendar laDate = toCalendar(madate) ;
	return  laDate.get(Calendar.DAY_OF_MONTH) + " / " + laDate.get(Calendar.MONTH)+1 + " / " + laDate.get(Calendar.YEAR);
 }
  %>