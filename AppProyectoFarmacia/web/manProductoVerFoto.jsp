<%@page import="com.mongodb.gridfs.GridFSInputFile"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.mongodb.MongoException"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.mongodb.gridfs.GridFSDBFile"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.gridfs.GridFS"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Farmacia "Mi Salud"</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="JavaScript" src ="motor.js"> </script>
</head>
<body>
<div id="topPan"><a href="#"><img src="images/logobotica.jpg" title="Green Solutions" alt="Green Solutions" width="204" height="57" border="0"/></a>
  <ul>
    <li><a href="manProveedor.jsp">Proveedor</a></li>
    <li><span>Producto</span></li>
    <li><a href="manAlmacen.jsp">Almac&eacuten</a></li>
    <li><a href="manCliente.jsp">Cliente</a></li>
    <li><a href="manUsuario.jsp">Usuario</a></li>      
  </ul>
</div>
<div id="bodyPan">
  <div id="leftPan">
    <h3>Operaciones</h3>
    <ul>
    <li><a href="javascript:Carga('manProductoInsertar.jsp', 'rightbodyPan');">Insertar</a></li>
     <li><a href="javascript:Carga('manProductoModificar.jsp', 'rightbodyPan');">Modificar</a></li>
     <li><a href="javascript:Carga('manProductoListar.jsp', 'rightbodyPan');">Listar</a></li>
     <li><a href="javascript:Carga('manProductoActivar.jsp,'rightbodyPan'">Activar</a></li>
     <li><a href="javascript:Carga('manProductoDesactivar.jsp', 'rightbodyPan');">Desactivar</a></li>
    </ul>
  </div>
  <div id="rightPan">
    <div id="rightbodyPan">
      <h2>Foto</h2>
           <%
            String imagen = request.getParameter("imagen");
        %>
        <img src="manProductoMostrarFoto.jsp?imagen=<%=imagen%>">
        </div>
     </form>
    </div>
  </div>
</div>
<div id="footerPan">
  <div id="footernextPan">
    <ul>
      <li><a href="#">Casa</a>|</li>
      <li><a href="#">Procesos</a> |</li>
      <li><a href="#">Reportes</a>|</li>
      <li><a href="#">Salir</a> |</li>
    </ul>
    <p>©green solution todo los derechos reservados</p>
    <ul class="templateworld">
      <li>Design By:</li>
      <li><a href="http://www.templateworld.com">Template World</a></li>
    </ul>
    <div id="footerPanhtml"><a href="http://validator.w3.org/check?uri=referer">XHTML</a></div>
    <div id="footerPancss"><a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a></div>
  </div>
</div>
</body>
</html>


