%Enter point
function game()

player1 = 'human';
player2 = 'ai   ';
isTerminated = false;
currentPlayer = 1;

%deph of the searching
deph = 4;

%select size of the board
boardSize = 4;
board = zeros(boardSize,boardSize,boardSize);

   
sc = 0;     

while ~isTerminated
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
            board(x) = currentPlayer;
            currentPlayer = -currentPlayer;
        else
            q = playTTTT(board,deph,currentPlayer,1);
            board(q(1)) = currentPlayer;
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
            q = playTTTT(board,deph,currentPlayer,1);
            board(q(1)) = currentPlayer;
            currentPlayer = -currentPlayer;
        end
    end
    showBoard(board);
    [isTerminated, sc] = checkBoard(board);
end

    if sc == 0
            disp('It is a draw');
    elseif sc > 0
            disp('X wins');
    elseif sc < 0
            disp('O wins');
    end

end



