% function for heuristic evaluation
function [isTerminated,score] = checkBoard(board)
    
    board(board==2) = -1;
    
    isTerminated = false;
    score = 0;
    l = size(board,1);
    k = 500;
    zz = length(find(board));
     
    for i=1:size(board,1)
        if sum(board(i,:),2)==-l
            isTerminated = true;
            score = -k+zz;
            return;
        end
        
        if sum(board(i,:),2)==l
            isTerminated = true;
            score = k-zz;
            return;
        end
    end
    
    for i=1:size(board,1)
        if sum(board(:,i),1)==-l
            isTerminated = true;
            score = -k+zz;
            return;
        end
        
        if sum(board(:,i),1)==l
            isTerminated = true;
            score = k-zz;
            return;
        end
    end
    
    for i=1:size(board,1)
        if trace(board(:,:,i))==-l
               isTerminated = true;
               score = -k+zz;
               return;
        end
    
    
        if trace(board(:,:,i))==l
               isTerminated = true;
               score = k-zz;
               return;
        end
    end
    %???????? ???????? ? ?????? ??????????
    
    for i=1:size(board(:,:,1))
        if trace(fliplr(board(:,:,i)))==-l %fliptr - ??????? ???????
               isTerminated = true;
               score = -k+zz;
               return;
        end
    
        if trace(fliplr(board(:,:,i)))==l
               isTerminated = true;
               score = k-zz;
               return;
        end
    end
    if all(all(board)) 
        isTerminated = true;
    end
    
    if ~isTerminated && score==0
       score = sum(sum(EVALUATE(board)));
    end
    
end

