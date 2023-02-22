var server= require("./server5");
var router=require("./router3");
var gPet = require("./gestorpeticiones2");

// Añadimos un array de funciones para manejar las distintas
// peticiones
var h ={};
h["/"]= gPet.grabar;
h["/grabaropinion"]=gPet.grabar;
h["/leersentimiento"]= gPet.leer;
server.iniciar(router.encaminar, h);
