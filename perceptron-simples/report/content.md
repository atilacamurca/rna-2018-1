# Introdução

Em 1943 McCulloch e Pitts propuseram um modelo matemático para o neurônio biológico.
A ideia era ter uma forma computacional para dado um conjunto de entrada poder ser
calculado uma saída. Entretanto era necessário obter os chamados pesos sinápticos
de alguma forma. Daí em 1958 Rosenblatt propôs um algoritmo chamado Perceptron Simples.
Esse algoritmo consiste do neurônio de McCulloch e Pitts com uma regra de aprendizagem.

# Problemas

## Artificial I

Para o problema Artificial I foi gerado uma base no seguinte formato:

* Para valores entre $(0 : 0.2; 0 : 0.2), (0 : 0.2; 0.5 : 1), (0.5 : 1; 0 : 0.2)$ é considerado classe 0, com 30 itens na base;
* Para valores entre $(0.5 : 1; 0.5 : 1)$ é considerado classe 1, com 10 itens na base.

~~~octave
ClasseZero = [
    % 0 0
    rand(10, 1) .* 0.2 rand(10, 1) .* 0.2;
    % 0 1
    rand(10, 1) .* 0.2 rand(10, 1) .* 0.5 + 0.5;
    % 1 0
    rand(10, 1) .* 0.5 + 0.5 rand(10, 1) .* 0.2;
];
ClasseOne = rand(10, 2) .* 0.5 + 0.5;
~~~

## Iris

O problema da Iris é a classificação de uma espécie de flor. Essa base de dados
é formada por 3 categorias: Setosa, Versicolor e Virgínica. Como o Perceptron Simples
não é capaz de classificar problemas não binários foi necessário adaptar o problema
para classificação de: Setosa ou Outra, onde:

* Setosa é classificada como classe 1 (um), com 40 itens na base;
* Enquanto outras são classificadas com classe 0 (zero), com 80 itens na base.

# Resultados

## Artificial I

Para um dos melhores resultados obtidos de 20 realizações foram encontrados:

Matrix de Confusão:

~~~
10  0
 1  3
~~~

Acurácia: 92.85%

## Iris

Para um dos melhores resultados obtidos de 20 realizações foram encontrados:

Matrix de Confusão:

~~~
20  1
 0  9
~~~

Acurácia: 96.66%

# Conclusão

Apesar de muito simples o Perceptron Simples é um ótimo algoritmo de classificação
binária, dado qualquer problema ele é capaz de encontrar uma regra de aprendizagem
que garante encontrar uma solução num número finito de iterações.

Repositório com código-fonte: <https://github.com/atilacamurca/rna-2018-1>

Link para download: <https://github.com/atilacamurca/rna-2018-1/archive/master.zip>