hFig = figure('Position', [100 100 400 400], 'MenuBar', 'none', 'Name', 'Sudoku Input', 'NumberTitle', 'off');

gridSize = 9;
boxSize = 40; % Size of each box in pixels
gap = 2; % Gap between boxes to visualize 3x3 sections
hEdit = zeros(gridSize); % Handle storage

for row = 1:gridSize
    for col = 1:gridSize
        xPos = (col-1)*boxSize;
        yPos = (gridSize-row)*boxSize;
        
        % Adjust for gap every 3 cells
        xPos = xPos + floor((col-1)/3)*gap;
        yPos = yPos - floor((row-1)/3)*gap;

        hEdit(row, col) = uicontrol('Style', 'edit', 'Position', [xPos, yPos, boxSize, boxSize], ...
            'FontSize', 12, 'String', '', ...
            'UserData', [row, col]); % Store the row and col in UserData for later
    end
end

hButton = uicontrol('Style', 'pushbutton', 'String', 'Submit', ...
    'Position', [170 5 60 30], 'Callback', @submitButtonCallback);

function submitButtonCallback(~, ~)
    matrix = zeros(9,9);

    for row = 1:9
        for col = 1:9
            val = str2double(get(hEdit(row, col), 'String'));
            if ~isnan(val) % Check if it's a valid number
                matrix(row, col) = val;
            end
        end
    end

    % Here, you can call your Sudoku solver with the input matrix
    disp(matrix); % Just displaying it for now
end