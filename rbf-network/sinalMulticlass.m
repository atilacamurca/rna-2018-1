%% Calcula o sinal com base em u
%% Retorna algo do tipo [1 0 0], [0 1 0] ou [0 0 1],
%% com tamanho baseado em u
%% @deftypefn {} {@var{y} =} sinal (@var{u})
%%
%% @end deftypefn

%% Author: Átila Camurça <camurca.home@gmail.com>
%% Created: 2018-05-26
function y = sinalMulticlass (u)
    y = zeros(size(u));
    [value, best_guess] = max(u);
    y(best_guess) = 1;
end
