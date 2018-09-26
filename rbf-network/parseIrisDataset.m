%% Converte dataset da Iris em formato do Perceptron
%% http://archive.ics.uci.edu/ml/datasets/Iris?ref=datanews.io
%% https://technichesblog.wordpress.com/2015/10/25/matlab-code-to-import-iris-data/
%%
%% Para o perceptron será usado a classificação:
%% setosa ou não setosa
%%
%% Gerar arquivo        : `save -mat iris-dataset.mat X y`
%% Carregar variáveis   : `load iris-dataset.mat`
FID = fopen('iris.data');

%extract data from the txt file using textscan function
textdata = textscan(FID,'%f %f %f %f %s', 'Delimiter', ',');

%form the data matrix
data = cell2mat(textdata(:,1:4));
target = textdata{1,5};
m = rows(target);
tr = [];

%form the target matrix
for k = 1:m
    a = target(k);
    if strcmp(a,'Iris-setosa') == 1
        l = [1 0 0];
    elseif strcmp(a,'Iris-versicolor') == 1
        l = [0 1 0];
    else
        l = [0 0 1];
    end
    tr=[tr ; l];
end

%merge both the matrix together
X = data;
y = tr;

% Normalizar, se necessário
not_norm = max(abs(X(:)));
if not_norm > 1
    %Need to normalize
    X = X / not_norm;
end

fclose(FID);

save -mat iris-dataset.mat X y
