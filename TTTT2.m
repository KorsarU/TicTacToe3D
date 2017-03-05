
function res = TTTT2 (inp_pos)
n=length(inp_pos);
pos = inp_pos==2;
pos = inp_pos - pos*3;
% casting "2" in the input position to "-1"
%it simplifies calculations

s = sum(sum(sum(pos))); 
if s==0
    player = 1;
else if s==1
        player = -1;
    else
        fprintf('Impossible position. Number of crisses and zeros is mismatched.');
        res = [0,0];
        return;
    end
end
counter_max = 1;
counter_min = 1;
max_x = [-10000,0,0,0];
min_x = [10000,0,0,0];
for d=1:n
    for i=1:n
        for j=1:n
            if pos(i,j,d)==0
                branch = pos;
                branch(i,j,d) = player;
                tmptest = EVALUATE(branch);
                x = sum(sum(sum(tmptest)));
                if x>max_x(1)
                    max_x = [x,i,j,d];
                    counter_max = 1;
                else
                    if x==max_x(1)
                        counter_max = counter_max+1;
                        max_x(counter_max,:) = [x,i,j,d];
                    end
                end
                if x<min_x(1)
                    min_x = [x,i,j,d];
                    counter_min = 1;
                else
                    if x==min_x(1)
                        counter_min = counter_min + 1;
                        min_x(counter_min,:) = [x,i,j,d];
                    end
                end
                
            end
        end
    end
end

if player==1
    res = max_x(randi(counter_max,1),2:4);
else
    res = min_x(randi(counter_min,1),2:4);
end
end