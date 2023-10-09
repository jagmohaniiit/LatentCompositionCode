function [qfFactor]=getQFVal(filename,stringReplace)
fr = fopen(filename,'r');
stringLine=fgetl(fr);
qfFactorLineArray=sscanf(stringLine,strcat(stringReplace,{' '},"%f",{' '},"%f"));
qfFactor=qfFactorLineArray;
fclose(fr);