function move = playTTTT(varargin)

numIndices = 3;
%select how many indices you want to use
%for example: 3 indices mean board(i,j,k)
%             1 index mean board(k)

if nargin==4
    board = varargin{1};
    deph = varargin{2};
    player = varargin{3};
    numIndices = varargin{4};
elseif nargin==2
    board = varargin{1};
    player = varargin{2};
    deph = 6;
end
if numIndices ~= 1 
    numIndices = 1;
end
%convert all 2 to -1 for comfort calculations and manipulations with bord positions 
board(board==2) = -1;

if sum(sum(sum(board==0))) <= 60

    
if player==-1
        maxPlay = false;
elseif player==1
        maxPlay = true;
end
% *move is a 2D vector [i j]' where i = row where you decide to play, j = column
% *board is given as a three-by-three matrix containing: 0 = empty position, 1 = X, 2 = O
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
%to 1 , otherwise function will return 2 indices
if numIndices == 1
    move = AM(j);
elseif numIndices == 3
    q1 = rem(AM(j),size(board,1));
    if q1 == 0
        q1 = size(board,1);
    end
    q2 = 1+ ((AM(j) - q1)/size(board,1));
    move = [q1,q2];
end
else
    move = TTTT2(board);
end
end

