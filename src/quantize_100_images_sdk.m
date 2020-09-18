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
fileIDb = fopen('input_images_100_sdk.txt','w');
fprintf(fileIDb,'u32 y_array[78400]={');
for j=1:100
    for i=1:784
        fprintf(fileIDb,'0x');
        fprintf(fileIDb,num2hex(q,double(mnist{3,1}(j, i))));
        if (j==100 && i ==784)
        else
            fprintf(fileIDb,', ');
        end
        fprintf(fileIDb,'\n');
    end
end
fprintf(fileIDb,'};');
fclose(fileIDb);

struct1.mode = 'fixed';
struct1.format = [18 0];
q = quantizer(struct1);

fileIDb = fopen('labels_100_sdk.txt','w');
fprintf(fileIDb,'u32 labels[100]={');
for j=1:100
    fprintf(fileIDb,'0x');
    fprintf(fileIDb,num2hex(q,double(mnist{3,2}(1, j))));
    if (j==100 )
    else
        fprintf(fileIDb,', ');
    end
    fprintf(fileIDb,'\n');
end
fprintf(fileIDb,'};');
fclose(fileIDb);