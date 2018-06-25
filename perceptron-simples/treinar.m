%% Calcular os pesos para uma base X com labels y
%% @deftypefn {} {@var{pesos}, @var{vies}} treinar (@var{X}, @var{y})
%%
%% @end deftypefn

%% Author: Átila Camurça <camurca.home@gmail.com>
%% Created: 2018-05-26
%% https://machinelearningmastery.com/confusion-matrix-machine-learning/
function [pesos, vies] = treinar (X, y)

    [num_linhas, num_colunas] = size(X);
    % Inicializar pesos com valores aleatórios normalizados
    pesos = (rand(1, num_colunas + 1) .* 0.2 + 0.5) ./ 2;
    % pesos = zeros(1, columns(X) + 1);
    max_iteracoes = 100;
    taxa_aprendizagem = 0.1;
    vies = -1;

    for iteracao = 1 : max_iteracoes
        rperm = randperm(num_linhas);
        sum_erro = 0;
        printf('.');
        for idx = 1 : num_linhas
            index_ = rperm(idx);
            % disp(['linha ', num2str(index_)]);
            x_ = [[vies] X(index_, :)]; % obter toda a coluna da linha `index_`
            desejado = y(index_);
            calculado = predizer(pesos, x_);

            erro = desejado - calculado;
            pesos = pesos + (taxa_aprendizagem * erro * x_); % atualizar pesos
        end

        % condição de parada, quando não erra somatório do erro é zero
        for index_j = 1 : num_linhas
            x_ = [[vies] X(index_j, :)];
            desejado = y(index_j);
            calculado = predizer(pesos, x_);

            sum_erro += (desejado - calculado != 0);
        end

        if sum_erro == 0
            disp(['Convergiu na iteração ', num2str(iteracao)]);
            break
        end

    end

end
