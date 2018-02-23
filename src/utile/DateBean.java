package utile;
import java.util.*;
public class DateBean {    

	GregorianCalendar laDate = new GregorianCalendar(); 

	public String getDate() {                       
		return " " + laDate.get(Calendar.DAY_OF_MONTH) 
		+ " / " +   (laDate.get(Calendar.MONTH)+1) 
		+ " / " + laDate.get(Calendar.YEAR);            
	}             

	public int getJour() {                       
		return   laDate.get(Calendar.DAY_OF_MONTH);     
	}   
	public int getMois() {                       
		return   laDate.get(Calendar.MONTH)+1;     
	}  
	public int getAnnee() {                       
		return   laDate.get(Calendar.YEAR);     
	}  
	public  static  Date leVendredi ( int semaine, int anne) {
		Date madate;
		int jouravant, semaineNC, jours; 
		Calendar calendar = new java.util.GregorianCalendar(); 
		calendar.set(Calendar.YEAR, anne);
		calendar.set(Calendar.MONTH,0);
		calendar.set(Calendar.DAY_OF_MONTH,1	);
		calendar.setFirstDayOfWeek(2);
		madate = calendar.getTime();
		int day = calendar.get(Calendar.DAY_OF_WEEK); 
		jouravant =(9-day) % 7;
		if ( (day==6) || (day==7) || (day==1) ) semaineNC = 1;
		else  semaineNC =2;
		jours =  (semaine-semaineNC) *7 + jouravant +4  ;  
		calendar.set(Calendar.YEAR, anne);
		calendar.set(Calendar.MONTH,0);
		calendar.set(Calendar.DAY_OF_MONTH,1);
		calendar.add(Calendar.DAY_OF_YEAR, jours);
		madate = calendar.getTime();
		return madate;  
	}

	public  static  Date leLundi ( int semaine, int anne) {
		System.out.println(semaine + "   "+ anne);
		Date madate;
		int jouravant, semaineNC, jours; 
		Calendar calendar = new java.util.GregorianCalendar(); 
		calendar.set(Calendar.YEAR, anne);
		calendar.set(Calendar.MONTH,0);
		calendar.set(Calendar.DAY_OF_MONTH,1	);
		calendar.setFirstDayOfWeek(2);
		madate = calendar.getTime();
		int day = calendar.get(Calendar.DAY_OF_WEEK); 
		jouravant =(9-day) % 7;
		if ( (day==6) || (day==7) || (day==1) ) semaineNC = 1;
		else  semaineNC =2;
		jours =  (semaine-semaineNC) *7 + jouravant  ;  
		calendar.set(Calendar.YEAR, anne);
		calendar.set(Calendar.MONTH,0);
		calendar.set(Calendar.DAY_OF_MONTH,1);
		calendar.add(Calendar.DAY_OF_YEAR, jours);
		madate = calendar.getTime();
		return madate;
	}

}