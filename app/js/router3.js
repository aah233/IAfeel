// Módulo de encaminamiento de peticiones
// Entregar la dirección URL y los parámetros GET o POST 
// que vayan en la petición

function encaminar(direccion,h,response){
    console.log("Encaminamos una petición hecha a través de"+direccion)
    // ahora sí...
    if (typeof h[direccion] === 'function' ){
        h[direccion](response);
    }else{
        console.log("No hay operación definida para "+direccion);
        response.writeHead(404,{"Content-Type": "text/html"});
        response.write("404 AYYY, QUE GANAS TENIA DE PROVOCAR ESTE ERROR!");
        response.end();
    }
}
exports.encaminar = encaminar;