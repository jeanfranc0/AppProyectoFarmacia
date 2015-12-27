<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Farmacia "Mi Salud"</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script language="javascript" type="text/javascript" src="Validacion.js"></script>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="JavaScript" src ="motor.js"> </script>
</head>
<body>
    <jsp:useBean id="producto" class="data.cProducto" scope="page"></jsp:useBean>
        <%
            String id=request.getParameter("txtId");
            String descripcion=request.getParameter("txtDescripcion");
            String marca=request.getParameter("txtMarca");
            producto.conectarse();
            MongoCursor<Document> datos = producto.listar();
            if(id!=null)
            {
                producto.modificar(id, descripcion, marca);
                response.sendRedirect("manProducto.jsp");
            }
            else
            {
                if(descripcion!=null)
                {
                    datos=producto.buscar("Descripcion", descripcion);
                    Document documento=datos.next();
         %>
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
      <h2>Modificar Producto</h2>
      <form action="manProductoModificarAccion.jsp">
            <label for="id">Identificador Producto: </label>
            <input type="text" name="txtId" value="<%=documento.getString("Id_Producto")%>" required><br><br>
            <label for="Descripcion">Descripcion: </label>
            <input type="text" name="txtDescripcion" required minlenght="11" maxlength="11" value="<%=documento.getString("Descripcion")%>"><br><br>
            <label for="Marca">Marca: </label>
            <input type="text" name="txtMarca" required value="<%=documento.getString("Marca")%>"><br><br>
            <input type="submit" value="Modificar">
            
        </form>
      <%          
                }
            }
        %>
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
