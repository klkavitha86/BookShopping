/*  Name :Kavitha Venkatesan
   Class Account :jadrn054
   Semester: Spring 2017
   Project#2
 */
package com.shopping;

import java.sql.*;
import java.util.*;

public class DBHelper implements java.io.Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static String connectionURL = "jdbc:mysql://localhost:3306/book_shopping?user=root&password=Kavitha14";               
    private static Connection connection = null;
    private static Statement statement = null;
     private static Statement statementUpdate = null;
    private static ResultSet resultSet = null;
    
    public DBHelper() {}    
    
    public static Vector<String []> runQuery(String s) {

        String answer = "";
        Vector<String []> answerVector = null;
		
	try {
	//Class.forName("com.mysql.jdbc.Driver").newInstance();
	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL);
	statement = connection.createStatement();
	resultSet = statement.executeQuery(s);        
        ResultSetMetaData rsmd = resultSet.getMetaData();
        answerVector = new Vector<String []>();
	while(resultSet.next()) {
            String [] row = new String[rsmd.getColumnCount()];
            for(int i=0; i < rsmd.getColumnCount(); i++)
                row[i] = resultSet.getString(i+1);
            answerVector.add(row);       
		}
       
	}
	catch(Exception e) {
	    e.printStackTrace();
	}
        //////////////////////////////////////////////////////////////////////////            
        // The finally clause always runs, and closes resources if open.
        // DO NOT OMIT THIS!!!!!!
        finally {
            try {
                if(resultSet != null)
                    resultSet.close();
                if(statement != null)
                    statement.close();
                if(connection != null)                   
            	    connection.close();
                }
            catch(SQLException e) {
                answer += e;
                }
        //////////////////////////////////////////////////////////////////////////
        }
        return answerVector;
       
    }    
    
    public static String loadQuery(String s) {
        String answer = "";
       // Vector<String []> answerVector = null;
		
	try {
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL);
	statement = connection.createStatement();
	resultSet = statement.executeQuery(s);        
      
        while(resultSet.next()) {
           answer = answer.concat(String.valueOf(resultSet.getInt(1))).concat("=").concat(resultSet.getString(2)).concat("|");
		}
        
	}
	catch(Exception e) {
	    e.printStackTrace();
	}
        //////////////////////////////////////////////////////////////////////////            
        // The finally clause always runs, and closes resources if open.
        // DO NOT OMIT THIS!!!!!!
        finally {
            try {
                if(resultSet != null)
                    resultSet.close();
                if(statement != null)
                    statement.close();
                if(connection != null)                   
            	    connection.close();
                }
            catch(SQLException e) {
                answer += e;
                }
        //////////////////////////////////////////////////////////////////////////
        }
        //return answerVector;
        return answer;
    }
   public static int executeCommand(String s) {
   		int howMany = 0;
		try {	
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(connectionURL);
		statement = connection.createStatement();
		howMany = statement.executeUpdate(s);
		}
		catch(Exception e) {}
        	finally {
            	try {
                	if(statement != null)
                    	statement.close();
                	if(connection != null)                   
            	    	connection.close();
                	}
            	catch(SQLException e) {}
               }
        	return howMany;	
		}	
     public static int executeSelect(String s) throws SQLException {
    
    int rowCount = 0;
    try {
     Class.forName("com.mysql.jdbc.Driver").newInstance();
     connection = DriverManager.getConnection(connectionURL);
     statement = connection.createStatement();
     resultSet = statement.executeQuery(s);
      if(resultSet.last()){
          rowCount = resultSet.getRow();
       } else {
           rowCount = 0; 
       }
    } catch(Exception e) {
        e.printStackTrace();
    }
    finally {
        try {
            if(statement != null)
                statement.close();
            if(connection != null)                   
                connection.close();
            }
        catch(SQLException e) {}
       }
    return rowCount;
  }
  public static boolean merchandiseTransaction(String s,String t) throws SQLException {
      boolean isSuccess = false;
      try {
     Class.forName("com.mysql.jdbc.Driver").newInstance();
     connection = DriverManager.getConnection(connectionURL);
     connection.setAutoCommit(false);
     statement = connection.createStatement();
     statement.executeUpdate(s);
     statementUpdate = connection.createStatement();
     statementUpdate.executeUpdate(t);
     connection.commit();
     isSuccess = true;
    } catch(Exception e) {
        e.printStackTrace();
        connection.rollback();
    }
    finally {
        try {
            if(statement != null)
                statement.close();
            if(statementUpdate != null)
                statementUpdate.close();
            if(connection != null)                   
                connection.close();
            }
        catch(SQLException e) {}
       }
      return isSuccess;
  }
}           
	
	
