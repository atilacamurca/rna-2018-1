## Calcula o sinal com base em u
## @deftypefn {} {@var{retval} =} sinal (@var{u})
##
## @end deftypefn

## Author: Átila Camurça <atila@the-machine>
## Created: 2018-05-26

function y = sinal (u)
    if (u >= 0)
        y = 1;
    else
        y = 0;
    end
end
