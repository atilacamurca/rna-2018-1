%% Treinar RBF
%% @deftypefn {} {@var{Pesos} =} treinar (@var{X}, @var{y})
%%
%% @seealso{}
%% @end deftypefn

%% Author: Átila Camurça <atila@the-machine>
%% Created: 2018-09-08

function Pesos = treinar (X, y)

    [num_linhas, num_colunas] = size(X);
    % TODO: realizar busca em grade com validação cruzada de k-partes
    num_centros = floor((num_linhas * 30 / 100) + num_linhas);
    abertura = 0.2;
    
    rperm = randperm(num_linhas);
    random_centros = X(rperm(1:num_centros),:);
    
    H = calcularInterpolacao(X, random_centros, abertura);
    
    H = [-ones(num_linhas, 1), H];
    
    H_transp = H'
    Pesos = pinv(H_transp .* H) .* H_transp .* y;

end
