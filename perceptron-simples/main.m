clear; close all; clc;

%% Carrega X e y de arquivo
load workspacePerceptron.mat

max_realizacoes = 20;
Sumario = zeros(20, 1);

for realizacao = 1 : max_realizacoes

    rperm_Zero = randperm(30);
    rperm_One = randperm(10) + 30;
    
    X_treino = [X(rperm_Zero(1:20),:) ; X(rperm_One(1:6),:)];
    X_teste = [X(rperm_Zero(21:30),:) ; X(rperm_One(7:10),:)];
    
    y_treino = [y(rperm_Zero(1:20)) ; y(rperm_One(1:6))];
    y_teste = [y(rperm_Zero(21:30)) ; y(rperm_One(7:10))];

    [pesos, vies] = treinar(X_treino, y_treino);

    pesos
    base_teste = X_teste;
    teste = y_teste;
    total_pred_corretas = 0;
    mconfusao = zeros(2, 2);
    for index = 1 : rows(base_teste)
        % base_teste(index,:);
        calculado = predizer(pesos, [ [vies] base_teste(index,:)]);
        % disp(['calculado: ', num2str(calculado), ', desejado: ', num2str(teste(index))]);
        % disp('--------------------------------');
        desejado = teste(index);
        total_pred_corretas += (desejado == calculado);
        mconfusao(desejado + 1, calculado + 1) += 1;
    end

    taxa_de_acerto = total_pred_corretas / rows(teste) * 100;
    Sumario(realizacao) = taxa_de_acerto;

    disp('====  Sumário  =====');
    disp(['        Realização: ', num2str(realizacao)]);
    disp(['Matriz de Confusão: ', mat2str(mconfusao)]);
    disp(['    Taxa de Acerto: ', num2str(taxa_de_acerto)]);
    disp('');

    %figure(realizacao);
    %dots = -2:0.005:2;
    % plot(X_teste_Zero, Y_teste_Zero, 'bo', X_teste_One, Y_teste_One, 'rx');
    %plot(dots, (pesos(2) .* dots) / pesos(1) * pesos(3), 'ko',
    %    X_teste_Zero, Y_teste_Zero, 'b*', X_teste_One, Y_teste_One, 'rx');
end

disp('====  Sumário Geral  ====');
disp(['        Acurácia: ', num2str(mean(Sumario))]);
disp(['   Desvio Padrão: ', num2str(std(Sumario))]);

% Plot hyperplano classificador
% x1 = -1:1:1;
% x2 = - (pesos(3) + x1 * pesos(1)) / pesos(2);
% plot(x1,x2,'g');
% plot(X_teste, 'ro', X_teste_One, 'bo');
