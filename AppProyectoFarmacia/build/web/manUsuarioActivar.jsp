<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Activar Proveedor</title>
    </head>
    <body>
        <jsp:useBean id="usuario" class="data.cUsuario" scope="page"></jsp:useBean>
        <%           
            String id;
            boolean flag=false;
            usuario.conectarse();
            MongoCursor<Document> datos = usuario.listar();
            Document documento;
            datos=usuario.listarDesactivados();
            while (datos.hasNext())
            {
                documento = datos.next();
                id=request.getParameter(documento.getString("Usuario"));
                if(id!=null)
                {
                    usuario.activar(documento.getString("Usuario"));
                    flag=true;
                }
            }
            if(flag)
            {
             response.sendRedirect("manUsuario.jsp");    
            }
            datos=usuario.listarDesactivados();
            out.print("<h2>Activar Usuario</h2><form action=\"manUsuarioActivar.jsp\">");
            out.print("<table border=\"1\">"); 
            out.print("<tr><th>Nombres</th><th>Apellidos</th><th>DNI</th><th>Activar</th></tr>");
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<tr><th>"+documento.getString("Nombres")+"</th><th>"+documento.getString("Apellidos")+"</th><th>"+documento.getString("DNI")+"</th><th><input type=\"checkbox\" name=\""+documento.getString("Usuario")+"\"></th></tr> " );
            }            
            
            out.print("</table>");
            out.print("<br><br><input type=\"submit\" value=\"Activar\">");
            
            out.print("</form>");
        %>
    </body>
</html>
