<%-- 
AUTOR: Rony Villafuerte Serna
FECHA: 10-DIC-2015
DESCRIPCION: 
* Muestra la excepcion en Pagina Web
--%>
<%@page isErrorPage="true" %>
<html>
    <head>
        <title>Mostrando pagina de error</title>
    </head>
    <body>
        <h1>Excepcion encontrada</h1>
        <table width="50%" border="1">
            <tr valign="top">
                <td width="40%"><b>Error:</b></td>
                <td>${pageContext.exception}</td>
            </tr>
            <tr valign="top">
                <td><b>URI:</b></td>
                <td>${pageContext.errorData.requestURI}</td>
            </tr>
            <tr valign="top">
                <td><b>Status code:</b></td>
                <td>${pageContext.errorData.statusCode}</td>
            </tr>
        </table>
    </body>
</html>