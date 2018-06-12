%% Calcular os pesos para uma base X com labels y reais
%% @deftypefn {} {@var{pesos}, @var{vies}, @var{saidas}, @var{mse}, @var{rmse}} treinar (@var{X}, @var{y})
%%
%% @seealso{}
%% @end deftypefn

%% Author: Átila Camurça <atila@the-machine>
%% Created: 2018-06-09
function [pesos, vies, saidas, mse, rmse] = treinar (X, y)

    [num_linhas, num_colunas] = size(X);
    % Inicializar pesos com valores aleatórios normalizados
    pesos = (rand(1, num_colunas + 1) .* 0.2 + 0.5) ./ 2;
    % pesos = zeros(1, columns(X) + 1);
    max_epocas = 200;
    taxa_aprendizagem = 0.1;
    vies = -1;
    saidas = zeros(num_linhas, 1);
    tolerancia_mse = 0.05; % mse máximo aceitável

    for epoca = 1 : max_epocas
        printf('.');
        for index = 1 : num_linhas
            x_ = [[vies] X(index, :)]; % obter toda a coluna da linha `index`
            saidas(index) = dot(pesos, x_);
            desejado = y(index);
            erro = desejado - saidas(index);
            pesos = pesos + (taxa_aprendizagem * erro * x_); % atualizar pesos
        end

        % atualizar saidas com os últimos pesos ajustados
        for index = 1 : num_linhas
            x_ = [[vies] X(index, :)]; % obter toda a coluna da linha `index`
            saidas(index) = dot(pesos, x_);
        end
        
        % mse = (y-saidas)' * (y-saidas) / num_linhas; % Erro Quadrático Médio.
        mse = meansq(y-saidas); % Erro Quadrático Médio.
        rmse = sqrt(mse);
        
        %if (mse <= tolerancia_mse)
        %    break;
        %end
    end
end
