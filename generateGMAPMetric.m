clc;
clear all;
addpath('\\gvk-imt-ts-01.win.ntnu.no\filestorage\nbl-users\Jag_Mohan\');

fileNamesPost={'SENMSENM';'Full'};
fileNamesGroup={'R13';'R14'};



currentFolder=pwd;




ArcfaceProposedBaseFolder=char(strcat(char(currentFolder),char('\Arcface\CompositesProposedResults\')));

VGGFaceProposedBaseFolder=char(strcat(char(currentFolder),char('\VGGFace\CompositesProposedResults\')));









currentSuffix='Original';


currentProposedArrayOverall=zeros(2,1);
currentProposedArrayArcfaceOverall=zeros(2,1);
currentProposedArrayVGGFaceOverall=zeros(2,1);
	
    
    
    
    
    
    
    
    for j=1:length(fileNamesPost)
            
            %Arcface
            %Proposed
            currentFilenamesPost=char(fileNamesPost(j));
            fmmprFilename=char(strcat(ArcfaceProposedBaseFolder,currentSuffix,currentFilenamesPost,'ArcfaceFMMPMRResults.txt'));
            currentFMMPMRValProposed=getFMMPMRValuesFromFile(fmmprFilename,currentFilenamesPost);
            
            
            ftaFilename=char(strcat(ArcfaceProposedBaseFolder,currentSuffix,currentFilenamesPost,'ArcfaceFTAResults.txt'));
            currentQFValProposed=getQFVal(ftaFilename,currentFilenamesPost);
            currentQFMMPMRProposed=currentFMMPMRValProposed*currentQFValProposed;
            
            currentQFMMPMRProposedArcface=currentQFMMPMRProposed;
            
            
			%VGGFace
            %Proposed
            currentFilenamesPost=char(fileNamesPost(j));
            fmmprFilename=char(strcat(VGGFaceProposedBaseFolder,currentSuffix,currentFilenamesPost,'VGGFaceFMMPMRResults.txt'));
            currentFMMPMRValProposed=getFMMPMRValuesFromFile(fmmprFilename,currentFilenamesPost);
            
            
            ftaFilename=char(strcat(VGGFaceProposedBaseFolder,currentSuffix,currentFilenamesPost,'VGGFaceFTAResults.txt'));
            currentQFValProposed=getQFVal(ftaFilename,currentFilenamesPost);
            currentQFMMPMRProposed=currentFMMPMRValProposed*currentQFValProposed;
            
            currentQFMMPMRProposedVGGFace=currentQFMMPMRProposed;
            
            
            
            
            currentProposedArrayArcfaceOverall(j,1)=(currentQFMMPMRProposedArcface*100.0);
            currentProposedArrayVGGFaceOverall(j,1)=(currentQFMMPMRProposedVGGFace*100.0);
        
        
    end
    
    
    
     %These arrays contain GMAP Probe Attempts Based
    
disp('GMAP (Multiple Probe Attempts)');
disp('Arcface');

disp(strcat('R13',{' '},'R14'));
disp(strcat(num2str(currentProposedArrayArcfaceOverall(1,1)),{' '},num2str(currentProposedArrayArcfaceOverall(2,1))));
   
disp('VGGFace');	
   
disp(strcat('R13',{' '},'R14'));
disp(strcat(num2str(currentProposedArrayVGGFaceOverall(1,1)),{' '},num2str(currentProposedArrayVGGFaceOverall(2,1))));
      
   

m=input('Press Enter to continue');

    
	
    
    
    %GMAP Multiple Probe Attempts and Multiple FRS Based
    
	disp('GMAP (Multiple FRS and Multiple Probe Attempts)');

for j=1:length(fileNamesPost)
     currentProposedArrayOverall(j,:)=min(currentProposedArrayArcfaceOverall(j,:),currentProposedArrayVGGFaceOverall(j,:));
end
    

disp(strcat('R13',{' '},'R14'));
disp(strcat(num2str(currentProposedArrayOverall(1,1)),{' '},num2str(currentProposedArrayOverall(2,1))));

m=input('Press Enter to continue');

	
	


	disp('GMAP');
	
    gmapProposed=mean(currentProposedArrayOverall(:));
    disp(gmapProposed);
    
    
    
    