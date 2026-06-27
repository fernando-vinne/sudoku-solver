function[p, q, valid_next] = move_next(m,n)

%this function move the place of the desired place in +1, taking into
%account next line

valid_next = 1;

if (n ~= 9)
    %move to next postition on the same line 
    p = m;
    q = n+1;
elseif (m == 9) && (n == 9)
    %can't move any further 
    valid_next = 0;
    p = 9;
    q = 9;
    return;
elseif (m ~= 9) && (n == 9)
    %move to next line
    p = m+1;
    q = 1;
end

end


