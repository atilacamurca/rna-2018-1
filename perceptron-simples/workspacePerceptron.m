%% Gera workspace para perceptron
%% usado para resolver o problema do AND
%%
%% Gerar arquivo        : `save -mat workspacePerceptron.mat X y`
%% Carregar variáveis   : `load workspacePerceptron.mat`

ClasseZero = [
    % 0 0
    rand(10, 1) .* 0.2 rand(10, 1) .* 0.2;
    % 0 1
    rand(10, 1) .* 0.2 (rand(10, 1) .* 0.5 + 1.5) ./ 2;
    % 1 0
    (rand(10, 1) .* 0.5 + 1.5) ./ 2 rand(10, 1) .* 0.2;
];
ClasseOne = (rand(10, 2) .* 0.5 + 1.5) ./ 2;

X = [ClasseZero ; ClasseOne];
y = [zeros(30, 1) ; ones(10, 1)];

save -mat workspacePerceptron.mat X y
