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
        <jsp:useBean id="cliente" class="data.cClienteJuridico" scope="page"></jsp:useBean>
        <%           
            String eliminar=request.getParameter("txtEliminar");    
            cliente.conectarse();
            MongoCursor<Document> datos = cliente.listar();
            if(eliminar!=null)
            {
                datos=cliente.buscar("Razon_Social", eliminar);
                Document documento=datos.next();
                cliente.desactivar(documento.getString("Id_Cliente"));
                response.sendRedirect("manCliente.jsp");
            }
            datos=cliente.listarAptos();
            out.print("<h2>Desactivar Cliente</h2><form action=\"manClienteJuridicoDesactivar.jsp\">");
            out.print("Seleccione el Cliente a modificar:");
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

