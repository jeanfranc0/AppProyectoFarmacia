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
    <jsp:useBean id="usuario" class="data.cUsuario" scope="page"></jsp:useBean>
    <jsp:useBean id="almacen" class="data.cAlmacen" scope="page"></jsp:useBean>
        <%
            String id=request.getParameter("txtId");
            String dni=request.getParameter("txtDNI");
            String nombres=request.getParameter("txtNombres");
            String apellidos=request.getParameter("txtApellidos");
            String cargo=request.getParameter("Cargo");
            String alm=request.getParameter("txtAlmacen");         
            usuario.conectarse();
            MongoCursor<Document> datos = usuario.listar();
            MongoCursor<Document> dat=almacen.listar();
            dat=almacen.listarAptos();
            if(id!=null)
            {
                usuario.modificar(id, dni, nombres, apellidos, alm, cargo);
                response.sendRedirect("manUsuario.jsp");
            }
            else
            {
                if(apellidos!=null)
                {
                    datos=usuario.buscar("Apellidos", apellidos);
                    Document documento=datos.next();
         %>
<div id="topPan"><a href="#"><img src="images/logobotica.jpg" title="Green Solutions" alt="Green Solutions" width="204" height="57" border="0"/></a>
  <ul>
    <li><a href="manUsuario.jsp">Usuario</a></li>
    <li><a href="manProducto.jsp">Producto</a></li>
    <li><a href="manAlmacen.jsp">Almac&eacuten</a></li>
    <li><a href="manCliente.jsp">Cliente</a></li>
    <li><span>Usuario</span></li>     
  </ul>
</div>
<div id="bodyPan">
  <div id="leftPan">
    <h3>Operaciones</h3>
    <ul>
    <li><a href="javascript:Carga('manUsuarioInsertar.jsp', 'rightbodyPan');">Insertar</a></li>
     <li><a href="javascript:Carga('manUsuarioModificar.jsp', 'rightbodyPan');">Modificar</a></li>
     <li><a href="javascript:Carga('manUsuarioActivar.jsp','rightbodyPan');">Activar Cuentas</a></li>
     <li><a href="javascript:Carga('manUsuarioDesactivar.jsp', 'rightbodyPan');">Desactivar Cuentas</a></li>
     <li><a href="javascript:Carga('manUsuarioListar.jsp', 'rightbodyPan');">Listar</a></li>
    </ul>
  </div>
  <div id="rightPan">
    <div id="rightbodyPan">
      <h2>Modificar Usuario</h2>
      <form action="manUsuarioModificarAccion.jsp">
             
            <label for="id">Usuario: </label>
            <input type="text" name="txtId"  value="<%=documento.getString("Usuario")%>" required><br><br>
            <label for="RUC">DNI: </label>
            <input type="text" name="txtDNI" required maxlength="8" value="<%=documento.getString("DNI")%>" onkeypress="javascript:return validar_numeros(event)" onpaste="return false" ><br><br>
            <label for="Razon">Nombres: </label>
            <input type="text" name="txtNombres" required value="<%=documento.getString("Nombres")%>" onkeypress="javascript:return validar_letras(event)" onpaste="return false"><br><br>
            <label for="Direccion">Apellidos</label>
            <input type="text" name="txtApellidos"  value="<%=documento.getString("Apellidos")%>" onkeypress="javascript:return validar_letras(event)" onpaste="return false"><br><br>
            <label for="Telefono">Cargo </label>
            <select name="Cargo" > 
                <%if (documento.getString("Cargo").equals("Recepcionista"))
                {
                    %><option value="Recepcionista">Recepcionista</option>
                <option value="Administrador">Administrador</option><%
                }else
                {%> <option value="Administrador">Administrador</option>
                <option value="Recepcionista">Recepcionista</option>
                <%}%>
                
                
            </select><br><br>
            <label for="Contacto">Almacen </label>
            <select name="txtAlmacen">
           <%
           
            while (dat.hasNext())
            {
                Document doc;
                doc = dat.next();
                out.println("<option value=\""+doc.getString("Id_Almacen")+"\">"+doc.getString("Nombre")+"</option> " );
            }%>
            </select><br><br>
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
