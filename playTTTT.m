function move = playTTTT(varargin)

numIndices = 3;
%select how many indices you want to use
%for example: 3 indices mean board(x,y,z)
%             1 index mean board(k)

if nargin==4
    board = varargin{1};
    deph = varargin{2};
    player = varargin{3};
    numIndices = varargin{4};
elseif nargin==2
    board = varargin{1};
    player = varargin{2};
    deph = 2;
end
if numIndices ~= 1 
    numIndices = 1;
end
%convert all 2 to -1 for comfort calculations and 
%manipulations with bord positions 
board(board==2) = -1;

if sum(sum(sum(board==0))) <= 61
    
if player==-1
        maxPlay = false;
elseif player==1
        maxPlay = true;
end
% *move is a 3D vector [x y z]' where x = row where you decide to play, 
% *y = column and z = is a depth.
% *board is given as a three-by-three matrix containing: 
% *0 = empty position, 1 = X, 2 = O
% *player is whether your agent will play for 1=X or 2=O

% Load presaved cache to avoid hard computations
[is_loaded, j] = cache_load(board);


%indices of the all possible moves
AM = getAvailableMoves(board);
scores = zeros(1,length(AM));

if ~is_loaded

    %evaluation of the ways in a tree
    for i = 1:length(AM)
        newBoard = board;
        newBoard(AM(i)) = player;
        if ~maxPlay
            scores(i) = miniMax(newBoard,deph,-player,-Inf,+Inf,true);
        else
            scores(i) = miniMax(newBoard,deph,-player,-Inf,+Inf,false);
        end
    end

    if maxPlay
    %if maximazer plays
        [~,j] = max(scores);  
    else  
    %if minimazer plays
        [~,j] = min(scores);
    end
    
    cache_save(board, j);
end   

%if you want to use 1 index of the matrix , you can set numIndices equals
%to 1 , otherwise function will return 3 indices
if numIndices == 1
    move = AM(j);
elseif numIndices == 3
    [x,y,z] = ind2sub(size(board), AM(j));
    move = [x,y,z];
end
else
    [x,y,z] = ind2sub(size(board), TTTT2(board));
    move = [x,y,z];
end
end

