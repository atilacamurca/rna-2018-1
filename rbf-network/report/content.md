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

Os resultados de ambos problemas foram dentro do esperado, usando 40%
da base de teste como os centros e um sigma de `0.15`.
Seguem os resultados apresentando a matriz de confusão para as
realizações com maior taxa de acerto.

## Íris

No problema da Íris os resultados encontrados encontram-se acima de 90,00%
na taxa de acerto.

Pior resultado:

```
====  Sumário  =====
Num. Pred corretas: 27 de 30
        Realização: 7
Matriz de Confusão: [10 0 0;0 7 1;0 2 10]
    Taxa de acerto: 90
```

Melhor resultado:

```
====  Sumário  =====
Num. Pred corretas: 30 de 30
        Realização: 16
Matriz de Confusão: [10 0 0;0 9 0;0 0 11]
    Taxa de acerto: 100
```

Sumário:

```
====  Sumário Geral  ====
        Acurácia: 95.1667
   Desvio Padrão: 2.7519
```

## Coluna Vertebral

No problema da oluna Vertebral os resultados encontrados encontram-se acima de 77,00%
na taxa de acerto.

Pior resultado:

```
====  Sumário  =====
Num. Pred corretas: 48 de 62
        Realização: 5
Matriz de Confusão: [6 0 7;0 23 3;4 0 19]
    Taxa de acerto: 77.4194
```

Melhor resultado:

```
====  Sumário  =====
Num. Pred corretas: 56 de 62
        Realização: 20
Matriz de Confusão: [10 0 4;0 36 1;1 0 10]
    Taxa de acerto: 90.3226
```

Sumário:

```
====  Sumário Geral  ====
        Acurácia: 84.5161
   Desvio Padrão: 3.6028
```

# Conclusão

Devido a falta de um algoritmo de seleção de parâmetros, por exemplo busca em grade
com validação cruzada de k-partes, os resultados obtidos foram dentro do esperado mas
poderiam ser melhores e mais eficientes.

Repositório com código-fonte: <https://github.com/atilacamurca/rna-2018-1>

Link para download: <https://github.com/atilacamurca/rna-2018-1/archive/master.zip>
