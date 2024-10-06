
%Returns 1 if any of the coordinates in the array of coordinates positions
%has a ship on the board, returns 0 otherwise
function hasShip = HasShip(positions, board)
    hasShip = 0;
    arrSize = size(positions);
    for i=1:arrSize(2)
        if board(positions(1, i),positions(2, i))~=2
            hasShip = 1;
        end
    end
end

