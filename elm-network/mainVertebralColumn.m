clear; close all; clc;

%% Carrega X e y de arquivo
load vertebral-column-dataset.mat

max_realizacoes = 20;
Sumario = zeros(max_realizacoes, 1);
num_classes = columns(y);

for realizacao = 1 : max_realizacoes

    rperm_X = randperm(rows(X));
    X_treino = X(rperm_X(1:248),:);
    X_teste = X(rperm_X(249:310),:);
    Y_treino = y(rperm_X(1:248),:);
    Y_teste = y(rperm_X(249:310),:);

    fn_siglog = @(x)(1./(1+exp(-x)));

    [Pesos, PesosEntrada, vies] = treinar(X_treino, Y_treino, fn_siglog);

    printf('\n')
    H = transformarEntrada(X_teste, PesosEntrada, fn_siglog);
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
