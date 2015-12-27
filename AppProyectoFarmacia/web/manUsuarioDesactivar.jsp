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
        <jsp:useBean id="usuario" class="data.cUsuario" scope="page"></jsp:useBean>
        <%           
            String eliminar=request.getParameter("txtEliminar");    
            usuario.conectarse();
            MongoCursor<Document> datos = usuario.listar();
            if(eliminar!=null)
            {
                datos=usuario.buscar("Apellidos", eliminar);
                Document documento=datos.next();
                usuario.desactivar(documento.getString("Usuario"));
                response.sendRedirect("manUsuario.jsp");
            }
            datos=usuario.listarAptos();
            out.print("<h2>Desactivar Usuario</h2><form action=\"manUsuarioDesactivar.jsp\">");
            out.print("Seleccione el usuario a modificar:");
            out.print("<select name=\"txtEliminar\">");
            Document documento;
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<option value=\""+documento.getString("Apellidos")+"\">"+documento.getString("Nombres")+" "+documento.getString("Apellidos")+"</option> " );
            }
            out.print("</select><br><br>");
            out.print("<input type=\"submit\" value=\"Desactivar\">");
            out.print("</form>");
        %>
    </body>
</html>

