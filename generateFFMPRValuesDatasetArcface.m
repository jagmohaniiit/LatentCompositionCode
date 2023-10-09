clc
close all
clear


morphAttackGenerationTypes={'SENMSENM';'Full'};
currentDirectory=pwd;
baseReadDirectory=char(strcat(currentDirectory,'\ComparisonScores\Arcface\'));
baseOutputDirectory=char(strcat(currentDirectory,'\Arcface\CompositesProposedResults\'));

if ~exist(baseOutputDirectory,'dir')
    mkdir(baseOutputDirectory);
end

for ll=1:length(morphAttackGenerationTypes)


Read_Path =char(strcat(baseReadDirectory,char(morphAttackGenerationTypes(ll)),filesep));
outputFilename=char(strcat(baseOutputDirectory,'Original',char(morphAttackGenerationTypes(ll)),'ArcfaceFMMPMRResults.txt'));
fw1 = fopen(outputFilename,'w');

outputFilename=char(strcat(baseOutputDirectory,'Original',char(morphAttackGenerationTypes(ll)),'ArcfaceFTAResults.txt'));
fw2 = fopen(outputFilename,'w');


All_Dir = dir(Read_Path);
No_Dir = length(All_Dir);
No_Foldes = length(All_Dir);
Counter_Vulner = 0;
Counter_All = 0;
fullScoreArray=[];
FTA=0;
for i = 3 : No_Dir-1
    Temp =  All_Dir(i).name;
    Read_textFile_Path1 = strcat(Read_Path,'\', Temp,'\', 'Subject_1.txt');
    Read_textFile_Path2 = strcat(Read_Path,'\', Temp,'\', 'Subject_2.txt');
    
    totalbytes1=0;
    totalbytes2=0;
    
    if exist(Read_textFile_Path1,'file')
        if exist(Read_textFile_Path2,'file')
    
            file1ImportData=importdata(char(Read_textFile_Path1));
        file2ImportData=importdata(char(Read_textFile_Path2));

    totalbytes1=size(file1ImportData,1)*size(file1ImportData,2);
    totalbytes2=size(file2ImportData,1)*size(file1ImportData,2);
    

            fileID = fopen(Read_textFile_Path1);
            C = textscan(fileID, '%f');
            fclose(fileID);
            C1 = cell2mat(C);
            No_C1 = length(C1);
            
            fileID = fopen(Read_textFile_Path2);
            C = textscan(fileID, '%f');
            fclose(fileID);
            C2 = cell2mat(C);
            No_C2 = length(C2);
            
            
            
            flag=1;
            %%%%%%%%%%% Obtain the Vuneralbity: Threshold = 0.25 %%%%%%%%%%%%%%%%
            for ii = 1 : No_C1
                Temp_C1 =  C1(ii);
                for iii =  1 : No_C2
                    Temp_C2 = C2(iii);
                    Counter_All = Counter_All + 1;
                    if (Temp_C1 >0.25)
                        if (Temp_C2 >0.25)
                            Counter_Vulner = Counter_Vulner + 1;
                         end
                        
                    else
                        disp(i)
                    end
                                    
                end
            end
        end
    end
    if totalbytes1 == 0
        if totalbytes2 == 0
            FTA=FTA+1;
        end
    end
    

    
end
fmmpmr = Counter_Vulner/Counter_All;

FTA_Float=double(FTA);
QF_Percentage=1.0-(FTA_Float/double(No_Foldes));

fprintf(fw1,'%s %f\n',char(morphAttackGenerationTypes(ll)),fmmpmr);
fprintf(fw2,'%s %f\n',char(morphAttackGenerationTypes(ll)),QF_Percentage);
fclose(fw1);
fclose(fw2);
end
