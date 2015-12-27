package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class manAlmacen_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("<head>\n");
      out.write("<title>Farmacia \"Mi Salud\"</title>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\n");
      out.write("<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("<link rel=\"stylesheet\" href=\"fotnsstyle.css\"/>\n");
      out.write("<script type=\"text/javascript\" language=\"JavaScript\" src =\"motor.js\"> </script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div id=\"topPan\"><a href=\"#\"><img src=\"images/logobotica.jpg\" title=\"Green Solutions\" alt=\"Green Solutions\" width=\"204\" height=\"57\" border=\"0\"/></a>\n");
      out.write("  <ul>\n");
      out.write("    <li><a href=\"manProveedor.jsp\">Proveedor</a></li>\n");
      out.write("    <li><a href=\"manProducto.jsp\">Producto</a></li>\n");
      out.write("    <li><span>Almac&eacuten</span></li>\n");
      out.write("    <li><a href=\"manCliente.jsp\">Cliente</a></li>\n");
      out.write("    <li><a href=\"manUsuario.jsp\">Usuario</a></li>    \n");
      out.write("  </ul>\n");
      out.write("</div>\n");
      out.write("<div id=\"bodyPan\">\n");
      out.write("  <div id=\"leftPan\">\n");
      out.write("    <h3>Operaciones</h3>\n");
      out.write("    <ul>\n");
      out.write("    <li><a href=\"javascript:Carga('manAlmacenInsertar.jsp', 'rightbodyPan');\">Insertar</a></li>\n");
      out.write("     <li><a href=\"javascript:Carga('manAlmacenModificar.jsp', 'rightbodyPan');\">Modificar</a></li>\n");
      out.write("     <li><a href=\"javascript:Carga('manAlmacenListar.jsp', 'rightbodyPan');\">Listar</a></li>\n");
      out.write("     <li><a href=\"javascript:Carga('manAlmacenActivar.jsp', 'rightbodyPan');\">Activar</a></li>\n");
      out.write("     <li><a href=\"javascript:Carga('manAlmacenDesactivar.jsp', 'rightbodyPan');\">Desactivar</a></li>\n");
      out.write("    </ul>\n");
      out.write("  </div>\n");
      out.write("  <div id=\"rightPan\">\n");
      out.write("    <div id=\"rightbodyPan\">\n");
      out.write("      <h2>Almacen</h2>\n");
      out.write("     </div>\n");
      out.write("  </div>\n");
      out.write("    <div class=\"social\">\n");
      out.write("        <li><a href=\"http://www.\" class=\"icon-facebook\"></a></li>\n");
      out.write("        <li><a href=\"http://www.\" class=\"icon-twitter\"></a></li>\n");
      out.write("        <li><a href=\"http://www.\" class=\"icon-linkedin\"></a></li>\n");
      out.write("        <li><a href=\"http://www.\" class=\"icon-google\"></a></li>\n");
      out.write("        <li><a href=\"http://www.\" class=\"icon-youtube\"></a></li>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("<div id=\"footerPan\">\n");
      out.write("  <div id=\"footernextPan\">\n");
      out.write("    <ul>\n");
      out.write("      <li><a href=\"#\">Casa</a>|</li>\n");
      out.write("      <li><a href=\"#\">Procesos</a> |</li>\n");
      out.write("      <li><a href=\"#\">Reportes</a>|</li>\n");
      out.write("      <li><a href=\"#\">Salir</a> |</li>\n");
      out.write("    </ul>\n");
      out.write("    <p>©green solution todo los derechos reservados</p>\n");
      out.write("    <ul class=\"templateworld\">\n");
      out.write("      <li>Design By:</li>\n");
      out.write("      <li><a href=\"http://www.templateworld.com\">Template World</a></li>\n");
      out.write("    </ul>\n");
      out.write("    <div id=\"footerPanhtml\"><a href=\"http://validator.w3.org/check?uri=referer\">XHTML</a></div>\n");
      out.write("    <div id=\"footerPancss\"><a href=\"http://jigsaw.w3.org/css-validator/check/referer\">CSS</a></div>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
