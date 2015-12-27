
var codigo;
function Carga(url, id)
{
    //Creamos un objeto dependiendo del navegador
    var objeto;
    if (window.XMLHttpRequest)
    {
        //Mozilla, Safari, etc
        objeto = new XMLHttpRequest();
    }
    else if (window.ActiveXObject)
    {
        //Nuestro querido IE
        try {
            objeto = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try { //Version mas antigua
                objeto = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {
            }
        }
    }
    if (!objeto)
    {
        alert("No ha sido posible crear un objeto de XMLHttpRequest");
    }
    //Cuando XMLHttpRequest cambie de estado, ejecutamos esta funcion
    objeto.onreadystatechange = function ()
    {
        cargarObjeto(objeto, id);
    };
    objeto.open('GET', url, true); // indicamos con el método open la url a cargar de manera asíncrona
    objeto.send(null); // Enviamos los datos con el metodo send
}
function cargarObjeto(objeto, id)
{
    if (objeto.readyState === 4) //si se ha cargado completamente
    {
        document.getElementById(id).innerHTML = objeto.responseText;
    }
    else //en caso contrario, mostramos un gif simulando una precarga
        document.getElementById(id).innerHTML = "CARGANDO...";
}
function guardar()
{
    document.write("Guardado");
    codigo = document.getElementById("Cod").value;

}
function devolver()
{
    document.getElementsByName("Regresar").value = codigo;
}
function abrirVentana(pagina)
{

    ventana = window.open(pagina, 'ventana_sec', 'scrollbars=no,status=no,resizable=yes,toolbars=0,location=0,directories=0,menubar=0,width=400,height=350');
    ventana.document.open();
}
function validar_letras(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla == 8)
        return true;
    patron = /[A-Za-z\s]/;
    te = String.fromCharCode(tecla);
    return patron.test(te);
}
function validar_numeros(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla == 8)
        return true;
    patron = /[0-9]/;
    te = String.fromCharCode(tecla);
    return patron.test(te);
}
function validar_correo() {
    var correo = document.getElementById("correo").value;
    var contador = 0, cont2 = 0;
    for (var i = 1; i < correo.lenght; i++) {
        if (correo.charAt(i - 1) == "@")
            contador++;
        if (contador == 1) {
            if (correo.charAt(i - 1) == ".")
                cont2++;
        }
    }
    if (contador == 1 && cont2 == 2 || contador == 1)
    {
        alert("correo valido");
    }
    else
    {
        alert("correo no valido");
    }
}

(function () {
    var actualizarHora = function () {
        var fecha = new Date(),
                horas = fecha.getHours(),
                ampm,
                minutos = fecha.getMinutes(),
                segundos = fecha.getSeconds(),
                diaSemana = fecha.getDay(),
                dia = fecha.getDate(),
                mes = fecha.getMonth(),
                year = fecha.getFullYear();

        var pHoras = document.getElementById("horas"),
                pAmpm = document.getElementById("ampm"),
                pMinutos = document.getElementById("minutos"),
                pSegundos = document.getElementById("segundos"),
                pDiaSemana = document.getElementById("diaSemana"),
                pDia = document.getElementById("dia"),
                pMes = document.getElementById("mes"),
                pYear = document.getElementById("year");

        var semana = ["Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"];
        pDiaSemana.textContent = semana[diaSemana];
        pDia.textContent = dia;

        var meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Setiembre", "Octubre", "Noviembre", "Diciembre"];
        pMes.textContent = meses[mes];

        pYear.textContent = year;

        if (horas >= 12)
        {
            horas = horas - 12;
            ampm = 'PM';
        } else
        {
            ampm = 'AM';
        }
        if (horas == 0) {
            horas = 12;
        }
        pHoras.textContent = horas;
        pAmpm.textContent = ampm;
        if (minutos < 10) {
            minutos = "0" + minutos
        }
        ;
        if (segundos < 10) {
            segundos = "0" + segundos
        }
        ;
        pMinutos.textContent = minutos;
        pSegundos.textContent = segundos;
    };

    actualizarHora();
    var intervalo = setInterval(actualizarHora, 1000);

})