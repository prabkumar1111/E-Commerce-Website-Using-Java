<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
<%

String msg = request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Successfully Updated!</h3>	
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>	
<%} %>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Image</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th>Status</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
          </tr>
        </thead>
        <tbody>
       <%
       ArrayList<String> imglink=new ArrayList<>();
       imglink.add("Woodland Shoe.jpg");
       imglink.add("Dell Laptop.jpg");
       imglink.add("Titan watch.jpg");
       imglink.add("Dell Bag.jpg");
       imglink.add("headphone.png");
       imglink.add("earphone.png");
       imglink.add("keyboard.png");
       imglink.add("mouse.png");
       imglink.add("bottle.png");
       imglink.add("sandal.jpg");
       		try{
       			Connection con = ConnectionProvider.getCon();
       			Statement st = con.createStatement();
       			ResultSet rs = st.executeQuery("select * from product");
       			int i=0;
       		while(rs.next() && i<imglink.size())
       		{
       			String name=imglink.get(i);
       			i++;
       %>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><img width="70" height="50" src="../image/<%=name%>"></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><a href="editProduct.jsp?id=<%=rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
       <%
       		}
       		}
       		catch(Exception e)
       		{
       			System.out.println(e);
       		}
     	%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>