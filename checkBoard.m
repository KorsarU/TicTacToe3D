% function for heuristic evaluation
function [isTerminated,score] = checkBoard(board)

    board(board==2) = -1;

    isTerminated = false;
    score = 0;
    l = board_size_1;
    k = 5000;
    zz = length(find(board));
    board_size_1 = size(board,1);

    for j=1:board_size_1
        for i=1:board_size_1
            for d=1:2
                sbij = sum(board(i,j,:), d);
                if sbij==-l
                    isTerminated = true;
                    score = -k+zz;
                    return;
                end
                if sbij==l
                    isTerminated = true;
                    score = k-zz;
                    return;
                end
            end
        end
    end

    % --------- START CHECK DIAGONALS------------
    for i=1:board_size_1
        tbi = trace(board(:,:,i));
        if tbi==-l
               isTerminated = true;
               score = -k+zz;
               return;
        end
        if tbi==l
               isTerminated = true;
               score = k-zz;
               return;
        end

        tfbi = trace(fliplr(board(:,:,i)));
        if tfbi==-l %fliptr - ??????? ???????
               isTerminated = true;
               score = -k+zz;
               return;
        end
        if tfbi==l
               isTerminated = true;
               score = k-zz;
               return;
        end
    end

    for i=1:board_size_1
        tbi = trace(board(:,i,:));
        if tbi==-l
               isTerminated = true;
               score = -k+zz;
               return;
        end
        if tbi==l
               isTerminated = true;
               score = k-zz;
               return;
        end

        tfbi = trace(fliplr(board(:,i,:)));
        if tfbi==-l %fliptr - ??????? ???????
               isTerminated = true;
               score = -k+zz;
               return;
        end
        if tfbi==l
               isTerminated = true;
               score = k-zz;
               return;
        end
    end

    for i=1:board_size_1
        tbi = trace(board(i,:,:));
        if tbi==-l
               isTerminated = true;
               score = -k+zz;
               return;
        end
        if tbi==l
               isTerminated = true;
               score = k-zz;
               return;
        end

        tfbi = trace(fliplr(board(i,:,:)));
        if tfbi==-l %fliptr - ??????? ???????
               isTerminated = true;
               score = -k+zz;
               return;
        end
        if tfbi==l
               isTerminated = true;
               score = k-zz;
               return;
        end
    end
    % --------- END CHECK DIAGONALS------------


    % -------- START CHECK 3D DIAGONALS -----------
    tfb_1 = trace(board);
    if tfb_1==-l %fliptr - ??????? ???????
           isTerminated = true;
           score = -k+zz;
           return;
    end
    if tfb_1==l
           isTerminated = true;
           score = k-zz;
           return;
    end

    tfb_2 = trace(fliplr(board));
    if tfb_2==-l %fliptr - ??????? ???????
           isTerminated = true;
           score = -k+zz;
           return;
    end
    if tfb_2==l
           isTerminated = true;
           score = k-zz;
           return;
    end

    tfb_3 = trace(flipud(board));
    if tfb_3==-l %fliptr - ??????? ???????
           isTerminated = true;
           score = -k+zz;
           return;
    end
    if tfb_3==l
           isTerminated = true;
           score = k-zz;
           return;
    end

    tfb_4 = trace(flipud(fliplr(board)));
    if tfb_4==-l %fliptr - ??????? ???????
           isTerminated = true;
           score = -k+zz;
           return;
    end
    if tfb_4==l
           isTerminated = true;
           score = k-zz;
           return;
    end

    % -------- END CHECK 3D DIAGONALS -------------


    if all(all(board))
        isTerminated = true;
    end

    if ~isTerminated && score==0
       score = sum(sum(EVALUATE(board)));
    end

end
