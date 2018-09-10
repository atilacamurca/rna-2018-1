clear; close all; clc;

%% Carrega X e y de arquivo
load iris-dataset.mat

max_realizacoes = 20;
Sumario = zeros(max_realizacoes, 1);
num_classes = columns(y);

for realizacao = 1 : max_realizacoes

    X_setosa = X(1:50,:);
    X_versicolor = X(51:100,:);
    X_virginica = X(101:150,:);

    y_setosa = y(1:50,:);
    y_versicolor = y(51:100,:);
    y_virginica = y(101:150,:);

    rperm_setosa = randperm(rows(X_setosa));
    rperm_versicolor = randperm(rows(X_versicolor));
    rperm_virginica = randperm(rows(X_virginica));

    X_treino = [
        X_setosa(rperm_setosa(1:40),:);
        X_versicolor(rperm_versicolor(1:40),:);
        X_virginica(rperm_virginica(1:40),:)
    ];

    X_teste = [
        X_setosa(rperm_setosa(41:50),:);
        X_versicolor(rperm_versicolor(41:50),:);
        X_virginica(rperm_virginica(41:50),:)
    ];

    Y_treino = [
        y_setosa(rperm_setosa(1:40),:);
        y_versicolor(rperm_versicolor(1:40),:);
        y_virginica(rperm_virginica(1:40),:)
    ];

    Y_teste = [
        y_setosa(rperm_setosa(41:50),:);
        y_versicolor(rperm_versicolor(41:50),:);
        y_virginica(rperm_virginica(41:50),:)
    ];

    [Pesos, vies] = treinar(X_treino, Y_treino);

    printf('\n')
    Pesos
    base_teste = X_teste;
    teste = Y_teste;
    total_pred_corretas = 0;
    mconfusao = zeros(num_classes, num_classes);
    for index = 1 : rows(base_teste)
        for cl = 1 : num_classes
            calculado(cl) = dot(Pesos(cl, :), [ [vies] base_teste(index,:)]);
        end
        desejado = teste(index, :);
        total_pred_corretas += isequal(desejado, sinalMulticlass(calculado));
        [_, idx_desejado] = max(desejado);
        [_, idx_calculado] = max(calculado);
        mconfusao(idx_desejado, idx_calculado) += 1;
    end

    total_pred_corretas
    taxa_de_acerto = total_pred_corretas / rows(teste) * 100;
    Sumario(realizacao) = taxa_de_acerto;

    disp('====  Sumário  =====');
    disp(['        Realização: ', num2str(realizacao)]);
    disp(['Matriz de Confusão: ', mat2str(mconfusao)]);
    disp(['          Acurácia: ', num2str(taxa_de_acerto)]);
    disp('');

end

disp('====  Sumário Geral  ====');
disp(['        Acurácia: ', num2str(mean(Sumario))]);
disp(['   Desvio Padrão: ', num2str(std(Sumario))]);
