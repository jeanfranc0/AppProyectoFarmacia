<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Activar Almacen</title>
    </head>
    
    <body>
        <jsp:useBean id="almacen" class="data.cAlmacen" scope="page"></jsp:useBean>
        <%           
            String id;
            boolean flag=false;
            almacen.conectarse();
            MongoCursor<Document> datos = almacen.listar();
            Document documento;
            datos=almacen.listarDesactivados();
            while (datos.hasNext())
            {
                documento = datos.next();
                id=request.getParameter(documento.getString("Id_Almacen"));
                if(id!=null)
                {
                    almacen.activar(documento.getString("Id_Almacen"));
                    flag=true;
                }
            }
            if(flag)
            {
             response.sendRedirect("manAlmacen.jsp");    
            }
            datos=almacen.listarDesactivados();
            out.print("<h2>Activar Almacen</h2><form action=\"manAlmacenActivar.jsp\">");
            out.print("<table border=\"1\">"); 
            out.print("<tr><th>Identificador</th><th>Nombre</th><th>Ubicacion</th><th>Activar</th></tr>");
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<tr><th>"+documento.getString("Id_Almacen")+"</th><th>"+documento.getString("Nombre")+"</th><th>"+documento.getString("Ubicacion")+"</th><th><input type=\"checkbox\" name=\""+documento.getString("Id_Almacen")+"\"></th></tr> " );
            }            
            
            out.print("</table>");
            out.print("<br><br><input type=\"submit\" value=\"Activar\">");
            
            out.print("</form>");
        %>
    </body>
</html>
