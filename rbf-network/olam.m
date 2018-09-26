%% -*- texinfo -*-
%% @deftypefn {} {@var{Pesos} =} olam (@var{H}, @var{y})
%%
%% @seealso{}
%% @end deftypefn

%% Author: Átila Camurça <atila@the-machine>
%% Created: 2018-09-26

function Pesos = olam (H, y)
    [linhas_H,_] = size(H);
    H = [-ones(linhas_H, 1), H];
    H_transp = H';
    Inv = pinv(H_transp * H);
    A = Inv * H_transp;
    Pesos = (A * y)';
end
