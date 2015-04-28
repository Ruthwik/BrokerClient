
import NewsApp.News;
import NewsApp.NewsHelper;

import org.omg.CosNaming.*;
import org.omg.CosNaming.NamingContextPackage.*;
import org.omg.CORBA.*;

import java.io.*;
import java.util.*;
 
public class StartClient {
 
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
      try {
	    ORB orb = ORB.init(args, null);
	    org.omg.CORBA.Object objRef =   orb.resolve_initial_references("NameService");
	    NamingContextExt ncRef = NamingContextExtHelper.narrow(objRef);
	    News addobj = (News) NewsHelper.narrow(ncRef.resolve_str("ABC"));
            Scanner c=new Scanner(System.in);
            System.out.println("Welcome to the news system:");          		    
		    //for(;;){
		      NewsApp.NewsPackage.News r=addobj.getTopHeadLines("a", 1);
		      System.out.println("The result for addition is : "+r.id[0]);
		     // System.out.println("The result for addition is : "+r.news[0].toString());
		      System.out.println("-----------------------------------");
            //}
       }
       catch (Exception e) {
          System.out.println("Hello Client exception: " + e);
	  e.printStackTrace();
       }
 
    }
 
}