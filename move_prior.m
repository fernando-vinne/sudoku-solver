function[p, q, valid_prior] = move_prior(m,n)

%this function move the place of the desired place in -1, taking into
%account next line

valid_prior = 1;

if (n ~= 1)
    %move to back postition on the same line 
    p = m;
    q = n-1;
elseif (m == 1) && (n == 1)
    %can't move back 
    valid_prior = 0;
    p = 1;
    q = 1;
    return;
elseif (m ~= 1) && (n == 1)
    %move to prior line
    p = m-1;
    q = 9;
end

end
