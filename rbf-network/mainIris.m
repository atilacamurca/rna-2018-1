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

    rperm_X = randperm(rows(X));
    rperm_setosa = randperm(rows(X_setosa));
    rperm_versicolor = randperm(rows(X_versicolor));
    rperm_virginica = randperm(rows(X_virginica));

    X_treino = X(rperm_X(1:120),:);
    X_teste = X(rperm_X(121:150),:);

    Y_treino = y(rperm_X(1:120),:);
    Y_teste = y(rperm_X(121:150),:);

    [Pesos, Centros, vies] = treinar(X_treino, Y_treino);

    printf('\n')
    H = calcularInterpolacao(X_teste, Centros, 0.15);
    base_teste = H;
    total_pred_corretas = 0;
    mconfusao = zeros(num_classes, num_classes);
    for index = 1 : rows(base_teste)
        for cl = 1 : num_classes
            calculado(cl) = dot(Pesos(cl, :), [ [vies] base_teste(index,:)]);
        end
        desejado = Y_teste(index, :);
        total_pred_corretas += isequal(desejado, sinalMulticlass(calculado));
        [_, idx_desejado] = max(desejado);
        [_, idx_calculado] = max(calculado);
        mconfusao(idx_desejado, idx_calculado) += 1;
    end

    rowsTeste = rows(Y_teste);
    taxa_de_acerto = total_pred_corretas / rowsTeste * 100;
    Sumario(realizacao) = taxa_de_acerto;

    disp('====  Sumário  =====');
    disp(['Num. Pred corretas: ', num2str(total_pred_corretas), ' de ', num2str(rowsTeste)]);
    disp(['        Realização: ', num2str(realizacao)]);
    disp(['Matriz de Confusão: ', mat2str(mconfusao)]);
    disp(['    Taxa de acerto: ', num2str(taxa_de_acerto)]);
    disp('');

end

disp('====  Sumário Geral  ====');
disp(['        Acurácia: ', num2str(mean(Sumario))]);
disp(['   Desvio Padrão: ', num2str(std(Sumario))]);
