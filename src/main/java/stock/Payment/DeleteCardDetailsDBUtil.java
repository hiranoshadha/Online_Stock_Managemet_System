package stock.Payment;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import stock.DBConnect.*;

public class DeleteCardDetailsDBUtil {
	
	
	private static boolean isDeleted;
	
	//for database connection purpose
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet result = null;

	//get Reservation Id of which want to delete 
	public static boolean DeleteCardDetails(String cId) {
		
		
        try {
			
			   con  = DBConnect.getConnection();
			   stmt = con.createStatement();
			   //find row and delete
			   String sql = "DELETE FROM carddetails WHERE id = '"+cId+"'";
			   int res = stmt.executeUpdate(sql);
		
               if(res > 0) {
				
                 	isDeleted = true;
				
			   }else {
				
				    isDeleted = false;
		       }
		
        }catch(Exception e) {
    	
    	e.printStackTrace();
    	
        }
      //return to Servlet that Deletion is success or not 
    return isDeleted;
	}
	
}
