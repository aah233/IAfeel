clear all %Borrado de todas las variables
fich = "datos3.txt"; %Archivo con los datos de entrenamiento
datos = readtable(fich,'TextType','string');
head(datos)

datos.categoria1=categorical(datos.em1);
histogram(datos.categoria1);, xlabel('clase');, ylabel('frecuencia');, title('Clases');

cvp=cvpartition(datos.categoria1,'Holdout',0.3); %% Tamaño entrenamiento/validadción
datosT=datos(training(cvp),:);
datosV=datos(test(cvp),:);

textodatosT=datosT.msg;
textodatosV=datosV.msg;
YT=datosT.categoria1;
YV=datosV.categoria1;


for i=1:cvp.TrainSize
dT(i)=JTpreptexto(textodatosT(i));
end;
for i=1:cvp.TestSize
dV(i)=JTpreptexto(textodatosV(i));
end
enc=wordEncoding(dT);

dT
dV
nmaxpalabras=max(doclength(dT));
nmaxpalabras=max(nmaxpalabras,max(doclength(dV)));

XV=doc2sequence(enc,dV,'Length',nmaxpalabras); %% 9 es el número de palabras máximo
XT=doc2sequence(enc,dT,'Length',nmaxpalabras);

%Parámetros de la red neuronal
inputSize=1;
embeddingDimension=180;
numHiddenUnits=200;
numWords=enc.NumWords;
numClasses=numel(categories(YT));
%%%%%%%%%%%%
%Estructura de la red neuronal
layers = [ ...
    sequenceInputLayer(inputSize)
    wordEmbeddingLayer(embeddingDimension,numWords)
    lstmLayer(numHiddenUnits,'OutputMode','last')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer]
options = trainingOptions('adam', ...
    'MiniBatchSize',5, ...
    'MaxEpochs',300,...
    'GradientThreshold',3, ...
    'Shuffle','every-epoch', ...
    'ValidationData',{XV,YV}, ...
    'Plots','training-progress', ...
    'Verbose',false);
%%%%%%%%%%%%%%%

net = trainNetwork(XT,YT,layers,options);
save info_lstm net enc nmaxpalabras  %Se crea un archivo con la IA que maneja sentimientos
