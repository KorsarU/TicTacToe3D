function val = EVALUATE (pos)
n=length(pos);
val = zeros(n,n,n);
time = clock;
for z = 1:n
    local_pos = pos;
    r = 0;
    for x = 1:n
        %horizontal lines
        x_sum = 0;
        o_sum = 0;
        for y = 1:n
            x_sum = x_sum + local_pos(x,y,z);
            o_sum = o_sum + local_pos(x,y,z);
        end
        x_num = x_sum == 1;
        o_num = o_sum == -1;
        
        r = zeros(1,n);
        if(x_num>0 && o_num==0)
            r = val(x,:,z)+local_pos(x,:,z)*(x_num^2);
        end
        if(o_num>0 && x_num==0)
            r = val(x,:,z)+local_pos(x,:,z)*(o_num^2);
        end
        val(x,:,z) = r;
    end
end
%clock-time
%time = clock;
%for i=1:n
%    x_num = sum(sum(pos(i,1:end,1:end)==1));
%    o_num = sum(sum(pos(i,1:end,1:end)==-1));
%    if (x_num>0) && (o_num==0)
%        val(i,1:end,1:end) = val(i,1:end,1:end) + pos(i,1:end,1:end)*(x_num^2);
%    end
%    if (o_num>0) && (x_num==0)
%        val(i,1:end,1:end) = val(i,1:end,1:end) + pos(i,1:end,1:end)*(o_num^2);
%    end
%end
%clock - time
%evaluate lines

for i=1:n
    local_pos = pos;
    
    x_num = sum(sum(local_pos(1:end,i,1:end)==1));
    o_num = sum(sum(local_pos(1:end,i,1:end)==-1));
    if (x_num>0) && (o_num==0)
        for x=1:n
            for z = 1:n
            val(x,i,z) = val(x,i,z) + pos(x,i,z)*(x_num^2);
            end
        end
    end
    if (o_num>0) && (x_num==0)
        for x=1:n
            for z = 1:n
            val(x,i,z) = val(x,i,z) + pos(x,i,z)*(o_num^2);
            end
        end
    end
    
    x_num = sum(sum(pos(1:end,1:end,i)==1));
    o_num = sum(sum(pos(1:end,1:end,i)==-1));
    if (x_num>0) && (o_num==0)
        for x = 1:n
            for y = 1:n
                val(x,y,i) = val(x,y,i) + pos(x,y,i)*(x_num^2);
            end
        end
    end
    if (o_num>0) && (x_num==0)
        for x=1:n
            for d=1:n
            val(x,i,d) = val(x,i,d) + pos(x,d,i)*(o_num^2);
            end
        end
    end
end
%evaluate colunms


for z=1:n
    x_num = sum(diag(pos(:,:,z))==1);
    o_num = sum(diag(pos(:,:,z))==-1);
    if (x_num>0) && (o_num==0)
        for xy=1:n
            val(xy,xy,z) = val(xy,xy,z) + pos(xy,xy,z)*(x_num^2);
        end
    end
    if (o_num>0) && (x_num==0)
        for i=1:n
            val(i,i,z) = val(i,i,z) + pos(i,i,z)*(o_num^2);
        end
    end
end
%evaluate main diags

for z=1:n
    x_num = sum(diag(fliplr(pos(:,:,z)))==1);
    o_num = sum(diag(fliplr(pos(:,:,z)))==-1);
    if (x_num>0) && (o_num==0)
        
        for i=1:n
            val(i,n+1-i,z) = val(i,n+1-i,z) + pos(i,n+1-i,z)*(x_num^2);
        end
    end
    if (o_num>0) && (x_num==0)
        for i=1:n
        	val(i,n+1-i,z) = val(i,n+1-i,z) + pos(i,n+1-i,z)*(o_num^2);
        end
    end
end
%evaluate adverse diag

end