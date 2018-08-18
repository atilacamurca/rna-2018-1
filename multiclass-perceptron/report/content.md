# Introdução

O perceptron simples é capaz de resolver problemas binários, que podem ser separados
linearmente. Mas para problemas com mais de uma classe é necessário adaptar o
algoritmo, adicionando mais neurônios, em que cada um prediz uma classe.

# Problemas

<!--
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
-->

## Íris

O problema da Íris é a classificação de uma espécie de flor. Essa base de dados
é formada por 3 categorias: Setosa, Versicolor e Virgínica, onde:

* Setosa é classificada como classe [1 0 0], com 50 itens na base;
* Versicolor é classificada como classe [0 1 0], com 50 itens na base;
* Virgínica é classificada como classe [0 0 1], com 50 itens na base;

# Resultados

<!--
## Artificial I

Ao longo de várias execuções foram encontrados resultados sempre acima de 95%
de acurária. Em alguns dos testes chegou a 100% de acurácia.

Em testes em que houve erros, tivemos por exemplo a Matrix de Confusão:

$$
\begin{bmatrix}
10 & 0 \\
1 & 3
\end{bmatrix}
$$

Taxa de acerto: 92.85%

Ainda assim, a acurária foi de 99.64% com desvio padrão de 1.59%.
-->

## Íris

No problema da Íris os resultados encontrados encontram-se acima de 80,00%
na taxa de acerto. Nesse cenário a Matrix de Confusão foi a seguinte:

$$
\begin{bmatrix}
10 & 0 & 0 \\
3 & 4 & 3 \\
0 & 0 & 10
\end{bmatrix}
$$

Nos melhores testes, foram a Matrix de Confusão:

$$
\begin{bmatrix}
10 & 0 & 0 \\
0 & 10 & 0 \\
0 & 0 & 10
\end{bmatrix}
$$

Taxa de acerto: 100.00%.

De forma geral, a acurácia foi de 92,00% com desvio padrão de 5,9628%.

# Conclusão

Apesar de elementar, o Perceptron Simples é um ótimo algoritmo de classificação
binária. Dado qualquer problema, ele é capaz de encontrar uma regra de aprendizagem
que garante encontrar uma solução ótima num número finito de iterações.

Repositório com código-fonte: <https://github.com/atilacamurca/rna-2018-1>

Link para download: <https://github.com/atilacamurca/rna-2018-1/archive/master.zip>