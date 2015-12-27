<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.gridfs.GridFSInputFile"%>
<%@page import="com.mongodb.gridfs.GridFS"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="org.apache.commons.fileupload.util.Streams"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.commons.fileupload.FileItemStream"%>
<%@page import="org.apache.commons.fileupload.FileItemIterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Subiendo archivo</h1>
        <%
            // creando nuevo archivo para manejar las subidas
            ServletFileUpload upload = new ServletFileUpload();
            // gestionando el o los archivos subidos
            FileItemIterator iter = upload.getItemIterator(request);
            while (iter.hasNext()) {
                FileItemStream item = iter.next();
                InputStream stream = item.openStream();
                if (item.isFormField()) {
                    out.println(Streams.asString(stream) + " detectado.<BR>");
                } else {//desde este modulo podemos hacer loq ue querramos con el INPUTSTREAM
                    out.println( item.getName() + " ha sido subido a la BD.<br>");
                    //INSERTAR EN BD
                    //conexio a base de datos
                    MongoClient miCliente = new MongoClient("localhost", 27017);
                    MongoDatabase baseDatos = miCliente.getDatabase("prueba");
                    String nombreArch = item.getName();
                    
                        //revisando existencia de cookies
                        Cookie[] cookies = request.getCookies();
                        for (int i = 0; i < cookies.length; i++)
                         {
                            if(cookies[i].getName().equals("cookieProductoFoto"))
                                    {
                                        nombreArch=cookies[i].getValue()+".jpg";                                    
                                    }
                        }
                       
                    GridFS fsArchivo = new GridFS(miCliente.getDB("prueba"), "fotoProducto");  //accediendo a coleccion "archivosGrandes"
                    GridFSInputFile gfsarchivo = fsArchivo.createFile(stream);  //creando archivo en BD desde INPUTSTREAM
                    gfsarchivo.setFilename(nombreArch);  //colocando el nombre de archivo en base
                    gfsarchivo.save();
                }
            }
            
                response.sendRedirect("manProducto.jsp");
        %>
    </body>
</html>

