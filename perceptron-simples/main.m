clear; close all; clc;

%% Carrega X e y de arquivo
load workspacePerceptron.mat
rpermutacao = randperm(40);
X_treino = X(rpermutacao(:,1:30),:);
y_treino = y(rpermutacao(1:30));
[pesos, vies] = treinar(X_treino, y_treino);

pesos
columns(rpermutacao)
for index = 31 : columns(rpermutacao)
    disp(['predizer linha ', num2str(rpermutacao(:,index))]);
    X(rpermutacao(:,index),:)
    predizer(pesos, [ [vies] X(rpermutacao(:,index),:)])
    disp('--------------------------------')
end
