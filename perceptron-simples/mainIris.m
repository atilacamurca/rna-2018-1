clear; close all; clc;

%% Carrega X e y de arquivo
load iris-dataset.mat

max_realizacoes = 20;
Sumario = zeros(max_realizacoes, 1);

for realizacao = 1 : max_realizacoes

    X_treino_setosa = X(1:40,:);
    X_teste_setosa = X(41:50,:);
    X_treino_outras = [X(51:90,:) ; X(101:140,:)];
    X_teste_outras = [X(91:100,:) ; X(141:150,:)];

    Y_treino_setosa = y(1:40);
    Y_teste_setosa = y(41:50);
    Y_treino_outras = [y(51:90) ; y(101:140)];
    Y_teste_outras = [y(91:100) ; y(141:150)];

    rperm_setosa = randperm(rows(X_treino_setosa));
    rperm_outras = randperm(rows(X_treino_outras));

    % rpermutacao = randperm(rows(X));
    % X_treino = X(rpermutacao(:,1:120),:);
    X_treino = [X_treino_setosa(rperm_setosa,:) ; X_treino_outras(rperm_outras,:)];
    % y_treino = y(rpermutacao(1:120));
    y_treino = [Y_treino_setosa(rperm_setosa) ; Y_treino_outras(rperm_outras)];
    [pesos, vies] = treinar(X_treino, y_treino);

    % pesos
    base_teste = [X_teste_setosa ; X_teste_outras];
    teste = [Y_teste_setosa ; Y_teste_outras];
    total_pred_corretas = 0;
    mconfusao = zeros(2, 2);
    for index = 1 : rows(base_teste)
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
    disp(['          Acurácia: ', num2str(taxa_de_acerto)]);
    disp('');
    
    %figure(realizacao);
    %plot(X_teste_setosa(:,1:2), Y_teste_setosa, 'bo', X_teste_outras(:,1:2), Y_teste_outras, 'rx');
end

disp('====  Sumário Geral  ====');
disp(['        Acurácia: ', num2str(mean(Sumario))]);
disp(['   Desvio Padrão: ', num2str(std(Sumario))]);
