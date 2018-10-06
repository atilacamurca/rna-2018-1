%% Transformar Entrada através de um número grande de neurônios
%% @deftypefn {} {@var{H} =} transformarEntrada (@var{X}, @var{PesosEntrada}, @var{fn_siglog})
%%
%% @seealso{}
%% @end deftypefn

%% Author: Átila Camurça <atila@the-machine>
%% Created: 2018-09-08

function [H] = transformarEntrada (X, PesosEntrada, fn_siglog)
    [linhas_X,_] = size(X);
    X_bias = [-ones(linhas_X, 1), X];
    F = PesosEntrada * X_bias';
    H = fn_siglog(F)';
end
