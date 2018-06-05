clear; close all; clc;

%% Carrega X e y de arquivo
load workspacePerceptron.mat

for realizacao = 1 : 20

    X_treino_Zero = X(1:20,:);
    X_teste_Zero = X(21:30,:);
    X_treino_One = X(31:36,:);
    X_teste_One = X(37:40,:);

    Y_treino_Zero = y(1:20);
    Y_teste_Zero = y(21:30);
    Y_treino_One = y(31:36);
    Y_teste_One = y(37:40);

    rperm_Zero = randperm(20);
    rperm_One = randperm(6);

    X_treino = [X_treino_Zero(rperm_Zero,:) ; X_treino_One(rperm_One,:)];
    y_treino = [Y_treino_Zero(rperm_Zero) ; Y_treino_One(rperm_One)];
    [pesos, vies] = treinar(X_treino, y_treino);

    pesos
    base_teste = [X_teste_Zero ; X_teste_One];
    teste = [Y_teste_Zero ; Y_teste_One];
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

    acuracia = total_pred_corretas / rows(teste) * 100;

    disp('====  Sumário  =====');
    disp(['        Realização: ', num2str(realizacao)]);
    disp(['Matriz de Confusão: ', mat2str(mconfusao)]);
    disp(['          Acurácia: ', num2str(acuracia)]);
    disp('');
    
    %figure(realizacao);
    %dots = -2:0.005:2;
    % plot(X_teste_Zero, Y_teste_Zero, 'bo', X_teste_One, Y_teste_One, 'rx');
    %plot(dots, (pesos(2) .* dots) / pesos(1) * pesos(3), 'ko',
    %    X_teste_Zero, Y_teste_Zero, 'b*', X_teste_One, Y_teste_One, 'rx');
end