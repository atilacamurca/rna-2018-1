%% Treinar ELM
%% @deftypefn {} {@var{Pesos} =, @var{vies} =} treinar (@var{X}, @var{y}, @var{fn_siglog})
%%
%% @seealso{}
%% @end deftypefn

%% Author: Átila Camurça <atila@the-machine>
%% Created: 2018-09-08

function [Pesos, PesosEntrada, vies] = treinar (X, y, fn_siglog)
    % TODO: realizar busca em grade com validação cruzada de k-partes
    [linhas_X,colunas_X] = size(X);
    numNeuronios = 50;

    PesosEntrada = (rand(numNeuronios, colunas_X + 1) .* 0.2 + 0.5) ./ 2;
    H = transformarEntrada(X, PesosEntrada, fn_siglog);
    Pesos = olam(H, y);
    vies = -1;

end
