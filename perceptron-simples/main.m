clear; close all; clc;

%% Carrega X e y de arquivo
load workspacePerceptron.mat
% TODO: refazer trecho para obter percentual igual para todas as classes
X_treino_Zero = X(1:20,:);
X_teste_Zero = X(21:30,:);
X_treino_One = X(31:36,:);
X_teste_One = X(37:40,:);

Y_treino_Zero = y(1:20);
Y_teste_Zero = y(21:30);
Y_treino_One = y(31:36);
Y_teste_One = y(37:40);

rperm_Zero = randperm(20);
rperm_One = randperm(6);
% X_treino = X(rpermutacao(:,1:30),:);
X_treino = [X_treino_Zero(rperm_Zero,:) ; X_treino_One(rperm_One,:)];
% y_treino = y(rpermutacao(1:30));
y_treino = [Y_treino_Zero(rperm_Zero) Y_treino_One(rperm_One)];
[pesos, vies, mconfusao] = treinar(X_treino, y_treino);

pesos
mconfusao
base_teste = [X_teste_Zero ; X_teste_One];
teste = [Y_teste_Zero Y_teste_One];
for index = 1 : rows(base_teste)
    % p = rpermutacao(:,index)
    % disp(['predizer linha ', num2str(p)]);
    base_teste(index,:)
    calculado = predizer(pesos, [ [vies] base_teste(index,:)]);
    disp(['calculado: ', num2str(calculado), ', desejado: ', num2str(teste(index))])
    disp('--------------------------------')
end
