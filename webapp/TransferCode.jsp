<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WithdrawCode</title>
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
long t_account_no = Long.parseLong(request.getParameter("tacno"));
String name = request.getParameter("name");
String password = request.getParameter("password");
double amount = Double.parseDouble(request.getParameter("amount"));
String tot_amount = "",username="";

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
	PreparedStatement ps0 = con.prepareStatement("select * from ashraf_world_bank where account_number = ? ");
	ps0.setLong(1,t_account_no);

	

	ResultSet rs0 = ps0.executeQuery();
	if(rs0.next())
	{
		/*out.print("success");*/
		out.print("<br><h1 id = 'info'> Account Info </h1>");
		PreparedStatement ps_transfer = con.prepareStatement("update ashraf_world_bank set amount = amount+? where account_number = ? ");
		ps_transfer.setDouble(1,amount);
		ps_transfer.setLong(2,t_account_no);
		int t = ps_transfer.executeUpdate();
		
		if(t>=1)
		{
			out.print("<br><p id = 'amount_text'>target account credited <b>"+amount+"</b></p>");
		}
		else{
			out.print("Something Wrong with the target");
		}
		/* User account reduced */
		PreparedStatement ps = con.prepareStatement("update ashraf_world_bank set amount = amount-? where account_number = ? and name = ? and password = ?");
		ps.setDouble(1,amount);
		ps.setLong(2,account_no);
		ps.setString(3,name);
		ps.setString(4,password);
		int i = ps.executeUpdate();
		if(i>=1)
		{
			PreparedStatement ps1 = con.prepareStatement("select name,amount from ashraf_world_bank where account_number =? and name =? and password = ?");
			
			ps1.setLong(1,account_no);
			ps1.setString(2,name);
			ps1.setString(3,password);
			ResultSet rs = ps1.executeQuery();
			if(rs.next())
			{
				username = rs.getString(1);
				tot_amount = rs.getString(2);
				
				
				out.print("<br><p id = 'amount_text'> Your Amount is debited by <b>"+amount+"</b></p>");
				out.print("<br><p id = 'amount_text'> reduced amount is <b>"+ tot_amount+".0</b></p>");
				out.print("<br><hr>");
			}
			
			con.close();
		}
		con.close();
	}
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