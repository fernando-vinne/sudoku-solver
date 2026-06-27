function visualize_sudoku(matrix)
    % Create a figure and axis
    figure('Color', 'white');
    ax = axes;
    hold on;
    
    % Set the axis properties
    axis([0 9 0 9]);
    set(ax, 'XTick', 0:1:9, 'YTick', 0:1:9, 'XTickLabel', [], 'YTickLabel', []);
    grid on;
    box on;

    % Thicken lines to separate the 3x3 boxes
    for i = 3:3:9
        plot([0 9], [i i], 'k-', 'LineWidth', 2);
        plot([i i], [0 9], 'k-', 'LineWidth', 2);
    end

    % Display the numbers
    for i = 1:9
        for j = 1:9
            if matrix(i, j) ~= 0
                text(j - 0.5, 9.5 - i, num2str(matrix(i, j)), ...
                    'FontSize', 16, 'FontWeight', 'bold');
            end
        end
    end
    hold off;
end
