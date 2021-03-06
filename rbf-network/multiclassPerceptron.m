%% -*- texinfo -*-
%% @deftypefn {} {@var{Pesos} =, @var{vies}} treinar (@var{X}, @var{y}, @var{num_classes})
%%
%% @seealso{}
%% @end deftypefn

%% Author: Átila Camurça <atila@the-machine>
%% Created: 2018-08-11

function [Pesos, vies] = multiclassPerceptron (X, y, num_classes)

    [num_linhas, num_colunas] = size(X);
    % Inicializar pesos com valores aleatórios normalizados
    Pesos = (rand(num_classes, num_colunas + 1) .* 0.2 + 0.5) ./ 2;
    max_epocas = 100;
    taxa_aprendizagem = 0.1;
    vies = -1;

    for epoca = 1 : max_epocas
        rperm = randperm(num_linhas);
        sum_erro = 0;
        printf('.');

        for idx = 1 : num_linhas
            index_ = rperm(idx);
            % obter toda a coluna da linha `index_`
            x_ = [[vies] X(index_, :)];
            desejado = y(index_, :);
            % calculo para cada neurônio
            for cl = 1 : num_classes
                calculado(cl) = dot(Pesos(cl, :), x_);
            end
            erro = desejado - sinalMulticlass(calculado);
            Pesos = Pesos + taxa_aprendizagem .* (x_ .* erro');
        end

        % condição de parada, quando não erra somatório do erro é zero
##        for index_j = 1 : num_linhas
##            x_ = [[vies] X(index_j, :)];
##            desejado = y(index_j, :);
##            for cl = 1 : num_classes
##                calculado(cl) = dot(Pesos(cl, :), x_);
##            end
##
##            sum_erro += isequal(desejado, sinalMulticlass(calculado)) ~= 1;
##        end
##
##        if sum_erro == 0
##            disp(['Convergiu na iteração ', num2str(epoca)]);
##            break
##        end
    end
end
