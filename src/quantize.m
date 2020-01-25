%broj bita odbirka (format je 1.23)
%word_length = 16;
%fraction_length = 12;
word_length = 18;
fraction_length = 14;

struct.mode = 'fixed';
strct.roundmode = 'floor';
struct.overflowmode = 'saturate';
struct.format = [word_length fraction_length];
q = quantizer(struct);

%koeficijenti filtra
fileIDb = fopen('input_images.txt','w');
for j=1:10
    for i=1:784
        fprintf(fileIDb,num2bin(q,mnist{2,1}(j, i)));
        fprintf(fileIDb,'\n');
    end
end
fclose(fileIDb);

fileIDb = fopen('weights1.txt','w');
for i=1:30
    for j=1:784
    fprintf(fileIDb,num2bin(q,W{1,1}(i,j)));
    fprintf(fileIDb,'\n');
    end
end
fclose(fileIDb);

fileIDb = fopen('weights2.txt','w');
for i=1:10
    for j=1:30
    fprintf(fileIDb,num2bin(q,W{1,2}(i,j)));
    fprintf(fileIDb,'\n');
    end
end
fclose(fileIDb);

fileIDb = fopen('biases1.txt','w');
for i=1:30
    fprintf(fileIDb,num2bin(q,b{1,1}(i,1)));
    fprintf(fileIDb,'\n');
end
fclose(fileIDb);

fileIDb = fopen('biases2.txt','w');
for i=1:10
    fprintf(fileIDb,num2bin(q,b{1,2}(i,1)));
    fprintf(fileIDb,'\n');
end
fclose(fileIDb);