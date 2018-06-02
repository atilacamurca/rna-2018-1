## Predizer saída baseado em um vetor de pesos e uma entrada
## @deftypefn {} {@var{valor} =} predizer (@var{pesos}, @var{entrada})
##
## @seealso{}
## @end deftypefn

## Author: Átila Camurça <atila@the-machine>
## Created: 2018-06-02

function valor = predizer (pesos, entrada)
    valor = sinal(dot(pesos, entrada));
end
