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
         <jsp:useBean id="usuario" class="data.cUsuario" scope="page"></jsp:useBean>
        <jsp:useBean id="almacen" class="data.cAlmacen" scope="page"></jsp:useBean>
        <%
            String id=request.getParameter("txtId");
            String contrasenia=request.getParameter("txtContrasenia");
            String dni=request.getParameter("txtDNI");
            String nombres=request.getParameter("txtNombres");
            String apellidos=request.getParameter("txtApellidos");
            String cargo=request.getParameter("Cargo");
            String alm=request.getParameter("txtAlmacen");         
            usuario.conectarse();
            MongoCursor<Document> datos = usuario.listar();
            almacen.conectarse();
            MongoCursor<Document> dat=almacen.listar();
            dat=almacen.listarAptos();
            if(id!=null)
            {
                usuario.insertar(id,contrasenia,dni,nombres,apellidos,cargo,alm);
                %> 
                <jsp:forward page="manUsuarioCargarFoto.jsp"> 
                    <jsp:param name="Usuario" value="<%=id%>"/> 
                    <jsp:param name="Nombres" value="<%=nombres%>"/> 
                    <jsp:param name="Apellidos" value="<%=apellidos%>"/> 
                </jsp:forward> 
                <% 
            }
        %>
        <h2>Insertar Usuario</h2>
        <form action="manUsuarioInsertar.jsp">
            <label for="id">Usuario: </label>
            <input type="text" name="txtId" required><br><br>
            <label for="RUC">Contrase&ntildea: </label>
            <input type="text" name="txtContrasenia" required ><br><br>
            <label for="RUC">DNI: </label>
            <input type="text" name="txtDNI" required maxlength="8" onkeypress="javascript:return validar_numeros(event)" onpaste="return false"><br><br>
            <label for="Razon">Nombres: </label>
            <input type="text" name="txtNombres" onkeypress="javascript:return validar_letras(event)" onpaste="return false" required ><br><br>
            <label for="Direccion">Apellidos</label>
            <input type="text" name="txtApellidos" onkeypress="javascript:return validar_letras(event)" onpaste="return false"><br><br>
            <label for="Telefono">Cargo </label>
            <select name="Cargo">
                <option value="Recepcionista">Recepcionista</option>
                <option value="Administrador">Administrador</option>
            </select><br><br>
            <label for="Contacto">Almacen </label>
            <select name="txtAlmacen">
           <%Document documento;
            while (dat.hasNext())
            {
                documento = dat.next();
                out.println("<option value=\""+documento.getString("Id_Almacen")+"\">"+documento.getString("Nombre")+"</option> " );
            }%>
            </select><br><br>
            <input type="submit" value="Ingresar">
            
        </form>
    </body>
</html>

