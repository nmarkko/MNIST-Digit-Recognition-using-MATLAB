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
fileIDb = fopen('input_images_sdk.txt','w');
fprintf(fileIDb,'u32 y_array[7840]={');
for j=1:10
    for i=1:784
        fprintf(fileIDb,'0x');
        fprintf(fileIDb,num2hex(q,double(mnist{3,1}(j, i))));
        if (j==10 && i ==784)
        else
            fprintf(fileIDb,', ');
        end
        fprintf(fileIDb,'\n');
    end
end
fprintf(fileIDb,'};');
fclose(fileIDb);

fileIDb = fopen('weights_sdk.txt','w');
%784*30=23520 max number of weights in a layer
fprintf(fileIDb,'u32 weight_array[2][23520]={ {');
for i=1:30
    for j=1:784
        fprintf(fileIDb,'0x');
        fprintf(fileIDb,num2hex(q,W{1,1}(i,j)));
        if (i==30 && j ==784)
        else
            fprintf(fileIDb,', ');
        end
        fprintf(fileIDb,'\n');
    end
end
fprintf(fileIDb,'}, {');
for i=1:10
    for j=1:30
        fprintf(fileIDb,'0x');
        fprintf(fileIDb,num2hex(q,W{1,2}(i,j)));
        if (i==10 && j ==30)
        else
            fprintf(fileIDb,', ');
        end
        fprintf(fileIDb,'\n');
    end
end
fprintf(fileIDb,'}};');
fclose(fileIDb);

fileIDb = fopen('biases_sdk.txt','w');
fprintf(fileIDb,'u32 bias_array[2][30]={ {');
for i=1:30
    fprintf(fileIDb,'0x');
    fprintf(fileIDb,num2hex(q,b{1,1}(i,1)));
     if (i== 30)
    else
        fprintf(fileIDb,', ');
    end
    fprintf(fileIDb,'\n');
end
fprintf(fileIDb,'}, {');
for i=1:10
    fprintf(fileIDb,'0x');
    fprintf(fileIDb,num2hex(q,b{1,2}(i,1)));
    if (i== 10)
    else
        fprintf(fileIDb,', ');
    end
    fprintf(fileIDb,', \n');
end
fprintf(fileIDb,'}};');
fclose(fileIDb);
