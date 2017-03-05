function cache_save( board, j )
    bs = nnz(board);
    
    % Ensure that folder exists
    Folder = pwd; 
    [deepestFolder, FolderName] =fileparts(Folder);
    % DataFolder = ['data', FolderName];
    DataFolder = sprintf('%s/%s/data', deepestFolder, FolderName);
    % DataFolder = 'data/';

    if ~exist(DataFolder, 'dir')
        mkdir(DataFolder);
    end
    
    path_to_file = sprintf('%s/n_%d.txt', DataFolder, bs);
    fileID = fopen(path_to_file, 'a');
    
    
    % rp = reshape(board, [1, 64]);
    res = '';
    for i = 1:64
        res =  sprintf('%s%d',res, board(i));
    end
    
    to_write = sprintf('%s :: %d\n', res, j);
    fwrite(fileID, to_write); % char(bs) + ' :: ' + char(j)); 
    fclose(fileID);
    
end

