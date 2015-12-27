<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Farmacia "Mi Salud"</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="JavaScript" src ="motor.js"> </script>
</head>
<body>
<div id="topPan"><a href="#"><img src="images/logobotica.jpg" title="Green Solutions" alt="Green Solutions" width="204" height="57" border="0"/></a>
  <ul>
    <li><a href="manProveedor.jsp">Proveedor</a></li>
    <li><a href="manProducto.jsp">Producto</a></li>
    <li><a href="manAlmacen.jsp">Almac&eacuten</a></li>
    <li><a href="manCliente.jsp">Cliente</a></li>
    <li><span>Usuario</span></li>     
  </ul>
</div>
<div id="bodyPan">
  <div id="leftPan">
    <h3>Operaciones</h3>
    <ul>
    <li><a href="javascript:Carga('manUsuarioInsertar.jsp', 'rightbodyPan');">Insertar</a></li>
     <li><a href="javascript:Carga('manUsuarioModificar.jsp', 'rightbodyPan');">Modificar</a></li>
     <li><a href="javascript:Carga('manUsuarioActivar.jsp','rightbodyPan');">Activar Cuentas</a></li>
     <li><a href="javascript:Carga('manUsuarioDesactivar.jsp', 'rightbodyPan');">Desactivar Cuentas</a></li>
     <li><a href="javascript:Carga('manUsuarioListar.jsp', 'rightbodyPan');">Listar</a></li>
    </ul>
  </div>
  <div id="rightPan">
    <div id="rightbodyPan">
      <h2>Subir un Archivo</h2>
            <form name="form1" method="post" enctype="multipart/form-data" action="manUsuarioSubirFoto.jsp">
                <%
                    //Aqui se crean las cookies para uso futuro
                    String cookieUsuarioFoto = request.getParameter("cookieUsuarioFoto");
                    Cookie cookie = new Cookie("cookieUsuarioFoto", request.getParameter("Usuario"));
                    cookie.setMaxAge(30); 
                    response.addCookie(cookie);
                %>
                Ingrese foto de <%
                    out.print(request.getParameter("Nombres")+" "+request.getParameter("Apellidos"));
                %> :    <br><br>            
                <input type="file" name="archivo" multiple="">
                <br><br>
                <input type="submit" value="Insertar">
            </form>
    </div>
  </div>
</div>
<div id="footerPan">
  <div id="footernextPan">
    <ul>
      <li><a href="#">Casa</a>|</li>
      <li><a href="#">Procesos</a> |</li>
      <li><a href="#">Reportes</a>|</li>
      <li><a href="#">Salir</a> |</li>
    </ul>
    <p>©green solution todo los derechos reservados</p>
    <ul class="templateworld">
      <li>Design By:</li>
      <li><a href="http://www.templateworld.com">Template World</a></li>
    </ul>
    <div id="footerPanhtml"><a href="http://validator.w3.org/check?uri=referer">XHTML</a></div>
    <div id="footerPancss"><a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a></div>
  </div>
</div>
</body>
</html>

