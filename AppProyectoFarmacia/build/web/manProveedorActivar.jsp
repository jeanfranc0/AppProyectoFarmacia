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
        <jsp:useBean id="proveedor" class="data.cProveedor" scope="page"></jsp:useBean>
        <%           
            String id;
            boolean flag=false;
            proveedor.conectarse();
            MongoCursor<Document> datos = proveedor.listar();
            Document documento;
            datos=proveedor.listarDesactivados();
            while (datos.hasNext())
            {
                documento = datos.next();
                id=request.getParameter(documento.getString("Id_Proveedor"));
                if(id!=null)
                {
                    proveedor.activar(documento.getString("Id_Proveedor"));
                    flag=true;
                }
            }
            if(flag)
            {
             response.sendRedirect("manProveedor.jsp");    
            }
            datos=proveedor.listarDesactivados();
            out.print("<h2>Activar Proveedor</h2><form action=\"manProveedorActivar.jsp\">");
            out.print("<table border=\"1\">"); 
            out.print("<tr><th>Identificador</th><th>RUC</th><th>Razón Social</th><th>Activar</th></tr>");
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<tr><th>"+documento.getString("Id_Proveedor")+"</th><th>"+documento.getString("RUC")+"</th><th>"+documento.getString("Razon_Social")+"</th><th><input type=\"checkbox\" name=\""+documento.getString("Id_Proveedor")+"\"></th></tr> " );
            }            
            
            out.print("</table>");
            out.print("<br><br><input type=\"submit\" value=\"Activar\">");
            
            out.print("</form>");
        %>
    </body>
</html>

