var http=require("http");
var fs = require("fs");
//Include function
var gFun = require("./function");
//gFun.grabar
//Create a server
var s= http.createServer((req, res) => {
    if (req.url === "/leer?") {
        console.log("leemos sentimiento");
        
        res.end();
    } else {
        fs.readFile('../index.html', (err, data) => {
            if (err) {
              res.writeHead(404);
              res.write('File not found!');
            } else {
              res.writeHead(200, {'Content-Type': 'text/html'});
              res.write(data);
            }
            res.end();
          });      
    }

});
    s.listen(8888);
    console.log("Servidor iniciado");