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
            String eliminar=request.getParameter("txtEliminar");    
            proveedor.conectarse();
            MongoCursor<Document> datos = proveedor.listar();
            if(eliminar!=null)
            {
                datos=proveedor.buscar("Razon_Social", eliminar);
                Document documento=datos.next();
                proveedor.desactivar(documento.getString("Id_Proveedor"));
                response.sendRedirect("manProveedor.jsp");
            }
            datos=proveedor.listarAptos();
            out.print("<h2>Desactivar Proveedor</h2><form action=\"manProveedorDesactivar.jsp\">");
            out.print("Seleccione el proveedor a modificar:");
            out.print("<select name=\"txtEliminar\">");
            Document documento;
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<option value=\""+documento.getString("Razon_Social")+"\">"+documento.getString("Razon_Social")+"</option> " );
            }
            out.print("</select><br><br>");
            out.print("<input type=\"submit\" value=\"Desactivar\">");
            out.print("</form>");
        %>
    </body>
</html>

