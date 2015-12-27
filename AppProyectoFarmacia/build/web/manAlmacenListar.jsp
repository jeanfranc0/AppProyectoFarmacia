<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Almacen</title>
    </head>
    <body>
        <jsp:useBean id="almacen" class="data.cAlmacen" scope="page"></jsp:useBean>
        <%           
            almacen.conectarse();
            MongoCursor<Document> datos = almacen.listar();
            Document documento;
            datos=almacen.listarAptos();
            out.print("<h2>Listar Almacen</h2>");
            out.print("<table border=\"1\">"); 
            out.print("<tr><th>Identificador</th><th>Nombre</th><th>Ubicacion</th></tr>");
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<tr><th>"+documento.getString("Id_Almacen")+"</th><th>"+documento.getString("Nombre")+"</th><th>"+documento.getString("Ubicacion")+"</th></tr> " );
            }
            out.print("</table>");
        %>
    </body>
</html>
