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
         <jsp:useBean id="Cliente" class="data.cClienteNatural" scope="page"></jsp:useBean>
        <%
            String id=request.getParameter("txtId");
            String direccion=request.getParameter("txtDireccion");
            String telefono=request.getParameter("txtTelefono");
            String dni=request.getParameter("txtDNI");
            String nombres=request.getParameter("txtNombres");
            String apellidos=request.getParameter("txtApellidos");            
            Cliente.conectarse();
            MongoCursor<Document> datos = Cliente.listar();
            if(id!=null)
            {
                Cliente.insertar(Cliente.Identificador(), direccion, telefono, dni, nombres, apellidos);
                response.sendRedirect("manCliente.jsp");
            }
        %>
        <h2>Insertar Cliente</h2>
        <form action="manClienteNaturalInsertar.jsp">
            <label for="id">Identificador Cliente: </label>
            <input type="text" name="txtId" value="<%=Cliente.Identificador()%>" required><br><br>
            <label for="Direccion">Direcci&oacuten: </label>
            <input type="text" name="txtDireccion" required minlenght="11" maxlength="11" ><br><br>
            <label for="Telefono">Tel&eacuteno: </label>
            <input type="text" name="txtTelefono" onkepress="javascript:return validar_numeros(event)" onpaste="return false" required ><br><br>
            <label for="DNI">DNI: </label>
            <input type="text" name="txtDNI" minlenght="6" maxlength="9" onkepress="javascript:return validar_numeros(event)" onpaste="return false"><br><br>
            <label for="Nombres">Nombres: </label>
            <input type="text" name="txtNombres" onkeypress="javascript:return validar_letras(event)" onpaste="return false"><br><br>
            <label for="Apellidos">Apellidos: </label>
            <input type="text" name="txtApellidos"  onkeypress="javascript:return validar_letras(event)" onpaste="return false"><br><br>
            <input type="submit" value="Ingresar">
            
        </form>
    </body>
</html>
