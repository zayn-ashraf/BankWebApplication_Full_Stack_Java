<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CloseCode</title>
<style>
            body{
                background-color:lightcoral;
                font-family:Arial,Helvetica,sans-serif;
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
                
                margin-top:1px;
                margin-left:1px;
                height:99%;
            }
            /* BalanceCode */
            #welcome_text
            {
            text-align:left;
            color: blue;
           
            }
            #info
            {
            text-align:center;
            background: lightgreen;
            height:30px;
            
            }
            #amount_text
            {
            margin-left:20px;
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
              <div id = "aside-right"><br>
              
             
<%@ page import = "java.sql.*" %>
<%
long account_no = Long.parseLong(request.getParameter("acno"));
String name = request.getParameter("name");
String password = request.getParameter("password");

String tot_amount = "",username="";
String status ="Inactive";

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashraf","ashraf");
	PreparedStatement ps = con.prepareStatement("update ashraf_world_bank set status = ? where account_number = ? and name = ? and password = ?");
	ps.setString(1,status);
	
	ps.setLong(2,account_no);
	ps.setString(3,name);
	ps.setString(4,password);
	int i = ps.executeUpdate();
	if(i>=1)
	{
		out.print("</h2><br><h1 id = 'info'> Account Info </h1>");
		out.print("</h2><br><p> Account is Inactive</p>");
	}
	con.close();
}
catch(Exception e)
{
	out.print(e);
}
%>
</div> 
            </div>
        </nav>
    </body>
</html>