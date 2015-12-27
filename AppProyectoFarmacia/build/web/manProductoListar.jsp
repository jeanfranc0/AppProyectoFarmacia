<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Producto</title>
    </head>
    <body>
        <jsp:useBean id="producto" class="data.cProducto" scope="page"></jsp:useBean>
        <%           
            producto.conectarse();
            MongoCursor<Document> datos = producto.listar();
            Document documento;
            datos=producto.listarAptos();
            out.print("<h2>Listar Producto</h2>");
            out.print("<table border=\"1\">"); 
            out.print("<tr><th>Identificador</th><th>Descripci&oacuten</th><th>Marca</th><th>Foto</th></tr>");
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<tr><th>"+documento.getString("Id_Producto")+"</th><th>"+documento.getString("Descripcion")+"</th><th>"+documento.getString("Marca")+"</th><th><a href=\"manProductoVerFoto.jsp?imagen="+documento.getString("Id_Producto")+".jpg\">"+documento.getString("Descripcion")+".jpg</a></th></tr> " );
            }
            out.print("</table>");
        %>
        
    </body>
</html>
