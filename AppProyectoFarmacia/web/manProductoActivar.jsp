<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Activar Producto</title>
    </head>
    <body>
        <jsp:useBean id="producto" class="data.cProducto" scope="page"></jsp:useBean>
        <%           
            String id;
            boolean flag=false;
            producto.conectarse();
            MongoCursor<Document> datos = producto.listar();
            Document documento;
            datos=producto.listarDesactivados();
            while (datos.hasNext())
            {
                documento = datos.next();
                id=request.getParameter(documento.getString("Id_Producto"));
                if(id!=null)
                {
                    producto.activar(documento.getString("Id_Producto"));
                    flag=true;
                }
            }
            if(flag)
            {
             response.sendRedirect("manProducto.jsp");    
            }
            datos=producto.listarDesactivados();
            out.print("<h2>Activar Producto</h2><form action=\"manProductoActivar.jsp\">");
            out.print("<table border=\"1\">"); 
            out.print("<tr><th>Identificador</th><th>Descripcion</th><th>Marca</th><th>Activar</th></tr>");
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<tr><th>"+documento.getString("Id_Producto")+"</th><th>"+documento.getString("Descripcion")+"</th><th>"+documento.getString("Marca")+"</th><th><input type=\"checkbox\" name=\""+documento.getString("Id_Producto")+"\"></th></tr> " );
            }            
            
            out.print("</table>");
            out.print("<br><br><input type=\"submit\" value=\"Activar\">");
            
            out.print("</form>");
        %>
    </body>
</html>


