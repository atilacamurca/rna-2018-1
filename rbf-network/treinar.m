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
    abertura = 0.35;
    
    rperm = randperm(num_linhas);
    random_centros = X(rperm(1:num_centros),:);
    
    H = calcularInterpolacao(X, random_centros, abertura);

    H_transp = H';
    H_Pesos = (pinv(H_transp * H) * H_transp) * y;
    [linhas_H_Pesos,_] = size(H_Pesos);
    % H_Pesos = [-ones(linhas_H_Pesos, 1), H_Pesos];

    num_classes = columns(y);
    [Pesos, vies] = multiclassPerceptron(H_Pesos, y, num_classes);

end
