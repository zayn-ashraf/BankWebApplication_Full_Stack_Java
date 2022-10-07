<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Details</title>
 <style>
            body{
                background-color:lightcoral;
            }
           
            .nav-head{
                width:100%;
                height:40px;

                background:linear-gradient(to bottom,lightblue,green);
            }
            .nav-table{
                width:100%;     
                text-align:center;
                font-weight: bold;
            }
         
            .content-body{
                width:100%;
                height:600px;
                background-color: lightseagreen;
                margin:0px;
            }
            .content-body .logo-body
            {
               width:95%;
               height:90%;
               margin:0px 20px 0px 30px;
                border:1px solid black;
            }

           
            a{
                text-decoration:none;
            }
            a:link {
                color:yellow;
                


            }
            a:visited{
                color:darkblue;

            }
            a:hover{
                color:white;
                background:green;
                border-radius:5px;
                padding:2px 5px;

            }
           
            #aside-left
            {
                border-right:2px solid black;
                width: 30%;
                display:inline-block;
                margin:0px;
                padding:0px;
                text-align:center;
                margin-top:0px;
                height:95%;
                margin-top:1px;
                margin-left: 1px;
                height:99%;
                float:left;
            }
            #aside-right
            {
                margin:0px;
                padding:0px;
                
                width: 69%;
                display:inline-block;
                text-align:center;
                margin-top:1px;
                margin-left:1px;
                height:99%;
            }


        </style>
        <link rel="stylesheet" href="font.css">
    </head>
    <body>
        <div class  = "nav-head" id = "nav-font">
             <table class = "nav-table">
                <tr>
                    <td><a href ="home.jsp">Home</a></td>
                    <td><a href ="new_account.jsp">New Account</a></td>
                    <td><a href ="balance.jsp">Balance</a></td>
                    <td><a href ="deposit.jsp">Deposit</a></td>
                    <td><a href ="withdraw.jsp">Withdraw</a></td>
                    <td><a href ="transfer.jsp">Transfer</a></td>
                    <td><a href ="close.jsp">Close A/C</a></td>
                    <td><a href ="about.jsp">About Us</a></td>
                </tr>
             </table>
        </div>
        <nav class = "content-body">
            <br>
            <div class = "logo-body">

              <div id = "aside-left"><h3>Services</h3>
            <br><br></div>
              <div id = "aside-right">
<%@ page import = "java.sql.*" %>
<%
long account_no = Long.parseLong(request.getParameter("acno"));
String name = request.getParameter("name");
String password = request.getParameter("password");
boolean flag = false;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashraf","ashraf");
	PreparedStatement ps = con.prepareStatement("select status from ashraf_world_bank where account_number = ? and status = 'Active' and password = ? ");
	ps.setLong(1,account_no);

	ps.setString(2,password);
	

	ResultSet rs = ps.executeQuery();
	if(rs.next())
	{
		flag = true;
	}
	else
	{
		out.print("Account is Inactive");
	}

			
	

	con.close();
	
} 
catch(Exception e)
{
	out.print(e);
}



if(flag)

{
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashraf","ashraf");
	PreparedStatement ps = con.prepareStatement("select * from ashraf_world_bank where account_number = ? and name = ? and password = ?");
	ps.setLong(1,account_no);
	ps.setString(2,name);
	ps.setString(3,password);
	

	ResultSet rs = ps.executeQuery();
	ResultSetMetaData rss = rs.getMetaData();
	int n = rss.getColumnCount();
	
	out.println("<table id = 'table1'><tr>");
	
		for(int i =1;i<=n;i++)
		
		{
			out.println("<td id = 'a'><font color = blue size = 3>"+rss.getColumnName(i)+"</td>");
			
		}
		out.println("</tr><br>");
		while(rs.next())
			{
				out.print("<tr>");
				for(int i =1;i<=n;i++)
				{
					out.println("<td id='b'>"+rs.getString(i));
					out.println("</td>");
					
				}
				out.print( "</tr><table>");
				
			}
			
	

	con.close();
	
} 
catch(Exception e)
{
	out.print(e);
}
}
%>
</div> 
            </div>
        </nav>
    </body>
</html>