/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author Siddharth
 */
public class conn {
    public static Connection con;
    public static Connection getCon(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/iwt?zeroDateTimeBehavior=convertToNull","root","");
            System.out.println("Connected");
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Not Connected");
        }
        return con;
    }
}
