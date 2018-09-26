%% Calcular interpolação
%% @deftypefn {} {@var{retval} =} calcularInterpolacao (@var{input1}, @var{input2})
%%
%% @seealso{}
%% @end deftypefn

%% Author: Átila Camurça <atila@the-machine>
%% Created: 2018-09-08

function H = calcularInterpolacao (X, centros, sigma)
    [num_linhas, _] = size(X);
    [num_linhas_centros, _] = size(centros);
    H = zeros(num_linhas, num_linhas_centros);
    for i = 1 : num_linhas
        x = X(i,:);
        for j = 1 : num_linhas_centros
            c = centros(j,:);
            aux = x - c;
            H(i, j) = exp(-((aux * aux') / (2 * sigma) ^ 2));
        end
    end
end
