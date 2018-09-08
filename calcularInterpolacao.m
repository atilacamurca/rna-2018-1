%% Calcular interpolação
%% @deftypefn {} {@var{retval} =} calcularInterpolacao (@var{input1}, @var{input2})
%%
%% @seealso{}
%% @end deftypefn

%% Author: Átila Camurça <atila@the-machine>
%% Created: 2018-09-08

function H = calcularInterpolacao (X, centros, sigma)
    [num_linhas, num_colunas] = size(X);
    [num_linhas_centros, num_colunas_centros] = size(centros);
    H = zeros(num_linhas, num_colunas_centros);
    for i = 1 : num_linhas
        H(i) = exp( - ((X(i) - centros)' .* (X(i) - centros) ./ (2 * sigma) ** 2) );
    end
end
