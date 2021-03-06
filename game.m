%Enter point
function result = game()

count_of_rounds = 1;
sum_of_rounds = zeros(1,count_of_rounds);
count_of_moves = zeros(1,count_of_rounds);
winners = zeros(1,count_of_rounds);
for games = 1:count_of_rounds
player1 = 'ai   ';
player2 = 'ai   ';
isTerminated = false;
currentPlayer = 1;

%deph of the searching
deph = 2;

%select size of the board
boardSize = 4;
board = zeros(boardSize,boardSize,boardSize);
   
sc = 0;

    time = clock;
    while ~isTerminated
        count_of_moves(games) = count_of_moves(games) + 1;
        if currentPlayer == 1
            disp('player1 moves');
            if player1 == 'human'
                prompt = 'Your turn:';
                ok = false;
                while ~ok
                    x = input(prompt);
                    if board(x)==0
                        ok =true;
                    else
                        warning('Wrong move! Please try again');
                    end
                end
                if size(x,2)>1
                    board(x(1),x(2),x(3)) = currentPlayer;
                else
                    board(x) = currentPlayer;
                end
                currentPlayer = -currentPlayer;
            else
                q = playTTTT(board,currentPlayer);
                if(size(q)==1)
                    board(q) = currentPlayer;
                else
                    board(q(1),q(2),q(3)) = currentPlayer;
                end
                currentPlayer = -currentPlayer;
            end
        else
            disp('player2 moves');
            if player2 == 'human'
                prompt = 'Your turn:';
                ok = false;
                while ~ok
                    x = input(prompt);
                    if board(x)==0
                        ok =true;
                    else
                        warning('Wrong move! Please try again');
                    end
                end
                board(x) = currentPlayer;
                currentPlayer = -currentPlayer;
            else
                q = playTTTT(board,deph,currentPlayer,3);
                if(size(q)==1)
                    board(q) = currentPlayer;
                else
                    board(q(1),q(2),q(3)) = currentPlayer;
                end
                currentPlayer = -currentPlayer;
            end
        end
        showBoard(board);
        [isTerminated, sc] = checkBoard(board);
    end
    %showBoard(board);
    sum_of_rounds(games) = etime(clock, time);
    if sc == 0
            winners(games) = 0;
            disp('It is a draw');
    elseif sc > 0
            winners(games) = 1;
            disp('X wins');
    elseif sc < 0
            winners(games) = 2;
            disp('O wins');
    end
end
    time = sum(sum_of_rounds)/count_of_rounds;
    result = [time, count_of_rounds, sum_of_rounds, count_of_moves, winners]; 
end



