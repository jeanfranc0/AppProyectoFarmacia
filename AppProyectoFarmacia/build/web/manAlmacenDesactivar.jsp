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
            String eliminar=request.getParameter("txtEliminar");    
            almacen.conectarse();
            MongoCursor<Document> datos = almacen.listar();
            if(eliminar!=null)
            {
                datos=almacen.buscar("Id_Almacen", eliminar);
                Document documento=datos.next();
                almacen.desactivar(documento.getString("Id_Almacen"));
                response.sendRedirect("manAlmacen.jsp");
            }
            datos=almacen.listarAptos();
            out.print("<h2>Desactivar Almacen</h2><form action=\"manAlmacenDesactivar.jsp\">");
            out.print("Seleccione el almacen a modificar:");
            out.print("<select name=\"txtEliminar\">");
            Document documento;
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<option value=\""+documento.getString("Id_Almacen")+"\">"+documento.getString("Id_Almacen")+"</option> " );
            }
            out.print("</select><br><br>");
            out.print("<input type=\"submit\" value=\"Desactivar\">");
            out.print("</form>");
        %>
    </body>
</html>

