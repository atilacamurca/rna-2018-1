%% Treinar RBF
%% @deftypefn {} {@var{Pesos} =, @var{Centros} =, @var{vies} =} treinar (@var{X}, @var{y})
%%
%% @seealso{}
%% @end deftypefn

%% Author: Átila Camurça <atila@the-machine>
%% Created: 2018-09-08

function [Pesos, Centros, vies] = treinar (X, y)

    [num_linhas, num_colunas] = size(X);
    % TODO: realizar busca em grade com validação cruzada de k-partes
    num_centros = floor(num_linhas * 40 / 100);
    abertura = 0.15;

    rperm = randperm(num_linhas);
    Centros = X(rperm(1:num_centros),:);

    H = calcularInterpolacao(X, Centros, abertura);
    Pesos = olam(H, y);
    vies = -1;

end
