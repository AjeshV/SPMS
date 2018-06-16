<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <%@ page import="java.sql.*,java.io.*,java.util.*,javax.sql.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<title>Skills And Requirement Mapping</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link rel="stylesheet" type="text/css" href="style.css" media="screen" />

</head>

<body>

<div id="wrap">

<br/><img src="images/logo.gif" align="left" width="300" height="60"></img>

<div id="header">

<h2 align="center" >Skills And Requirement Mapping</h2>

<div class="right"> <%if(session.getAttribute("user")!=null)%>

<h3>Welcome,<b><font size="+2" color="green"><%=session.getAttribute("user")%></font></b></h3>

</div>

</div>

<div id="top"> </div>

<div id="contentt">

<div id="headermenu">

<div class="headerm">

<ul>

<li><a href="welcome_admin.jsp">Home</a></li>

<li><a href="admin_main.jsp">Admin</a></li>

<li><a href="welcome.jsp">Resource mapping</a></li>

<li><a href="Skill_Statistics.jsp">Graphs</a></li>

<li><a href="change_pwd.jsp">Change Password</a></li>

<li><a href="signout.jsp">Signout</a></li>

</ul>

</div>

</div>

<div class="left">

<h2>Quick Links :</h2>

<ul>

<li><a href="add_user.jsp">Add User</a></li>

<li><a href="delete_user.jsp">Delete User</a></li>

<li><a href="edit_user.jsp">Edit User</a></li>

<li><a href="pwd_reset.jsp">Password Reset</a></li>

<li><a href="AddTechnology.jsp">Add Technology</a></li>

<li><a href="upload_spms_data.jsp">Upload SPMS Data</a></li>

</ul>

<img src="images/logo.jpg" width="220" height="350"></img>

</div>

<div class="middle">

<br>

<%
                                               
                                               try{
                                            	   System.out.println("try");
                                            	   String connectionURL = "jdbc:mysql://localhost:3306/SPMS"; 
                                            	   //System.out.println("connectionline");
												   Connection con = null; 
												   Class.forName("com.mysql.jdbc.Driver"); 
                                            	   con = DriverManager.getConnection(connectionURL, "root", "root");
                                            	   //System.out.println("new connection established");
                                            	   
                                           	       ResultSet rs=null,rs2=null;
                                            	   Statement stmt=null,stmt1=null,stmt2=null;
                                            	   
                                            	   int count=0;
                                            	   String technology1=null;
                                            	   String selecttechnology = request.getParameter("selecttechnology");	
                                            	   String subskill= request.getParameter("subskill");
                                            	   String newtech= request.getParameter("newtech");
                                            	   String technology;
                                            	   
                                            	   //System.out.println(selecttechnology);
                                            	   //System.out.println(subskill);
                                            	   //System.out.println(newtech);
                                            	   if(newtech==null)
                                            	   {   
                                            		   technology=selecttechnology;
                                            		   
                                            	   }
                                            	   else
                                            	   {
                                            		  technology=newtech;
                                            		  technology1=newtech;
                                            	   }
                                            	 
                                            	   String Query = "Insert into ADD_TECHNOLOGY values('"+technology+"','"+subskill+"')";
                                            	   String Query1=" Insert into SUMMARY_TABLE (technology) values ('"+technology1+"')";
                                            	   String subskillcheck="select subskill from add_technology where upper(trim(subskill))='"+subskill+"'";
                                            	   stmt2=con.createStatement();
                                            	   
                                            	   rs2=stmt2.executeQuery(subskillcheck);
                                            	   while(rs2.next()){

                                            	   String s1=rs2.getString(1);
                                            	   //out.println("<tr><td>"+s1+"</td>");
                                                   count++;
                                            	   }
                                            	    //out.println(count);
                                            	  
                                            	   if(count==0)
                                            	   {                                          		  
                                               	      stmt=con.createStatement();
                                               	      stmt1=con.createStatement();
						      int result = stmt.executeUpdate(Query);
                                               	      if(result > 0){
                                          		%>
                                                         <h3 align=center>Data Added successfully</h3>
                                                         <h3 align=center>Do you want to add another Subskill</h3>
                                               		     <P align=center><A HREF="AddTechnology.jsp">click here</A></P>

                                           	        <%
                                            	     }  
                                               }
						    else
   						    {
   						     %>
                                             <h3 align=center>Subskill Already exists</h3>
                                             <h3 align=center>Do you want to add another Subskill</h3>
                                   		     <P align=center><A HREF="AddTechnology.jsp">click here</A></P>
						    <%
                                       	    }
                                       			 if(technology1!=null)
                                                 {
                                                	 //System.out.println("if entered");
                                                	 int s=stmt1.executeUpdate(Query1);
                                                	// System.out.println(s);
                                                 }
                                       			   
		con.close();}catch(Exception e){%><%=e%><%}
	
%>
</div>
<div style="clear: both;"> </div>
</div>

<div id="bottom"> </div>

<img src="images/r1.png" width="1000" height="60"></img>

<div id="footer">

&copy;
</div>

</div>

</body>

</html>
