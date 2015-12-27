<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Almacen</title>
    </head>
    <body>
        <jsp:useBean id="almacen" class="data.cAlmacen" scope="page"></jsp:useBean>
        <%           
            almacen.conectarse();
            MongoCursor<Document> datos = almacen.listar();
            datos=almacen.listarAptos();
            out.print("<h2>Modificar Almacen</h2><form action=\"manAlmacenModificarAccion.jsp\">");
            out.print("Seleccione el almacen a modificar:");
            out.print("<select name=\"txtNombre\">");
            Document documento;
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<option value=\""+documento.getString("Nombre")+"\">"+documento.getString("Nombre")+"</option> " );
            }
            out.print("</select><br><br>");
            out.print("<input type=\"submit\" value=\"Modificar\">");
            out.print("</form>");
        %>
    </body>
</html>
