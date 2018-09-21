%% Calcular interpolação
%% @deftypefn {} {@var{retval} =} calcularInterpolacao (@var{input1}, @var{input2})
%%
%% @seealso{}
%% @end deftypefn

%% Author: Átila Camurça <atila@the-machine>
%% Created: 2018-09-08

function H = calcularInterpolacao (X, centros, sigma)
    [num_linhas, num_colunas] = size(X);
    % [num_linhas_centros, num_colunas_centros] = size(centros);
    H = []; %zeros(num_linhas, num_colunas_centros);
    for i = 1 : num_linhas
        linha = [];
        for j = 1 : num_colunas
            aux = X(i) - centros(j);
            linha(j) = exp( - aux' .* aux ./ (2 * sigma) ** 2 );
        end
        H(i,:) = linha;
    end
end
