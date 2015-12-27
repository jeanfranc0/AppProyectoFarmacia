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

        <title>Insertar Cliente</title>
    </head>
    <body>
         <jsp:useBean id="Cliente" class="data.cClienteJuridico" scope="page"></jsp:useBean>
        <%
            String id=request.getParameter("txtId");
            String direccion=request.getParameter("txtDireccion");
            String telefono=request.getParameter("txtTelefono");
            String ruc=request.getParameter("txtRUC");
            String razon=request.getParameter("txtRazon");
            Cliente.conectarse();
            MongoCursor<Document> datos = Cliente.listar();
            if(id!=null)
            {
                Cliente.insertar(Cliente.Identificador(), direccion, telefono, ruc, razon);
                response.sendRedirect("manCliente.jsp");
            }
        %>
        <h2>Insertar Cliente</h2>
        <form action="manClienteJuridicoInsertar.jsp">
            <label for="id">Identificador Cliente: </label>
            <input type="text" name="txtId" value="<%=Cliente.Identificador()%>" required><br><br>
            <label for="Direccion">Direcci&oacuten: </label>
            <input type="text" name="txtDireccion" required minlenght="11" maxlength="11" ><br><br>
            <label for="Telefono">Tel&eacuteno: </label>
            <input type="text" name="txtTelefono" required onkepress="javascript:return validar_numeros(event)" onpaste="return false"><br><br>
            <label for="RUC">RUC: </label>
            <input type="text" name="txtRUC" minlenght="6" maxlength="9" onkepress="javascript:return validar_numeros(event)" onpaste="return false"><br><br>
            <label for="Razon">Razon Social: </label>
            <input type="text" name="txtRazon"  onkeypress="javascript:return validar_numeros(event)" onpaste="return false"><br><br>
            <input type="submit" value="Ingresar">
            
        </form>
    </body>
</html>
