package NewsApp.NewsPackage;

/**
* NewsApp/NewsPackage/NewsHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from News.idl
* Wednesday, April 22, 2015 6:44:57 PM IST
*/

public final class NewsHolder implements org.omg.CORBA.portable.Streamable
{
  public NewsApp.NewsPackage.News value = null;

  public NewsHolder ()
  {
  }

  public NewsHolder (NewsApp.NewsPackage.News initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = NewsApp.NewsPackage.NewsHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    NewsApp.NewsPackage.NewsHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return NewsApp.NewsPackage.NewsHelper.type ();
  }

}
