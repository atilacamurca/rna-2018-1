%% Treinar RBF
%% @deftypefn {} {@var{Pesos} =, @var{vies} =} treinar (@var{X}, @var{y})
%%
%% @seealso{}
%% @end deftypefn

%% Author: Átila Camurça <atila@the-machine>
%% Created: 2018-09-08

function [Pesos, vies] = treinar (X, y)

    [num_linhas, num_colunas] = size(X);
    % TODO: realizar busca em grade com validação cruzada de k-partes
    num_centros = floor(num_linhas * 40 / 100);
    abertura = 0.15;

    rperm = randperm(num_linhas);
    random_centros = X(rperm(1:num_centros),:);

    H = calcularInterpolacao(X, random_centros, abertura);
    [linhas_H,_] = size(H);
    H = [-ones(linhas_H, 1), H];
    H_transp = H';
    Inv = pinv(H_transp * H);
    A = Inv * H_transp;
    Pesos = (A * y)';
    vies = -1;

end
