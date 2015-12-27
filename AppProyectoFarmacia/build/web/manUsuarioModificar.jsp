<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Usuario</title>
    </head>
    <body>
        <jsp:useBean id="usuario" class="data.cUsuario" scope="page"></jsp:useBean>
        <%           
            usuario.conectarse();
            MongoCursor<Document> datos = usuario.listar();
            datos=usuario.listarAptos();
            out.print("<h2>Modificar Usuario</h2><form action=\"manUsuarioModificarAccion.jsp\">");
            out.print("Seleccione el usuario a modificar:");
            out.print("<select name=\"txtApellidos\">");
            Document documento;
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<option value=\""+documento.getString("Apellidos")+"\">"+documento.getString("Nombres")+" "+documento.getString("Apellidos") +"</option> " );
            }
            out.print("</select><br><br>");
            out.print("<input type=\"submit\" value=\"Modificar\">");
            out.print("</form>");
        %>
    </body>
</html>
