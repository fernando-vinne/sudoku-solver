function[solution, errMsg] = solver(sudoku)

solution = sudoku;
errMsg = []; %initiate error message 

% 1. Is size of soduko correct?

s = size(sudoku);
if (s(1) ~= 9) || (s(2) ~= 9)
    %disp("Error #1: Invalid sudoku input: Matrix is not 9x9");
    return;
end

%2. Place holder matrix to not change input numbers

placement_matrix = pm_generator(sudoku);

%3. Is input valid?

for i = 1:9
    for k = 1:9
        if placement_matrix(i,k) == 1
            [valid] = valid_test(i,k,solution);
            if valid == 0
                %disp("Error #4: Invalid sudoku input!");
                errMsg = 'Error #4: Invalid sudoku input!';
                return;
            end
        end
    end
end

% 4. Loop for solving

m = 1;
n = 1;
c = 1;

while(1)
    switch c
        case 1 %proof number
            [valid] = valid_test(m,n,solution);
            if valid == 1
                c = 2;
            else
                c = 4;
            end

        case 2 %move next
            [m, n, valid_next] = move_next(m,n);
            c=1;
            if valid_next == 0
                c = 5;
            end

        case 3 %move prior
            [m, n, valid_prior] = move_prior(m,n);
            while (placement_matrix(m,n) == 1)
                [m, n, valid_prior] = move_prior(m,n);
                if valid_prior == 0
                    break;
                end
            end
            c=4;
            if valid_prior == 0
                %disp("Error #2: move_prior not valid. Probably invalid sudoku input: No solutions were found");
                errMsg = 'Error #2: move_prior not valid. Probably invalid sudoku input: No solutions were found';
                break;
            end

        case 4 % +1
            if placement_matrix(m,n) == 1
                c = 2;
            else
                if solution(m,n) == 9
                    solution(m,n) = 0;
                    c = 3;
                else
                    solution(m,n) = solution(m,n) +1;
                    c = 1;
                end

            end

        case 5 %final check
            for i=1:9
                for k=1:9
                valid = valid_test(i,k,solution);
                if valid == 0
                    %disp("Error #3: Final check failed. No solutions were found");
                    errMsg = 'Error #3: Final check failed. No solutions were found';
                    %disp("m:");
                    %disp(m);
                    %disp("n:");
                    %disp(n);
                    return;
                end
                end
            end
            %disp("A valid solution was found!");
            errMsg = 'A valid solution was found!';
            %visualize_sudoku(solution); %don't need visualize anymore
            %since it runs on the program 
            break;

    end


end


