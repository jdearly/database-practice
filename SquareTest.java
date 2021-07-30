/*********************************************************************************************/
/* JDBC Test Program: Calling Stored Procedures and Functions with the JDBC Callable Statement 
/*********************************************************************************************/

import java.sql.*; 

class SquareTest 
{ 
  public static void main (String[] args) 
  { 
    String user, pass;
    user = "example";
    pass = "tiger";

    int num    = 2;
    int square = 0;

    try {
		// Register the driver 
		DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());

		// Connect to the database 
        //Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@Picard.radford.edu:1521:teaching",
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@Picard2.radford.edu:1521:itec2",
                                                       user, pass);

	/******************************/
	/* Calling a Stored Procedure */
	/******************************/

        System.out.println("\nCalling Stored Procedure square_proc\n");

        for (int i = 2; i < 6; ++i)
        {
            CallableStatement cStmt1 = conn.prepareCall("{call square_proc(?,?)}");
            cStmt1.setInt(1, i);
            cStmt1.registerOutParameter(2, Types.INTEGER);
            cStmt1.execute();

            System.out.println("Number: " + i + "   Squared: " + cStmt1.getInt(2));
        }

	/**********************/
	/* Calling a Function */
	/**********************/
        
        System.out.println("\nCalling Stored Function square_func\n");

        for (int i = 2; i < 6; ++i)
        {
            CallableStatement cStmt2 = conn.prepareCall("{? = call square_func(?)}");
            cStmt2.registerOutParameter(1, Types.INTEGER);
            cStmt2.setInt(2, i);
            cStmt2.execute();

            System.out.println("Number: " + i + "   Squared: " + cStmt2.getInt(1));
        }
		System.out.println(); 

	// Close the connection 
        conn.close();
     }
     catch (SQLException e){System.out.println ("Could not load the db"+e); 
     }
  } 
} 
