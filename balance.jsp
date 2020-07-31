<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.sql.Connection,java.util.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
	<center>
		<h2>
			<strong><i>Transaction Information</i></strong>
		</h2>
	</center>
	<center>
		<table border="5px">
			<tr style="background-color: #33E0FF;">
			<h2>
				<th>ID</th>
				<th>Date</th>
				<th>Account Holder</th>
				<th>Account Number</th>
				<th>Credit</th>
				<th>Debit</th>
				<th>Balance</th>
			</tr>
			<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication?autoReconnect=true&useSSL=false", "root","#Bhagya12345");
					String ps2 = "select * from transction ORDER BY id DESC LIMIT 5";
					Statement stmt = conn.createStatement();
					ResultSet rs2 = stmt.executeQuery(ps2);
					while (rs2.next()) {
			%>
			<tbody>
				<tr>
					<td><%=rs2.getInt(1)%></td>
					<td><%=rs2.getString(2)%></td>
					<td><%=rs2.getString(3)%></td>
					<td><%=rs2.getInt(4)%></td>
					<td><%=rs2.getInt(5)%></td>
					<td><%=rs2.getInt(6)%></td>
					<td><%=rs2.getInt(7)%></td>
				</tr>
			</tbody>
			<%
				}
			%>
		</table>
		<center>
		<br>
		<br>
			<table>
				<tr>
					<td><b><strong>AMOUNT BALNCE:</strong></b><%
						stmt = conn.createStatement();
							String ps1 = "select balance from transction ORDER BY id DESC LIMIT 1 ";
							ResultSet rs = stmt.executeQuery(ps1);

							while (rs.next()) {
					%> <b><%=rs.getInt(1)%></b></td>
				</tr>
				<tr>
					<center>
						<td><a href="Transferfund"><button type="button"
									style="margin-left: 50px; margin-top: 50px; border:5px solid grey; background-color: #CEECF5;color:"red";><i><b>TRANSFER</b></i></button></a></td>
					</center>
				</tr>
			</table>
		</center>
		<%
	}

	}
 catch(Exception e)
 {
	 e.printStackTrace();

 }
%>
	</center>
</body>
</html>

