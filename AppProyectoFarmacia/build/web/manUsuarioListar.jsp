<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Usuario</title>
    </head>
    <body>
        <jsp:useBean id="usuario" class="data.cUsuario" scope="page"></jsp:useBean>
        <%           
            usuario.conectarse();
            MongoCursor<Document> datos = usuario.listar();
            Document documento;
            datos=usuario.listarAptos();
            out.print("<h2>Listar Usuario</h2>");
            out.print("<table border=\"1\">"); 
            out.print("<tr><th>Nombres</th><th>Apellidos</th><th>DNI</th><th>Foto</th></tr>");
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<tr><th>"+documento.getString("Nombres")+"</th><th>"+documento.getString("Apellidos")+"</th><th>"+documento.getString("DNI")+"</th><th><a href=\"manUsuarioVerFoto.jsp?imagen="+documento.getString("Usuario")+".jpg\">"+documento.getString("Usuario")+".jpg</a></th></tr> " );
            }
            out.print("</table>");
        %>
    </body>
</html>

