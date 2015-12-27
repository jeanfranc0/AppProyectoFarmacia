<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error2.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript" type="text/javascript" src="Validacion.js"></script>
        <title>Insertar Producto</title>
    </head>
    <body>
         <jsp:useBean id="producto" class="data.cProducto" scope="page"></jsp:useBean>
        <%
            String id=request.getParameter("txtId");
            String Descripcion=request.getParameter("txtDescripcion");
            String Marca=request.getParameter("txtMarca");
            producto.conectarse();
            MongoCursor<Document> datos = producto.listar();
            if(id!=null)
            {
                producto.insertar(producto.Identificador(), Descripcion, Marca);
                %> 
                <jsp:forward page="manProductoCargarFoto.jsp"> 
                    <jsp:param name="Producto" value="<%=id%>"/> 
                    <jsp:param name="Descripcion" value="<%=Descripcion%>"/> 
                </jsp:forward> 
                <% 
            }
        %>
        <h2>Insertar Producto</h2>
        <form action="manProductoInsertar.jsp">
            <label for="id">Identificador Producto: </label>
            <input type="text" name="txtId" value="<%=producto.Identificador()%>" required><br><br>
            <label for="Descripcion">Descripci&oacuten: </label>
            <input type="text" name="txtDescripcion"  ><br><br>
            <label for="Marca">Marca </label>
            <input type="text" name="txtMarca"  ><br><br>
            <input type="submit" value="Ingresar">
            
        </form>
    </body>
</html>
