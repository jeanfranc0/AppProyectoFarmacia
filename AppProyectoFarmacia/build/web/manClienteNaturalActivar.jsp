<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Activar Cliente</title>
    </head>
    <body>
        <jsp:useBean id="cliente" class="data.cClienteNatural" scope="page"></jsp:useBean>
        <%           
            String id;
            boolean flag=false;
            cliente.conectarse();
            MongoCursor<Document> datos = cliente.listar();
            Document documento;
            datos=cliente.listarDesactivados();
            while (datos.hasNext())
            {
                documento = datos.next();
                id=request.getParameter(documento.getString("Id_Cliente"));
                if(id!=null)
                {
                    cliente.activar(documento.getString("Id_Cliente"));
                    flag=true;
                }
            }
            if(flag)
            {
             response.sendRedirect("manCliente.jsp");    
            }
            datos=cliente.listarDesactivados();
            out.print("<h2>Activar Cliente</h2><form action=\"manClienteNaturalActivar.jsp\">");
            out.print("<table border=\"1\">"); 
            out.print("<tr><th>Identificador</th><th>DNI</th><th>Nombres</th><th>Activar</th></tr>");
            while (datos.hasNext())
            {
                documento = datos.next();
                out.println("<tr><th>"+documento.getString("Id_Cliente")+"</th><th>"+documento.getString("DNI")+"</th><th>"+documento.getString("Nombres")+"</th><th><input type=\"checkbox\" name=\""+documento.getString("Id_Cliente")+"\"></th></tr> " );
            }            
            
            out.print("</table>");
            out.print("<br><br><input type=\"submit\" value=\"Activar\">");
            
            out.print("</form>");
        %>
    </body>
</html>

