% function for heuristic evaluation
function [isTerminated,score] = checkBoard(board)
    
    % swap 2s to -1 for computation tricks
    board(board==2) = -1;

    isTerminated = false;
    score = 0;

    % compute and save common used information about board
    l = size(board,1);
    k = 5000;
    zz = length(find(board));
    board_size_1 = size(board,1);
    board_size_2 = size(board,2);

    % precompute all flips of board
    board_lr = fliplr(board);
    board_ud = flipud(board);
    board_lrud = flipud(board_lr);

    % -------------START compute all slices of cube ---------
    for i=1:board_size_1
        for j=1:board_size_1
            sbij = sum(board(i,j,:));
            sbij_1 = sum(board(i,:,j));
            sbij_2 = sum(board(:,i,j));
            
            if sbij==-l || sbij_1==-l || sbij_2==-l
                isTerminated = true;
                score = -k+zz;
                return;
            end
            if sbij==l || sbij_1==l || sbij_2==l
                isTerminated = true;
                score = k-zz;
                return;
            end
            
            
        end
    end
    % -------------END compute all slices of cube ---------


    % --------- START CHECK DIAGONALS------------
    for i=1:board_size_1
        tbi_1 = trace(board(:,:,i));
        tbi_2 = trace(board_lr(:,:,i));
        tbi_3 = trace(board_ud(:,:,i));
        tbi_4 = trace(board_lrud(:,:,i));
        
        rb_1 = trace(reshape(board(i,:,:), [board_size_1, board_size_2]));
        rb_2 = trace(reshape(board_lr(i,:,:), [board_size_1, board_size_2]));
        rb_3 = trace(reshape(board_ud(i,:,:), [board_size_1, board_size_2]));
        rb_4 = trace(reshape(board_lrud(i,:,:), [board_size_1, board_size_2]));
        
        trb_1 = trace(reshape(board(:,i,:), [board_size_1, board_size_2]));
        trb_2 = trace(reshape(board_lr(:,i,:), [board_size_1, board_size_2]));
        trb_3 = trace(reshape(board_ud(:,i,:), [board_size_1, board_size_2]));
        trb_4 = trace(reshape(board_lrud(:,i,:), [board_size_1, board_size_2]));
        
        if tbi_1==-l || tbi_2==-l || tbi_3==-l || tbi_4==-l || ...
            trb_1==-l || trb_2==-l || trb_3==-l || trb_4==-l || ...
            rb_1==-l || rb_2==-l || rb_3==-l || rb_4==-l
               isTerminated = true;
               score = -k+zz;
               return;
        end
        if tbi_1==l || tbi_2==l || tbi_3==l || tbi_4==l || ...
            trb_1==l || trb_2==l || trb_3==l || trb_4==l || ...
            rb_1==l || rb_2==l || rb_3==l || rb_4==l
               isTerminated = true;
               score = k-zz;
               return;
        end
    end

    % --------- END CHECK DIAGONALS------------


    % -------- START CHECK 3D DIAGONALS -----------
    
    tfb_1 = 0;
    for i=1:size(board,3)
        tfb_1 = tfb_1 + board(i,i,i);
    end
    
    %tfb_1 = trace(board);
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
    
    tfb_2 = 0;
    for i=1:size(board_lr,3)
        tfb_2 = tfb_2 + board_lr(i,i,i);
    end
    %tfb_2 = trace(board_lr);
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
    
    tfb_3 = 0;
    for i=1:size(board_ud, 3)
        tfb_3 = tfb_3+board_ud(i,i,i);
    end
    %tfb_3 = trace(board_ud);
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

    tfb_4 = 0;
    for i=1:size(board_lrud,3)
        tfb_4 = tfb_4 + board_lrud(i,i,i);
    end
    %tfb_4 = trace(board_lrud);
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


    if all(all(all(board)))
        isTerminated = true;
    end

    if ~isTerminated && score==0
       score = sum(sum(sum(EVALUATE(board))));
    end

end
