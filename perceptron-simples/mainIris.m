clear; close all; clc;

%% Carrega X e y de arquivo
load iris-dataset.mat

% TODO: refazer trecho para obter percentual igual para todas as classes
rpermutacao = randperm(rows(X));
X_treino = X(rpermutacao(:,1:120),:);
y_treino = y(rpermutacao(1:120));
[pesos, vies, mconfusao] = treinar(X_treino, y_treino);

pesos
mconfusao
for index = 121 : columns(rpermutacao)
    p = rpermutacao(:,index)
    disp(['predizer linha ', num2str(p)]);
    X(p,:)
    calculado = predizer(pesos, [ [vies] X(p,:)]);
    disp(['calculado: ', num2str(calculado), ', desejado: ', num2str(y(p))])
    disp('--------------------------------')
end
