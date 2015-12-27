<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript" type="text/javascript" src="Validacion.js"></script>
        <title>Insertar Proveedor</title>
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
                proveedor.insertar(proveedor.Identificador(), ruc, razon, direccion, telefono, contacto, correo);
                response.sendRedirect("manProveedor.jsp");
            }
        %>
        <h2>Insertar Proveedor</h2>
        <form action="manProveedorInsertar.jsp">
            <label for="id">Identificador Proveedor: </label>
            <input type="text" name="txtId" value="<%=proveedor.Identificador()%>" required><br><br>
            <label for="RUC">RUC: </label>
            <input type="text" name="txtRUC" required minlenght="11" maxlength="11" onkeypress="javascript:return validar_numeros(event)" onpaste="return false"><br><br>
            <label for="Razon">Raz&oacuten Social: </label>
            <input type="text" name="txtRazon" required ><br><br>
            <label for="Direccion">Direcci&oacuten: </label>
            <input type="text" name="txtDireccion"  ><br><br>
            <label for="Telefono">Tel&eacuteno: </label>
            <input type="text" name="txtTelefono" minlenght="6" maxlength="9" onkeypress="javascript:return validar_numeros(event)"  onpaste="return false"><br><br>
            <label for="Contacto">Contacto </label>
            <input type="text" name="txtContacto"  onkeypress="javascript:return validar_letras(event)" onpaste="return false"><br><br>
            <label for="Correo">Correo: </label>
            <input type="text" name="txtCorreo" id="correo"  ><br><br>
            <input type="submit" value="Ingresar" >
            
        </form>
    </body>
</html>
