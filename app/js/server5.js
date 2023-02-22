
var http=require("http");
var url = require ("url");

function iniciar(encaminar,h){
    pagina=`<html>
    <link rel="icon" type="image/png" href="favicon.png"/>
    <p> Hola Mundo </p>
    </html>
    `
    function gestorPeticiones(request,response) {
        var direc = url.parse(request.url).pathname;
        console.log("petición recibida: "+ direc);
        encaminar(direc,h,response);
        // Toda la gestión de salida se ha ido de aquí
        
    
    }
    var s=http.createServer(gestorPeticiones);
    s.listen(8888);
    console.log("Servidor iniciado")
}
// hemos creado la función iniciar para crear  un 
// módulo Node js y exportar dicha función
exports.iniciar=iniciar;
