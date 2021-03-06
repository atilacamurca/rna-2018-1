clear; close all; clc;

X = normalizar(linspace(-10, 10)');

% y = f(x) = 2x + 3
y = 2 * X + 3;
% y_ruido = y + rand(rows(y), 1) .* 4 + 2;
y_ruido = y + (rand(rows(y), 1) .* 0.5 + 0.5) ./ 2;
% plot(X, y_ruido', 'o');

max_realizacoes = 20;
Sumario = zeros(max_realizacoes, 1);

for realizacao = 1 : max_realizacoes

    rperm = randperm(rows(X));
    X_treino = X(rperm(1:80), :);
    y_treino = y_ruido(rperm(1:80));

    [pesos, vies, saidas, mse, rmse] = treinar(X_treino, y_treino);

    disp('');
    pesos
    disp('====  Sumário  =====');
    disp(['   Realização: ', num2str(realizacao)]);
    disp(['   MSE Treino: ', mat2str(mse)]);
    disp(['  RMSE Treino: ', num2str(rmse)]);
    disp('');

    base_teste = X(rperm(81:100), :);
    teste = y_ruido(rperm(81:100));

    num_linhas = rows(base_teste);
    saidas = zeros(num_linhas, 1);
    realizacao_mse = 0;
    realizacao_rmse = 0;
    for index = 1 : num_linhas
        x_ = [ [vies] base_teste(index,:)];
        calculado = dot(pesos, x_);
        desejado = teste(index);
        disp(['desejado: ', num2str(desejado), ', calculado: ', num2str(calculado)]);
        saidas(index) = calculado;
    end

    realizacao_mse = meansq(teste - saidas); % Erro Quadrático Médio.
    realizacao_rmse = sqrt(mse);
    Sumario(realizacao, 1) = realizacao_mse;
    Sumario(realizacao, 2) = realizacao_rmse;
    
    disp('');
    disp(['    MSE Teste: ', mat2str(mse)]);
    disp(['   RMSE Teste: ', num2str(rmse)]);
    disp('');

end

disp('====  Sumário Geral  ====');
disp(['    MSE: ', num2str(mean(Sumario(:, 1)))]);
disp(['   RMSE: ', num2str(mean(Sumario(:, 2)))]);
