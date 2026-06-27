function[placement_matrix] = pm_generator(sudoku)

%this function generates a 9x9 matrix containing only 0 and 1
%this matrix should not be changed during the execution of the program
%1 are on the places of the input
%0 are the number that the program is trying to solve

placement_matrix = zeros(9,9);

for k = 1:9
    for l = 1:9
        number = sudoku(k,l);
        if number ~= 0
            placement_matrix(k,l) = 1;
        end
    end
end


end