<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
	String email = request.getParameter("email");
	String mobileNumber = request.getParameter("mobileNumber");
	String securityQuestion = request.getParameter("securityQuestion");
	String answer = request.getParameter("answer");
	String newPassword = request.getParameter("newPassword");
	int check=0;
	try
	{
		Connection con = ConnectionProvider.getCon();
		//Statement st = con.createStatement();
		//ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and mobileNumber='"+mobileNumber+"' and securityQuestion='"+securityQuestion+"' and answer='"+answer+"'");	
		PreparedStatement p=con.prepareStatement("Select * from users where email=? and mobileNumber =? and securityQuestion =? and answer =?");
		p.setString(1, email);
		p.setString(2, mobileNumber);
		p.setString(3, securityQuestion);
		p.setString(4, answer);

		ResultSet rs=p.executeQuery();
		while(rs.next())
		{
			PreparedStatement ps=con.prepareStatement("update users set password=? where email =? ");
			ps.setString(1, newPassword);
			ps.setString(2, email);
			ps.executeUpdate();
			check=1;
			//st.executeUpdate("update users set password = '"+newPassword+"' where email='"+email+"'");
			response.sendRedirect("forgotPassword.jsp?msg=done");
		}
		if(check==0)
		{
			response.sendRedirect("forgotPassword.jsp?msg=invalid");
		}
			
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	
%>
	