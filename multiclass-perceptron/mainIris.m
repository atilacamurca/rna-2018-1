clear; close all; clc;

%% Carrega X e y de arquivo
load iris-dataset.mat

max_realizacoes = 20;
Sumario = zeros(max_realizacoes, 1);
num_classes = columns(y);

fn_siglog = @(x)(x .* (1 - x));
fn_sinal_siglog = @(x)(1 ./ (1 + exp(-x)));

fn_tanh = @(x)(0.5 .* (1 - x.^2));
fn_sinal_tanh = @(x)(1 - exp(-x) ./ (1 + exp(-x)));

fn_linear = @(x)(1);
fn_sinal_linear = @(x)(x);

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

    [Pesos, vies] = treinar(X_treino, Y_treino, num_classes, fn_sinal_siglog, fn_siglog);

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
        total_pred_corretas += isequal(desejado, sinal(calculado));
        [_, idx_desejado] = max(desejado);
        [_, idx_calculado] = max(calculado);
        mconfusao(idx_desejado, idx_calculado) += 1;
    end

    rowsTeste = rows(teste);
    taxa_de_acerto = total_pred_corretas / rows(teste) * 100;
    Sumario(realizacao) = taxa_de_acerto;

    disp(['Num. Pred corretas: ', num2str(total_pred_corretas), ' de ', num2str(rowsTeste)]);
    disp('====  Sumário  =====');
    disp(['        Realização: ', num2str(realizacao)]);
    disp(['Matriz de Confusão: ', mat2str(mconfusao)]);
    disp(['    Taxa de Acerto: ', num2str(taxa_de_acerto)]);
    disp('');

    %figure(realizacao);
    %plot(X_teste_setosa(:,1:2), Y_teste_setosa, 'bo', X_teste_outras(:,1:2), Y_teste_outras, 'rx');
end

disp('====  Sumário Geral  ====');
disp(['        Acurácia: ', num2str(mean(Sumario))]);
disp(['   Desvio Padrão: ', num2str(std(Sumario))]);
