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
    <jsp:useBean id="proveedor" class="data.cProveedor" scope="page"></jsp:useBean>
        <%
            String id=request.getParameter("txtId");
            String ruc=request.getParameter("txtRUC");
            String razon=request.getParameter("txtRazon");
            String direccion=request.getParameter("txtDireccion");
            String telefono=request.getParameter("txtTelefono");
            String contacto=request.getParameter("txtContacto");
            String correo=request.getParameter("txtCorreo");            
            proveedor.conectarse();
            MongoCursor<Document> datos = proveedor.listar();
            if(id!=null)
            {
                proveedor.modificar(id, ruc, razon, direccion, telefono, contacto, correo);
                response.sendRedirect("manProveedor.jsp");
            }
            else
            {
                if(razon!=null)
                {
                    datos=proveedor.buscar("Razon_Social", razon);
                    Document documento=datos.next();
         %>
<div id="topPan"><a href="#"><img src="images/logobotica.jpg" title="Green Solutions" alt="Green Solutions" width="204" height="57" border="0"/></a>
  <ul>
    <li><span>Proveedor</span></li>
    <li><a href="manProducto.jsp">Producto</a></li>
    <li><a href="manAlmacen.jsp">Almac&eacuten</a></li>
    <li><a href="manCliente.jsp">Cliente</a></li>
    <li><a href="manUsuario.jsp">Usuario</a></li>     
  </ul>
</div>
<div id="bodyPan">
  <div id="leftPan">
    <h3>Operaciones</h3>
    <ul>
    <li><a href="javascript:Carga('manProveedorInsertar.jsp', 'rightbodyPan');">Insertar</a></li>
     <li><a href="javascript:Carga('manProveedorModificar.jsp', 'rightbodyPan');">Modificar</a></li>
     <li><a href="javascript:Carga('manProveedorActivar.jsp','rightbodyPan');">Activar</a></li>
     <li><a href="javascript:Carga('manProveedorDesactivar.jsp', 'rightbodyPan');">Desactivar</a></li>
     <li><a href="javascript:Carga('manProveedorListar.jsp', 'rightbodyPan');">Listar</a></li>
    </ul>
  </div>
  <div id="rightPan">
    <div id="rightbodyPan">
      <h2>Modificar Proveedor</h2>
      <form action="manProveedorModificarAccion.jsp">
            <label for="id">Identificador Proveedor: </label>
            <input type="text" name="txtId" value="<%=documento.getString("Id_Proveedor")%>" required><br><br>
            <label for="RUC">RUC: </label>
            <input type="text" name="txtRUC" required minlenght="11" maxlength="11" value="<%=documento.getString("RUC")%>" onkeypress="javascript:return validar_numeros(event)" onpaste="return false"><br><br>
            <label for="Razon">Raz&oacuten Social: </label>
            <input type="text" name="txtRazon" required value="<%=documento.getString("Razon_Social")%>"><br><br>
            <label for="Direccion">Direcci&oacuten: </label>
            <input type="text" name="txtDireccion" value="<%=documento.getString("Direccion")%>" ><br><br>
            <label for="Telefono">Tel&eacuteno: </label>
            <input type="text" name="txtTelefono" minlenght="6" maxlength="9" value="<%=documento.getString("Telefono")%>" onkeypress="javascript:return validar_numeros(event)" onpaste="return false"><br><br>
            <label for="Contacto">Contacto </label>
            <input type="text" name="txtContacto" value="<%=documento.getString("Contacto")%>" onkeypress="javascript:return validar_letras(event)" onpaste="return false"><br><br>
            <label for="Correo">Correo: </label>
            <input type="text" name="txtCorreo" value="<%=documento.getString("Correo")%>" id="correo"><br><br>
                        <input type="submit" value="Modificar" >
            
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
