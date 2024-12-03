package stock.Payment;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import stock.DBConnect.*;
import stock.Payment.CardDetails;

public class GetCardDetailsDBUtil {
	
	//for database connection purpose
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet result = null;
	
	//get Reservation Id and Name for Check reservation from table
	public static List<CardDetails> validate(String ResID){
		
		ArrayList<CardDetails> res = new ArrayList<>();
		

		//validate and return all Reservation table details
		try {
			
			con  = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM carddetails WHERE id = '"+ResID+"'";
			result = stmt.executeQuery(sql);
			
			if(result.next()) {
				int cId = result.getInt(1);
				String cName = result.getString(2);
				String cHname = result.getString(3);
				String cNumber = result.getString(4);
				String vThru = result.getString(5);
				String cv = result.getString(6);
				
				CardDetails re = new CardDetails(cId, cName,cHname, cNumber, vThru, cv);
				res.add(re);
				
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
			
		}
		//Return all Details related to which inputted reservation id & name
		return res;
		
	}

}
