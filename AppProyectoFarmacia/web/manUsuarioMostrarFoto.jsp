<%@page import="com.mongodb.gridfs.GridFSInputFile"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.mongodb.MongoException"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.mongodb.gridfs.GridFSDBFile"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.gridfs.GridFS"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            MongoClient mCliente = new MongoClient("localhost", 27017);
            DB db = mCliente.getDB("prueba");
            GridFS fsArchivo = new GridFS(db, "fotoAlumno");            
            String nomArchivo = request.getParameter("imagen");            
            GridFSDBFile imgPmostrar = fsArchivo.findOne(nomArchivo);
            response.setContentType("image/jpg");
            OutputStream salida = response.getOutputStream();
            imgPmostrar.writeTo(salida);
            salida.flush();
            salida.close();  
        %>
    </body>
</html>
