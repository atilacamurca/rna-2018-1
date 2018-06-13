%% Normalizar valores de uma matriz
%% @deftypefn {} {@var{normalizado}} normalizar (@var{matriz})
%%
%% @seealso{}
%% @end deftypefn

%% Author: Átila Camurça <atila@the-machine>
%% Created: 2018-06-13

function normalizado = normalizar (matriz)
    not_norm = max(abs(matriz(:)));
    if not_norm > 1
        % Need to normalize
        normalizado = matriz / not_norm;
    end
end
