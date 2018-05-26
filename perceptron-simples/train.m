function weights = train (X, y)
    
    % Inicializar pesos com zero
    weights = zeros(size(X, 1), 1);
    max_iteracoes = 100;
    taxa_aprendizagem = 0.1;
    vies = -1;
    
    for index = 1 : max_iteracoes
        
        for i = 1 : rows(X)
            x = X(i, :); % obter toda a coluna da linha `i`
            desejado = y(i);
            hipotese = sinal(dot(w, x) - vies);
            
            erro = desejado = hipotese;
            w = w + (taxa_aprendizagem * erro * x); % atualizar pesos
        end
        
    end
    
end
