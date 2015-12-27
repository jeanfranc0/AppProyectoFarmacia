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
        <jsp:useBean id="cliente" class="data.cClienteNatural" scope="page"></jsp:useBean>
        <%           
            cliente.conectarse();
            MongoCursor<Document> datos = cliente.listar();
            datos=cliente.listarAptos();
            out.print("<h2>Modificar Cliente</h2><form action=\"manClienteNaturalModificarAccion.jsp\">");
            out.print("Seleccione el Cliente a modificar:");
            out.print("<select name=\"txtNombres\">");
            Document documento;
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<option value=\""+documento.getString("Nombres")+"\">"+documento.getString("Nombres")+"</option> " );
            }
            out.print("</select><br><br>");
            out.print("<input type=\"submit\" value=\"Modificar\">");
            out.print("</form>");
        %>
    </body>
</html>
