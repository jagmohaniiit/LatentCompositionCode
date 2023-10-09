function [fmmpmrVal]=getFMMPMRValuesFromFile(filename,stringReplace)

fr = fopen(filename,'r');
stringResults=fscanf(fr,'%s');
stringReplaced=char(strrep(char(stringResults),char(stringReplace),''));
fmmpmrVal=str2num(stringReplaced);
fclose(fr);