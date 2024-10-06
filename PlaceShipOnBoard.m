function success = PlaceShipOnBoard(board, x, y, direction, length, key)
    % Place a ship on the board
    % Input:
    %   - board: the game board
    %   - x, y: starting coordinates of the ship
    %   - direction: 1=up, 2=right, 3=down, 4=left
    %   - length: length of the ship
    %   - key: ship key
    % Output:
    %   - success: true if the ship is placed successfully, false otherwise

    success = true;

    if direction == 1
        if y - length + 1 >= 1
            board(y:-1:y - length + 1, x) = str2double(key);
        else
            success = false;
        end
    elseif direction == 2
        if x + length - 1 <= 10
            board(y, x:x + length - 1) = str2double(key);
        else
            success = false;
        end
    elseif direction == 3
        if y + length - 1 <= 10
            board(y:y + length - 1, x) = str2double(key);
        else
            success = false;
        end
    elseif direction == 4
        if x - length + 1 >= 1
            board(y, x:-1:x - length + 1) = str2double(key);
        else
            success = false;
        end
    else
        success = false;
    end
end
