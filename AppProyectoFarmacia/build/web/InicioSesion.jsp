<%@page import="javafx.scene.control.Alert"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validando</title>
    </head>
    <body>
        <jsp:useBean id="usuario" class="data.cUsuario" scope="page"></jsp:useBean>
        <%
            String user = request.getParameter("txtUsuario");
            String pass = request.getParameter("txtContrasenia");
            usuario.conectarse();
            MongoCursor<Document> datos = usuario.buscarxId(user);
            int permiso=usuario.validar(user, pass);
            //Ingreso de Sesion Incorrecto
            if(permiso==0)
            {
                response.sendRedirect("indexerror.jsp");
            }
            //Ingreso de Sesion Administrador
            if(permiso==1)
            {
                response.sendRedirect("manProveedor.jsp");/*Redireccion Admin*/
            }
            //Ingreso de Sesion Recepcionista
            if(permiso==2)
            {
                response.sendRedirect("manAlmacen.jsp");/*Redireccion Recep*/
            }
        %>
    </body>
</html>
