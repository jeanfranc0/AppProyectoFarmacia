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
    <jsp:useBean id="Cliente" class="data.cClienteNatural" scope="page"></jsp:useBean>
        <%
            String id=request.getParameter("txtId");
            String direccion=request.getParameter("txtDireccion");
            String telefono=request.getParameter("txtTelefono");
            String dni=request.getParameter("txtDNI");
            String nombres=request.getParameter("txtNombres");
            String apellidos=request.getParameter("txtApellidos");            
            Cliente.conectarse();
            MongoCursor<Document> datos = Cliente.listar();
            if(id!=null)
            {
                Cliente.modificar(id, direccion, telefono, dni, nombres, apellidos);
                response.sendRedirect("manCliente.jsp");
            }
            else
            {
                if(nombres!=null)
                {
                    datos=Cliente.buscar("Nombres", nombres);
                    Document documento=datos.next();
         %>
<div id="topPan"><a href="#"><img src="images/logobotica.jpg" title="Green Solutions" alt="Green Solutions" width="204" height="57" border="0"/></a>
  <ul>
    <li><a href="manProveedor.jsp">Proveedor</a></li>
        <li><a href="manProducto.jsp">Producto</a></li>
        <li><a href="manAlmacen.jsp">Almac&eacuten</a></li>
        <li><span>Cliente</span></li>
        <li><a href="manUsuario.jsp">Usuario</a></li>   
  </ul>
</div>
<div id="bodyPan">
  <div id="leftPan">
    <h3>Operaciones</h3>
        <ul>
            <li><a href="javascript:Carga('manClienteNaturalListar.jsp', 'rightbodyPan');">Listar Cliente Natural</a></li>
                                        <li><a href="javascript:Carga('manClienteJuridicoListar.jsp', 'rightbodyPan');">Listar Cliente Juridico</a></li>
                                        <li><a href="javascript:Carga('manClienteNaturalInsertar.jsp', 'rightbodyPan');">Insertar Cliente Natural</a></li>
                                        <li><a href="javascript:Carga('manClienteJuridicoInsertar.jsp', 'rightbodyPan');">Insertar Cliente Juridico</a></li>
                                        <li><a href="javascript:Carga('manClienteNaturalModificar.jsp', 'rightbodyPan');">Modificar Cliente Natural</a></li>
                                        <li><a href="javascript:Carga('manClienteJuridicoModificar.jsp', 'rightbodyPan');">Modificar Cliente Juridico</a></li>
                                        <li><a href="javascript:Carga('manClienteNaturalActivar.jsp', 'rightbodyPan');">Activar Cliente Natural</a></li>
                                        <li><a href="javascript:Carga('manClienteJuridicoActivar.jsp', 'rightbodyPan');">Activar Cliente Juridico</a></li>
                                        <li><a href="javascript:Carga('manClienteNaturalDesactivar.jsp', 'rightbodyPan');">Desactivar Cliente Natural</a></li>
                                        <li><a href="javascript:Carga('manClienteJuridicoDesactivar.jsp', 'rightbodyPan');">Desactivar Cliente Juridico</a></li>
                                        </ul>
  </div>
  <div id="rightPan">
    <div id="rightbodyPan">
      <h2>Modificar Cliente</h2>
      <form action="manClienteNaturalModificarAccion.jsp">
            <label for="id">Identificador Cliente: </label>
            <input type="text" name="txtId" value="<%=documento.getString("Id_Cliente")%>" required><br><br>
            <label for="Direccion">Direcci&oacuten: </label>
            <input type="text" name="txtDireccion" value="<%=documento.getString("Direccion")%>" required minlenght="11" maxlength="11" ><br><br>
            <label for="Telefono">Tel&eacuteno: </label>
            <input type="text" name="txtTelefono" value="<%=documento.getString("Telefono")%>" onkepress="javascript:return validar_numeros(event)" onpaste="return false" required ><br><br>
            <label for="DNI">DNI: </label>
            <input type="text" name="txtDNI" value="<%=documento.getString("DNI")%>" minlenght="6" maxlength="9" onkepress="javascript:return validar_numeros(event)" onpaste="return false"><br><br>
            <label for="Nombres">Nombres: </label>
            <input type="text" name="txtNombres"  value="<%=documento.getString("Nombres")%>" onkeypress="javascript:return validar_letras(event)" onpaste="return false" ><br><br>
            <label for="Apellidos">Apellidos: </label>
            <input type="text" name="txtApellidos"  value="<%=documento.getString("Apellidos")%>" onkeypress="javascript:return validar_letras(event)" onpaste="return false"><br><br>
            <input type="submit" value="Ingresar">
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
