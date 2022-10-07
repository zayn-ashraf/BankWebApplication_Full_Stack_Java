<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>bank</title>
        <style>
           body{
                background-color:lightcoral;
            }
            /* NAV  */
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
            /* body */
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

            /* anchor tag */
            a{
                text-decoration:none;
            }
            a:link {
                color:black;
                


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
            
            /* logo */
            center{
            font-size:50px;
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

              <p><center>Ashraf World Bank	</center> </p>
            </div>
        </nav>
    </body>
</html>