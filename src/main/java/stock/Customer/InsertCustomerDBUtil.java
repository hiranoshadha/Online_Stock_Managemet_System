package stock.Customer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import stock.DBConnect.DBConnect;

public class InsertCustomerDBUtil {
	//for database connection purpose
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet result = null;
		
		//get Cancelation Details from Servlet
		public static boolean InsertCustomer(String cName,String cUsername,String cEmail,String cAddress,String cDateofbirth,String cPhone,String cPostalcode,String cGender,String cPassword) {

			boolean isSuccess = false;
			
		
			try {

	                con = DBConnect.getConnection();
	                stmt = con.createStatement(); 
	                
	                //Insert Cancelation Request Details to Table
					String sql = "INSERT INTO customer VALUES(0,'"+cName+"','"+cUsername+"','"+cEmail+"','"+cAddress+"','"+cDateofbirth+"','"+cPhone+"','"+cPostalcode+"','"+cGender+"','"+cPassword+"')";
					int result = stmt.executeUpdate(sql);
					
					if(result > 0) {
						isSuccess = true;
					}else {
						isSuccess = false;
					}
						
						
					} catch(Exception e) {
						
						e.printStackTrace();
						
					}		
			//return to Servlet that insertion is success or not 
			return isSuccess;
		
		}
}
