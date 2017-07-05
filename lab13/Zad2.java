import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class Zad2{
  static int i;
  static double sum;

  public static void main(String argv[]){
    try{
      SAXParserFactory factory = SAXParserFactory.newInstance();
      SAXParser saxParser = factory.newSAXParser();
      DefaultHandler handler = new DefaultHandler(){
        boolean bname = false;
        boolean bprice = false;
        boolean bdescription = false;
        boolean bcalory = false;
        public void startElement(String uri, String localName,String qName,
                                Attributes attributes) throws SAXException{
          if (qName.equalsIgnoreCase("name")){
            bname = true;
          }
          if (qName.equalsIgnoreCase("price")){
            bprice = true;
          }
          if (qName.equalsIgnoreCase("description")){
            bdescription = true;
          }
          if (qName.equalsIgnoreCase("calories")){
            bcalory = true;
          }
        }

      public void characters(char ch[], int start, int length) throws SAXException{
        if (bname){
          System.out.println("Name : " + new String(ch, start, length));
          bname = false;
        }

        if (bcalory){
          double d = Double.parseDouble(new String(ch, start, length));
          System.out.println("Calories : " + d);
          bcalory = false;
          sum = sum + d;
          i++;
        }
      }
    };
      saxParser.parse("simple.xml", handler);
      System.out.println("Average value of calories : " + sum/i);
    } catch (Exception e){
      e.printStackTrace();
    }
  }
}
