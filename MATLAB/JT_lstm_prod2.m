
load info_lstm %Este archivo lo genera la primera vez que se ejecuta la nueva versión de JT_lstm
%%%%%%%%Contiene la IA que hemos entrenado y otras variables auxiliares
%%%%%%%%Cada vez que se ejecute JT_lstm, habrá un archivo info_lstm
%%%%%%%%distinto

fichero_opinion = "opinion.txt"; %Aquí guardamos la opinión desde la página web
fichero_sentimiento="sentimiento.txt"; %Este es el fichero que saca Matlab

while exist("opinion.txt") %Mientras no exista opinión, no funciona
    opinion=fileread(fichero_opinion); 
    delete(fichero_opinion); %Una vez leído el fichero, lo borra
    
    
    %%%%%%%%%%%%%%%%%%%%%%%
    msgT=JTpreptexto(opinion);
    XNew = doc2sequence(enc,msgT,'Length',nmaxpalabras);
    respuesta=classify(net,XNew) %Calcula el sentimiento asociado
    %%%%%%%%%%%%%%%%%%%%%%%%

    fileID = fopen(fichero_sentimiento,'w');
    fprintf(fileID,'%s\n',respuesta);
    fclose(fileID);
    n=20;
    pause(n); %Hay n segundos para buscar un nuevo fichero de opinión.
    
end

