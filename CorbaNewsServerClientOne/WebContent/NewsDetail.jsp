<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Technology News</title>
<link rel="stylesheet" href="layout/styles/layout3.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.setup.js"></script>
</head>
<body id="top">
<%@ page import="java.util.List,
java.util.Scanner,
org.omg.CORBA.ORB,
org.omg.CosNaming.NamingContextExt,
org.omg.CosNaming.NamingContextExtHelper,
NewsApp.News,
NewsApp.NewsHelper,
org.omg.CosNaming.*,
org.omg.CosNaming.NamingContextPackage.*,
org.omg.CORBA.*,java.io.*,java.util.*,
NewsApp.NewsPOA
"%>
<div class="wrapper col1">
  <div id="topbar">
    
    <ul>
        <li><% out.print(request.getParameter("username"));%></li>
      <li class="last"><a href="Home.jsp">Signout</a></li>
    </ul>
    <br class="clear" />
  </div>
</div>

<div class="wrapper col2">
  <div id="header">
    <div class="fl_left">
      <h1><a href="index.html">News Detail</a></h1>
      <p>Know it better
    </div>
    <div class="fl_right"> <a href="#"><img src="images/demo/468x60.gif" alt="" /></a> </div>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col3">
  <div id="topnav">
    <ul>
       <li  ><a href="TopHeadLines.jsp">Headlines</a><span></span></li>
      <li ><a href="ShortNews.jsp"> Short News</a><span></span></li>
      <li><a href="FullNews.jsp">Full News</a><span></span></li>
        <!--<ul>
          <li><a href="#">Link 1</a></li>
          <li><a href="#">Link 2</a></li>
          <li><a href="#">Link 3</a></li>
        </ul> -->
         <li class="last"><a href="#"></a></li>
    </ul>
    <br class="clear" />
  </div>
</div>
<%
try {
	String[] args={"-ORBInitialPort" ,"1050", "-ORBInitialHost", "172.50.88.56"};
    ORB orb = ORB.init(args, null);
    org.omg.CORBA.Object objRef =   orb.resolve_initial_references("NameService");
    NamingContextExt ncRef = NamingContextExtHelper.narrow(objRef);
    News addobj = (News) NewsHelper.narrow(ncRef.resolve_str("ABC")); %>
<div class="wrapper col5">
  <div id="container">
    <div id="content">
        
      <h2>Top HeadLines</h2>
      
      <p><strong><%  NewsApp.NewsPackage.News r=addobj.getShortNews("Technology",request.getParameter("id"));%></strong></p>
   
      
     <div id="column">
      <div class="holder">
      <ul id="latestnews">
          <li>
    	  <img class="imgl" src=<% out.println(r.imageLink[0]); %> alt="" ></img>
    	  <p><%
    	  out.println(r.news[0]); %> </p>
    	 
    	  </li>
    	   </ul>  </div>
    </div> <%
   
			     
		 
}
		   catch (Exception e) {
		      System.out.println("Hello Client exception: " + e);
		  e.printStackTrace();
		   }
		%>
         </div>
  
    <br class="clear" />
  </div>
</div>


<div class="wrapper col7">
  <div id="copyright">
    <p class="fl_left">Software Architecture Assignment - <a href="#">Broker Architecture</a></p>
    
    <br class="clear" />
  </div>
</div>
</body>
</html>

