%Given a ship length, the ship's starting coordinate, and the ship's
%direction, this function returns an array in which each column represents
%a coordinate that a ship will occupy, where the first row is the row
%number and the second row is the column number.
%
%Note that the direction variable will work as follows: 1 means the 
%ship goes up from its starting coordinate, 2 means it goes right, 3 
%means it goes down, 4 means it goes left.
function allPosition = getAllPositions(length, startR, startC, direction)
    allPosition(1:2, 1) = [startR, startC];
    for i=2:length
        if (direction==1)
            allPosition(1:2, i) = [startR- i + 1, startC];
        elseif (direction==2)
            allPosition(1:2, i) = [startR, startC + i - 1];
        elseif (direction==3)
            allPosition(1:2, i) = [startR + i - 1, startC];
        else
            allPosition(1:2, i) = [startR, startC - i + 1];
        end
    end
end
