function val = EVALUATE (pos)
n=length(pos);
val = zeros(n,n,n);
for i=1:n
    x_num = sum(sum(pos(i,1:end,1:end)==1));
    o_num = sum(sum(pos(i,1:end,1:end)==-1));
    if (x_num>0) && (o_num==0)
        val(i,1:end,1:end) = val(i,1:end,1:end) + pos(i,1:end,1:end)*(x_num^2);
    end
    if (o_num>0) && (x_num==0)
        val(i,1:end,1:end) = val(i,1:end,1:end) + pos(i,1:end,1:end)*(o_num^2);
    end
%end
%evaluate lines

%for i=1:n
    x_num = sum(sum(pos(1:end,i,1:end)==1));
    o_num = sum(sum(pos(1:end,i,1:end)==-1));
    if (x_num>0) && (o_num==0)
        val(1:end,i,1:end) = val(1:end,i,1:end) + pos(1:end,i,1:end)*(x_num^2);
    end
    if (o_num>0) && (x_num==0)
        val(1:end,i,1:end) = val(1:end,i,1:end) + pos(1:end,i,1:end)*(o_num^2);
    end
    
    x_num = sum(sum(pos(1:end,1:end,i)==1));
    o_num = sum(sum(pos(1:end,1:end,i)==-1));
    if (x_num>0) && (o_num==0)
        val(1:end,1:end,i) = val(1:end,1:end,i) + pos(1:end,1:end,i)*(x_num^2);
    end
    if (o_num>0) && (x_num==0)
        for j=1:n
            for d=1:n
            val(j,i,d) = val(j,i,d) + pos(j,d,i)*(o_num^2);
        end
    end
end
%evaluate colunms


for z=1:n
    x_num = sum(diag(pos(:,:,z))==1);
    o_num = sum(diag(pos(:,:,z))==-1);
    if (x_num>0) && (o_num==0)
        for i=1:n
            val(i,i,z) = val(i,i,z) + pos(i,i,z)*(x_num^2);
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