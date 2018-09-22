# Introdução

Redes RBF (do Inglês _Radial Basis Function Networks_) são redes que podem ser utilizadas
para resolver problemas de Regressão e Classificação. Esse tipo de rede pode aprender
a aproximar uma tendência usando várias curvas Gaussianas.

Uma rede RBF possui um ou mais camadas Escondidas conectadas a camada de Entrada. A partir
daí, obtém-se a saída da camada Escondida e realiza uma soma ponderada através de OLAM
(do Inglês _Optimal Linear Associative Memory_).

# Problemas

## Íris

O problema da Íris é a classificação de uma espécie de flor. Essa base de dados
é formada por 3 categorias: Setosa, Versicolor e Virgínica, onde:

* Setosa é classificada como classe [1 0 0], com 50 itens na base;
* Versicolor é classificada como classe [0 1 0], com 50 itens na base;
* Virgínica é classificada como classe [0 0 1], com 50 itens na base;

## Coluna Vertebral

O problema da Coluna Vertebral é a classificação para identificar se um paciente
sofre ou não de algum problema na coluna. Essa base de dados possui as seguintes
categorias: Hernia, Spondylolisthesis e Normal, onde:

* Hernia é classificada como classe [1 0 0], com 60 itens na base;
* Spondylolisthesis é classificada como classe [0 1 0], com 150 itens na base;
* Normal é classificada como classe [0 0 1], com 100 itens na base;

# Resultados

Os resultados de ambos problemas foram bem abaixo do esperado, provavelmente
por um problema na elaboração do algoritmo. Seguem abaixo os resultados 
apresentando a matriz de confusão para as realizações com maior taxa de acerto.

## Íris

Pior resultado:

```
Pesos =

     6.4735    78.6244   -98.9655    22.8229     9.3454
    -3.2905  -119.7229   133.0127   -17.1255    -1.8099
    -4.1831    41.0985   -34.0472    -5.6974    -7.5355

====  Sumário  =====
Num. Pred corretas: 0 de 30
        Realização: 2
Matriz de Confusão: [0 0 10;8 0 0;12 0 0]
    Taxa de acerto: 0
```

Melhor resultado:

```
Pesos =

     5.8920   -45.6733   281.4740  -307.4812    82.1001
    -4.1660    22.8844  -191.2339   207.2235   -45.7574
    -2.7261    22.7889   -90.2401   100.2577   -36.3427

====  Sumário  =====
Num. Pred corretas: 19 de 30
        Realização: 20
Matriz de Confusão: [8 0 0;0 11 0;0 11 0]
    Taxa de acerto: 63.3333
```

Sumário:

```
====  Sumário Geral  ====
        Acurácia: 26.8333
   Desvio Padrão: 18.5584
```

## Coluna Vertebral

Pior resultado:

```
Pesos =

 -3.1867    -4.9651    -6.3159    16.5321    -5.1169    12.6423  -16.6953
-31.6224 -2174.6339  4287.5155 -3182.3625 -1754.8589  2175.0692  601.4591
 33.8090  2179.5990 -4281.1997  3165.8303  1759.9758 -2187.7114 -584.7637

====  Sumário  =====
Num. Pred corretas: 15 de 62
        Realização: 5
Matriz de Confusão: [0 6 1;1 8 27;1 11 7]
    Taxa de acerto: 24.1935
```

Melhor resultado:

```
Pesos =

  8.5008  23.3674   -53.6846   -73.4490   -19.4075    57.3331    80.2903
-51.0027  657.8846  729.6177   335.9711 -2032.2789  1504.9526 -1273.4145
 41.5018 -681.2524 -675.9331  -262.5218  2051.6862 -1562.2856  1193.1245

====  Sumário  =====
Num. Pred corretas: 37 de 62
        Realização: 12
Matriz de Confusão: [0 13 0;0 37 0;0 12 0]
    Taxa de acerto: 59.6774
```

Sumário:

```
====  Sumário Geral  ====
        Acurácia: 41.0484
   Desvio Padrão: 11.0448
```

# Conclusão

Devido a possíveis problemas na implementação e a falta de um algoritmo de seleção
de parâmetros, por exemplo busca em grade com validação cruzada de k-partes, os
resultados obtidos foram muito abaixo do esperado. Será necessário rever todo o
algoritmo para identificar onde deve ser modificado para um melhor resultado.

Repositório com código-fonte: <https://github.com/atilacamurca/rna-2018-1>

Link para download: <https://github.com/atilacamurca/rna-2018-1/archive/master.zip>
