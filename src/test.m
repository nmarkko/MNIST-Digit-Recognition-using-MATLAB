RGB = imread('8.png');
%imshow(RGB)
ORIG = rgb2gray(RGB);
figure
imshow(ORIG)
I = imresize(ORIG,[20 20]);
%J=double(255-I)/255.0;
% figure
% imshow(J)

pokusaj_matrica =  double(255-ORIG)/255.0;
nova_slika = image_resize( pokusaj_matrica, 128, 20);
nova_slika = nova_slika./max(nova_slika(:));
%nova_slika=imgaussfilt(nova_slika);
figure
imshow(nova_slika);
funfunfun = nova_slika - J;
 J=nova_slika;

 sum_intensity = 0;
for i=1:20
    for j=1:20
    sum_intensity = sum_intensity + J(i,j);
    end
end
 
sum_x = 0;
for i=1:20
    for j=1:20
    sum_x = sum_x + i*J(i,j);
    end
end

sum_y = 0;
for i=1:20
    for j=1:20
    sum_y = sum_y + j*J(i,j);
    end
end
 
x_MassOfCenter = round(sum_x/sum_intensity);
y_MassOfCenter = round(sum_y/sum_intensity);

x_diff = 10 - x_MassOfCenter;
y_diff = 10 - y_MassOfCenter;

P=zeros(28,28);
for i=1:20
    for j=1:20
        if i+4+x_diff > 0
          if i+4+x_diff <= 28
            if j+4+y_diff > 0
             if j+4+y_diff <= 28
                P(i+4+x_diff,j+4+y_diff)=J(i,j);
             end
            end
          end
        end
    end
end

figure
imshow(P)


 K=reshape(P',[1,784]);
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

[maximum,max_index] = max(output_1);
result = max_index - 1

%slika=reshape(K,[28,28]);
%figure
%imshow(slika')
%close all
