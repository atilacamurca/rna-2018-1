clear; close all; clc;

X = [
    0 0;
    0 1;
    1 0;
    1 1
];

y = [0 0 0 1];

pesos = treinar(X, y)

figure(1);
plot(X, y, '-', pesos, '-');
