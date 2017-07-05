import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class Zad1{
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
        }

      public void characters(char ch[], int start, int length) throws SAXException{
        if (bname){
          System.out.printf("%30s %9s", new String(ch, start, length), "         ");
          bname = false;
        }
        if (bprice){
          System.out.printf("%10s\n", new String(ch, start, length));
          bprice = false;
          }
        if (bdescription){
          System.out.printf("%5s %90s\n\n", "     ", new String(ch, start, length));
          bdescription = false;
        }
      }
    };
      saxParser.parse("simple.xml", handler);
    } catch (Exception e){
      e.printStackTrace();
    }
  }
}
