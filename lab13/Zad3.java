import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import org.xml.sax.helpers.DefaultHandler;

public class Zad3{
  public static void main(String argv[]){
    try{
      SAXParserFactory factory = SAXParserFactory.newInstance();
      SAXParser saxParser = factory.newSAXParser();
      DefaultHandler handler = new DefaultHandler(){
        boolean bmenu = false;
        boolean bfood = false;
        boolean bname = false;
        boolean bprice = false;
        boolean bdescription = false;
        boolean bcalory = false;

        public void startElement(String uri, String localName,String qName,
                                Attributes attributes) throws SAXException{
          if (qName.equalsIgnoreCase("breakfast_menu")){
            bmenu = true;
          }
          if (qName.equalsIgnoreCase("food")){
            bfood = true;
          }
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
        if (bmenu){
          System.out.print("breakfast_menu: " + new String(ch, start, length));
          bmenu = false;
        }
        if (bfood){
          System.out.print("\tfood: " + new String(ch, start, length));
          bfood = false;
          }
        if (bname){
          System.out.println("\t\tname: " + new String(ch, start, length));
          bname = false;
        }
        if (bprice){
          System.out.println("\t\tprice: " + new String(ch, start, length));
          bprice = false;
        }
        if (bdescription){
          System.out.println("\t\tdescription: " + new String(ch, start, length));
          bdescription = false;
        }
        if (bcalory){
          System.out.println("\t\tcalories: " + new String(ch, start, length));
          bcalory = false;
        }
      }

      public void warning(SAXParseException e) throws SAXException{
        System.out.println("Warning! On line number: " + e.getLineNumber()
                          + " and column number: " + e.getColumnNumber());
      }

      public void error(SAXParseException e) throws SAXException{
        System.out.println("Error! On line number: " + e.getLineNumber()
                          + " and column number: " + e.getColumnNumber());
      }

      public void fatalError(SAXParseException e) throws SAXException{
        System.out.println("Fatal error! On line number: " + e.getLineNumber()
                          + " and column number: " + e.getColumnNumber());
        System.exit(0);
      }
    };
      saxParser.parse("simple.xml", handler);
      saxParser.parse("badsimple.xml", handler);
    } catch (Exception e){
      e.printStackTrace();
    }
  }
}
