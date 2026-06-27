function[valid] = valid_test(m,n,solution)

%this function check if the number in a line m, row n is a valid solution
%(excluiding zeros) and returns 1 (for valid) or 0 (for invalid)

%test in the line

number_to_test = (solution(m,n));

valid = 1;

if solution(m,n) == 0
    valid = 0;
    return;
end


for k = 1:9
    line_number = solution(m,k);
    if (k ~= n) && (number_to_test == line_number)
        valid = 0;
        return;
    end
end

%test column

for k = 1:9
    column_number = solution(k,n);
    if (k ~= m) && (number_to_test == column_number)
        valid = 0;
        return;
    end
end

%test square

square_number_line_matrix = [1 1 1 1 1 1 1 1 1 ; 1 1 1 1 1 1 1 1 1 ; 1 1 1 1 1 1 1 1 1 ; 4 4 4 4 4 4 4 4 4 ; 4 4 4 4 4 4 4 4 4 ; 4 4 4 4 4 4 4 4 4 ; 7 7 7 7 7 7 7 7 7 ; 7 7 7 7 7 7 7 7 7 ; 7 7 7 7 7 7 7 7 7];
square_number_line = square_number_line_matrix(m,n);

square_number_column_matrix = [1 1 1 4 4 4 7 7 7 ; 1 1 1 4 4 4 7 7 7; 1 1 1 4 4 4 7 7 7 ; 1 1 1 4 4 4 7 7 7 ; 1 1 1 4 4 4 7 7 7 ; 1 1 1 4 4 4 7 7 7 ; 1 1 1 4 4 4 7 7 7 ; 1 1 1 4 4 4 7 7 7 ; 1 1 1 4 4 4 7 7 7];
square_number_column = square_number_column_matrix(m,n);

for k=square_number_line:(square_number_line+2)
    for j=square_number_column:(square_number_column+2)
        square_number = solution(k,j);
        if (k ~= m) && (j ~= n) && (number_to_test == square_number)
            valid = 0;
            return;
        end
    end
end

end