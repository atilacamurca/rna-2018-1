## Calcular os pesos para uma base X com labels y
## @deftypefn {} {@var{pesos} =} treinar (@var{X}, @var{y})
##
## @end deftypefn

## Author: Átila Camurça <camurca.home@gmail.com>
## Created: 2018-05-26
function pesos = treinar (X, y)

    % Inicializar pesos com zero
    pesos = rand(1, columns(X));
    max_iteracoes = 100;
    taxa_aprendizagem = 0.1;
    vies = -1;

    for iteracao = 1 : max_iteracoes
        
        % convergiu = true;
        disp(['iteração ', num2str(iteracao)]);
        % disp(['num linhas ', num2str(rows(X))])
        
        % sum_erro = 0;
        for index_ = 1 : rows(X)
            disp(['linha ', num2str(index_)]);
            x_ = X(index_, :); % obter toda a coluna da linha `index_`
            desejado = y(index_)
            calculado = sinal(dot(pesos, x_) + vies)

            erro = desejado - calculado;
            if erro != 0
                pesos = pesos + (taxa_aprendizagem * erro * x_); % atualizar pesos
                % sum_erro += 1;
            else
                % sum_erro -= 1;
            end
        end

        % TODO: adicionar condição de parada adequada
%        if sum_erro == 0
%            disp('convergiu após ');
%            disp(iteracao);
%            disp(' interações.');
%            break;
%        end

    end

end
