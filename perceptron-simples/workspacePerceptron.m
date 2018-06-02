%% Gera workspace para perceptron
%% usado para resolver o problema do AND
%%
%% Gerar arquivo        : `save -mat workspacePerceptron.mat X y`
%% Carregar variáveis   : `load workspacePerceptron.mat`

ClasseZero = [rand(30, 1) .* 0.5 rand(30, 1)];
ClasseOne = rand(10, 2) .* 0.5 + 0.5;

X = [ClasseZero ; ClasseOne];
y = [zeros(1, 30) ones(1, 10)];
