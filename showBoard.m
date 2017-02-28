
%Function for a pretty display field on the screen
function showBoard(board)
      board(board==1) = 'X';
      board(board==-1) = 'O';
      board(board==0) = '-';
      
      curStr = '';
      for k = 1:size(board,3)
        disp(strcat('#',int2str(k),': '));
        for i = 1:size(board,1)
          for j =1:size(board,2)
              curStr = strcat(curStr,'|_',char(board(i,j,k)),'_|');
          end
          disp(curStr);
          curStr='';
        end
      end
end

