function [ is_load, j ] = cache_load( board )
    bs = nnz(board);
    is_load = false;
    j = -1;
    
    % Ensure that folder exists
    Folder = pwd; 
    [deepestFolder, FolderName] =fileparts(Folder);
    % DataFolder = ['data', FolderName];
    DataFolder = sprintf('%s/%s/data', deepestFolder, FolderName);
    % DataFolder = 'data/';
    
    path_to_file = sprintf('%s/n_%d.txt', DataFolder, bs);
    
    if exist(path_to_file, 'file')
       
        % Rotations must be here
        res = '';
        for i = 1:64
            res =  sprintf('%s%d',res, board(i));
        end
        
        fileID = fopen(path_to_file, 'r');
        frmt = '%s';
        
        sfile = fscanf(fileID, frmt);
        fclose(fileID);
        
        cnum = size(sfile, 1);
        for i =1:cnum
            st = strsplit(sfile(i,:), '::');
            if char(st(1)) == res
                j = str2num(char(st(2)));
                is_load = true; 
                return
            end
        end
    end
    
    
end

