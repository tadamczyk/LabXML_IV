import java.io.FileOutputStream;
import org.w3c.dom.bootstrap.DOMImplementationRegistry;
import org.w3c.dom.ls.DOMImplementationLS;
import org.w3c.dom.ls.LSParser;
import org.w3c.dom.ls.LSSerializer;
import org.w3c.dom.ls.LSOutput;
import org.w3c.dom.DOMConfiguration;
import org.w3c.dom.DOMError;
import org.w3c.dom.DOMErrorHandler;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class Dom3Demo{
  public static Document document;

  public static void main(String[] args){
    if (args.length == 0 || args.length > 3){
      printUsage();
      System.exit(1);
    }
    try{
      System.setProperty(DOMImplementationRegistry.PROPERTY,
          "org.apache.xerces.dom.DOMXSImplementationSourceImpl");
      DOMImplementationRegistry registry = DOMImplementationRegistry
          .newInstance();
      DOMImplementationLS impl = (DOMImplementationLS) registry
          .getDOMImplementation("LS");
      LSParser builder = impl.createLSParser(
          DOMImplementationLS.MODE_SYNCHRONOUS, null);
      DOMConfiguration config = builder.getDomConfig();
      DOMErrorHandler errorHandler = getErrorHandler();
      config.setParameter("error-handler", errorHandler);
      config.setParameter("validate", Boolean.TRUE);
      config.setParameter("schema-type", "http://www.w3.org/2001/XMLSchema");
      config.setParameter("schema-location", args[1]);
      System.out.println("Parsowanie " + args[0] + "...");
      document = builder.parseURI(args[0]);
      Element elem = document.getElementById("two.worker");
      Element newElem = (Element) elem.cloneNode(true);
      newElem.setAttribute("id", "six.worker");
      NodeList nl = newElem.getChildNodes();
      for (int i = 0; i < nl.getLength(); i++){
        Node n = nl.item(i);
        if (n.getNodeName().equals("email")){
          n.setTextContent("six@foo.com");
        }
        if (n.getNodeName().equals("name")){
          NodeList nle = n.getChildNodes();
          for (int j = 0; j < nle.getLength(); j++){
            Node ni = nle.item(j);
            if (ni.getNodeName().equals("given")){
              ni.setTextContent("Six");
            }
          }
        }
      }
      document.getFirstChild().insertBefore(newElem, null);
      LSSerializer domWriter = impl.createLSSerializer();
      config = domWriter.getDomConfig();
      config.setParameter("xml-declaration", Boolean.TRUE);
      LSOutput dOut = impl.createLSOutput();
      dOut.setEncoding("latin2");
      dOut.setByteStream(new FileOutputStream(args[2] + ".xml"));
      System.out.println("Serializing document... ");
      domWriter.write(document, dOut);
    }
    catch (Exception ex){
      ex.printStackTrace();
    }
  }

  private static void printUsage(){
    System.err.println("usage: java Dom3Demo uri.xml uri. result_uri.xml");
    System.err.println();
    System.err.println("NOTE: You can only validate DOM tree against XML Schemas.");
  }

  public static DOMErrorHandler getErrorHandler(){
    return new DOMErrorHandler(){
      public boolean handleError(DOMError error){
        short severity = error.getSeverity();
        if (severity == error.SEVERITY_ERROR){
          System.out.println("[dom3-error]: " + error.getMessage());
        }
        if (severity == error.SEVERITY_WARNING){
          System.out.println("[dom3-warning]: " + error.getMessage());
        }
        if (severity == error.SEVERITY_FATAL_ERROR){
          System.out.println("[dom3-fatal-error]: " + error.getMessage());
        }
        return true;
      }
    };
  }
}
