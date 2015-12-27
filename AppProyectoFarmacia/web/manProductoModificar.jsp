<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Producto</title>
    </head>
    <body>
        <jsp:useBean id="producto" class="data.cProducto" scope="page"></jsp:useBean>
        <%           
            producto.conectarse();
            MongoCursor<Document> datos = producto.listar();
            datos=producto.listarAptos();
            out.print("<h2>Modificar Producto</h2><form action=\"manProductoModificarAccion.jsp\">");
            out.print("Seleccione el producto a modificar:");
            out.print("<select name=\"txtDescripcion\">");
            Document documento;
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<option value=\""+documento.getString("Descripcion")+"\">"+documento.getString("Descripcion")+"</option> " );
            }
            out.print("</select><br><br>");
            out.print("<input type=\"submit\" value=\"Modificar\">");
            out.print("</form>");
        %>
    </body>
</html>
