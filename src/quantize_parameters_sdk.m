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


fileIDb = fopen('parameters_sdk.h','w');
fprintf(fileIDb,'#ifndef PARAMETERS_H\n  #define PARAMETERS_H\n');

fprintf(fileIDb,'u32 parameters[23860]={');
for i=1:30
    for j=1:784
        fprintf(fileIDb,'0x');
        fprintf(fileIDb,num2hex(q,W{1,1}(i,j)));
        fprintf(fileIDb,', ');
    end
    fprintf(fileIDb,'\n');
    fprintf(fileIDb,'0x');
    fprintf(fileIDb,num2hex(q,b{1,1}(i,1)));
    fprintf(fileIDb,', \n');
end
for i=1:10
    for j=1:30
        fprintf(fileIDb,'0x');
        fprintf(fileIDb,num2hex(q,W{1,2}(i,j)));
        fprintf(fileIDb,', ');
    end
    fprintf(fileIDb,'\n');
    fprintf(fileIDb,'0x');
    fprintf(fileIDb,num2hex(q,b{1,2}(i,1)));
    if (i==10)
    else
        fprintf(fileIDb,', ');
    end
    fprintf(fileIDb,'\n');
end

fprintf(fileIDb,'};\n');
fprintf(fileIDb,'#endif');
fclose(fileIDb);