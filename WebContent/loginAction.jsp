<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	if("admin@gmail.com".equals(email) && "admin".equals(password) || "prab3214@gmail.com".equals(email) && "123456".equals(password))
	{
		session.setAttribute("email",email);
		response.sendRedirect("admin/adminHome.jsp");
	}
	else
	{
		int z=0;
		try
		{
			Connection con = ConnectionProvider.getCon();
			PreparedStatement st = con.prepareStatement("select * from users where email=? and password=?");
			st.setString(1, email);
			st.setString(2, password);
			
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				z=1;
				session.setAttribute("email",email);
				response.sendRedirect("home.jsp");
			}
			if(z==0)
			{
				response.sendRedirect("login.jsp?msg=notexist");
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("login.jsp?msg=invalid");
		}
	}
	
%>
		