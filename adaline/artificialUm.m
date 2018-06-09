clear; close all; clc;

% f(x) = 4x + 2

X = [0.2  0.3 ; 
0.1  0.4 ; 
0.4  0.3 ;
0.11 0.9 ;
0.84 0.6 ;
0.1  0.2 ;
0.6  0.2 ;
0.2  0.2 ;
0.7  0.8 ;
0.1  0];

D = [0.13  ;   
0.17  ;   
0.25  ;
0.822 ;
1.065 ;
0.05  ;
0.4   ;
0.08  ;
1.13  ;
0.01];

[pesos, vies, saidas, mse, rmse] = treinar(X, D);

disp('');
pesos
saidas
disp('====  Sumário  =====');
%disp(['        Realização: ', num2str(realizacao)]);
disp(['   MSE: ', mat2str(mse)]);
disp(['  RMSE: ', num2str(rmse)]);
disp('');
