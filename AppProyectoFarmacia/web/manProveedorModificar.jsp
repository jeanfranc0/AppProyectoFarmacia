<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Proveedor</title>
    </head>
    <body>
        <jsp:useBean id="proveedor" class="data.cProveedor" scope="page"></jsp:useBean>
        <%           
            proveedor.conectarse();
            MongoCursor<Document> datos = proveedor.listar();
            datos=proveedor.listarAptos();
            out.print("<h2>Modificar Proveedor</h2><form action=\"manProveedorModificarAccion.jsp\">");
            out.print("Seleccione el proveedor a modificar:");
            out.print("<select name=\"txtRazon\">");
            Document documento;
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<option value=\""+documento.getString("Razon_Social")+"\">"+documento.getString("Razon_Social")+"</option> " );
            }
            out.print("</select><br><br>");
            out.print("<input type=\"submit\" value=\"Modificar\">");
            out.print("</form>");
        %>
    </body>
</html>
