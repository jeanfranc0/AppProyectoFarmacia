<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Proveedor</title>
    </head>
    <body>
        <jsp:useBean id="proveedor" class="data.cProveedor" scope="page"></jsp:useBean>
        <%           
            proveedor.conectarse();
            MongoCursor<Document> datos = proveedor.listar();
            Document documento;
            datos=proveedor.listarAptos();
            out.print("<h2>Listar Proveedor</h2>");
            out.print("<table border=\"1\">"); 
            out.print("<tr><th>Identificador</th><th>RUC</th><th>Razón Social</th></tr>");
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<tr><th>"+documento.getString("Id_Proveedor")+"</th><th>"+documento.getString("RUC")+"</th><th>"+documento.getString("Razon_Social")+"</th></tr> " );
            }
            out.print("</table>");
        %>
    </body>
</html>
