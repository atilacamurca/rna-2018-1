clear; close all; clc;

%% Carrega X e y de arquivo
load iris-dataset.mat

max_realizacoes = 1;
Sumario = zeros(max_realizacoes, 1);
num_classes = columns(y);

for realizacao = 1 : max_realizacoes

    X_treino_setosa = X(1:40,:);
    X_teste_setosa = X(41:50,:);
    %% TODO: substituir outras por parte de versicolor e virginica
    X_treino_outras = [X(51:90,:) ; X(101:140,:)];
    X_teste_outras = [X(91:100,:) ; X(141:150,:)];

    Y_treino_setosa = y(1:40,:);
    Y_teste_setosa = y(41:50,:);
    Y_treino_outras = [y(51:90,:) ; y(101:140,:)];
    Y_teste_outras = [y(91:100,:) ; y(141:150,:)];

    rperm_setosa = randperm(rows(X_treino_setosa));
    rperm_outras = randperm(rows(X_treino_outras));

    X_treino = [X_treino_setosa(rperm_setosa,:) ; X_treino_outras(rperm_outras,:)];
    y_treino = [Y_treino_setosa(rperm_setosa,:) ; Y_treino_outras(rperm_outras,:)];
    [Pesos, vies] = treinar(X_treino, y_treino, num_classes);

    printf('\n')
    Pesos
    base_teste = [X_teste_setosa ; X_teste_outras];
    teste = [Y_teste_setosa ; Y_teste_outras];
    total_pred_corretas = 0;
    mconfusao = zeros(num_classes, num_classes);
    for index = 1 : rows(base_teste)
        for cl = 1 : num_classes
            calculado(cl) = dot(Pesos(cl, :), [ [vies] base_teste(index,:)]);
        end
        desejado = teste(index, :);
        sum(desejado - calculado) == 0
        total_pred_corretas += sum(desejado - sinal(calculado)) == 0;
        [_, idx_desejado] = max(desejado);
        [_, idx_calculado] = max(calculado);
        mconfusao(idx_desejado, idx_calculado) += 1;
    end

    %% TODO: taxa_de_acerto está sempre apresentando valor 100%
    total_pred_corretas
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
