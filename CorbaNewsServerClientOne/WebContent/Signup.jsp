<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login Form</title>


<link href="css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$(".username").focus(function() {
		$(".user-icon").css("left","-48px");
	});
	$(".username").blur(function() {
		$(".user-icon").css("left","0px");
	});
	
	$(".password").focus(function() {
		$(".pass-icon").css("left","-48px");
	});
	$(".password").blur(function() {
		$(".pass-icon").css("left","0px");
	});
});
function myFunction1() {
    alert("Login Successful");
}
function myFunction2() {
    alert("Login UnSuccessful");
}
</script>
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.List,
java.util.Scanner,
org.omg.CORBA.ORB,
org.omg.CosNaming.NamingContextExt,
org.omg.CosNaming.NamingContextExtHelper,
NewsApp.News,
NewsApp.NewsHelper,
org.omg.CosNaming.*,
org.omg.CosNaming.NamingContextPackage.*,
org.omg.CORBA.*,java.io.*,java.util.*
"
%>

	
<div id="wrapper">

	
    <div class="user-icon"></div>
    <div class="pass-icon"></div>
    


<form name="login-form" class="login-form" action="" method="post">

	
    <div class="header">
    <h1>Signup Form</h1>
    
    
  
    
        
    </div>
    
    <div class="content">
	<input name="username" type="text" class="input username"  />
    <input name="password" type="password" class="input password"   />
    </div>
    
    
   
    <div class="footer">
   <input type="submit" name="submit" value="Signup" class="button" onclick=""/>
    </div>
    

</form>
 <% 

 if(request.getParameter("submit")!=null) 
 {
 	try {
 		String[] args={"-ORBInitialPort" ,"1050", "-ORBInitialHost", "172.50.88.56"};
 	    ORB orb = ORB.init(args, null);
 	    org.omg.CORBA.Object objRef =   orb.resolve_initial_references("NameService");
 	    NamingContextExt ncRef = NamingContextExtHelper.narrow(objRef);
 	    News addobj = (News) NewsHelper.narrow(ncRef.resolve_str("ABC"));
 
		String a=request.getParameter("username");
		String b=request.getParameter("password");
		
		if(a!=null&&b!=null)
		{
			int x=addobj.registerClient(a, b, "user");
			
			if(x==1)
			    {
				
				out.print("<h3 style='color:blue;margin-left:73px'><span>Signup Successful</span></h3>");

				String site = new String("Home3.jsp");
	
				   response.setStatus(response.SC_MOVED_TEMPORARILY);
				   response.setHeader("Location", site); 
		}
			else 
			{
				out.print("<h3 style='color:red;margin-left:73px'><span>Signup failed</span></h3>");
			}
			
		
	}
	}
			   catch (Exception e) {
			      System.out.println("Hello Client exception: " + e);
			  e.printStackTrace();
			   }
			

}

 %>
 

</div>

<div class="gradient"></div>
</body>
</html>