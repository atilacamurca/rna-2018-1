%% Calcular os pesos para uma base X com labels y
%% @deftypefn {} {@var{pesos}, @var{vies}} treinar (@var{X}, @var{y})
%%
%% @end deftypefn

%% Author: Átila Camurça <camurca.home@gmail.com>
%% Created: 2018-05-26
%% https://machinelearningmastery.com/confusion-matrix-machine-learning/
function [pesos, vies] = treinar (X, y)

    % Inicializar pesos com valores aleatórios normalizados
    pesos = (rand(1, columns(X) + 1) .* 0.2 + 0.5) ./ 2;
    % pesos = zeros(1, columns(X) + 1);
    max_iteracoes = 100;
    taxa_aprendizagem = 0.1;
    vies = -1;

    for iteracao = 1 : max_iteracoes
        sum_erro = 0;
        printf('.')
        for index_ = 1 : rows(X)
            % disp(['linha ', num2str(index_)]);
            x_ = [[vies] X(index_, :)]; % obter toda a coluna da linha `index_`
            desejado = y(index_);
            calculado = predizer(pesos, x_);

            erro = desejado - calculado;
            if erro != 0
                pesos = pesos + (taxa_aprendizagem * erro * x_); % atualizar pesos
            end
        end

        % condição de parada, quando não erra somatório do erro é zero
        for index_j = 1 : rows(X)
            x_ = [[vies] X(index_j, :)];
            desejado = y(index_j);
            calculado = predizer(pesos, x_);

            sum_erro += (desejado - calculado != 0);
        end

        if sum_erro == 0
            disp(['convergiu na iteração ', num2str(iteracao)]);
            break
        end

    end

end
