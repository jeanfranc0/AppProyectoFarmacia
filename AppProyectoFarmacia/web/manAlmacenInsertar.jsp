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
        <title>Insertar Almacen</title>
    </head>
    <body>
        
         <jsp:useBean id="almacen" class="data.cAlmacen" scope="page"></jsp:useBean>
        <%
            String id=request.getParameter("txtId");
            String nombre=request.getParameter("txtNombre");
            String ubicacion=request.getParameter("txtUbicacion");           
            almacen.conectarse();
            MongoCursor<Document> datos = almacen.listar();
            if(id!=null)
            {
                almacen.insertar(almacen.Identificador(), nombre, ubicacion);
                response.sendRedirect("manAlmacen.jsp");
            }
        %>
        <h2>Insertar Almacen</h2>
        <form name="form1" action="manAlmacenInsertar.jsp">
            <label for="id">Identificador Almacen: </label>
            <input type="text" name="txtId" value="<%=almacen.Identificador()%>" required><br><br>
            <label for="RUC">Nombre: </label>
            <input type="text" name="txtNombre" required minlenght="10" maxlength="50" onkeypress="javascript:return validar_letras(event)" onpaste="return false"><br><br>
            <label for="Razon">Ubicaci&oacuten: </label>
            <input type="text" name="txtUbicacion" required ><br><br>
            <input type="submit" value="Ingresar">           
        </form>
    </body>
</html>
