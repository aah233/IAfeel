function grabar(response){
    console.log("Grabamos opinión");
    response.writeHead(200, {"Content-Type": "text/html"});
    response.write("Ya hemos grabado la opinion");
    response.end();
}
function leer(response){
    console.log("leemos sentimiento");
    response.writeHead(200, {"Content-Type": "text/html"});
    response.write("Ya hemos mostrado el sentimiento por pantalla");
    response.end();
}
exports.grabar = grabar;
exports.leer = leer;
