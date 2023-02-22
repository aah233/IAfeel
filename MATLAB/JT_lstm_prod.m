%load red3
mensaje = [ ...
    "es un producto bueno"];
msgT=JTpreptexto(mensaje);
XNew = doc2sequence(enc,msgT,'Length',nmaxpalabras);
respuesta=classify(net,XNew)