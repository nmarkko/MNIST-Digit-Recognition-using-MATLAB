RGB = imread('jedan.png');
%imshow(RGB)
 I = rgb2gray(RGB);
 J=double(255-I)/255.0;
 K=reshape(J',[1,784]);
% a{1}=K;
% [a,a_dot]=feedforward(a,W,b,l);

% y{1} = K;
% y_dot = cell(1,l-1);

 output_0=sigmoid(W{1}*K'+b{1});
 output_1=sigmoid(W{2}*output_0+b{2});

% for i = 1:l-1
%     y{i+1} = sigmoid(W{i}*y{i}+b{i});
%     y_dot{i} = sigmoidPrime(W{i}*y{i}+b{i});
% end

slika=reshape(K,[28,28]);
figure
imshow(slika')
