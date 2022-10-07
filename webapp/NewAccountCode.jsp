<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import = "java.sql.*" %>
<%
long account_no = Long.parseLong(request.getParameter("acno"));
String name = request.getParameter("name");
String password = request.getParameter("password");
double amount = Double.parseDouble(request.getParameter("amount"));
String address = request.getParameter("address");
long mobile_number = Long.parseLong(request.getParameter("mno"));
String status ="Active";
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashraf","ashraf");
	PreparedStatement ps = con.prepareStatement("insert into ashraf_world_bank values(?,?,?,?,?,?,?)");
	ps.setLong(1,account_no);
	ps.setString(2,name);
	ps.setString(3,password);
	ps.setDouble(4,amount);
	ps.setString(5,address);
	ps.setLong(6,mobile_number);
	ps.setString(7,status);
	int i = ps.executeUpdate();
	if(i>=1)
	{
		response.sendRedirect("success.jsp");
	}
	con.close();
}
catch(Exception e)
{
	out.print(e);
}
%>

