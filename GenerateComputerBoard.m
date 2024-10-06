%Returns the board of the computer.  A digit 2 indicates that there is no
%ship in that position, and a digit 3-8 indicates that one of the ships is
%in that position.
function board = GenerateComputerBoard()
    board = zeros(10,10);
    board = board + 2; %Start with a blank board (2 is the water sprite)
    shipLengths = [5, 4, 3, 3, 2]; %The lengths of the 5 ships needing placed
    for i=1:5
        startingPos = [randi(10, 1 ,1), randi(10,1,1)];
        direction = randi(1,4);
        %Note that the direction variable will work as follows: 1 means the 
        %ship goes up from its starting coordinate, 2 means it goes right, 3 
        %means it goes down, 4 means it goes left.
        allPositions = getAllPositions(shipLengths(i), startingPos(1), startingPos(2), direction);
        while (ValidArray(allPositions) == 0 || HasShip(allPositions, board) == 1)
            startingPos = [randi(10, 1 ,1), randi(10,1,1)];
            direction = randi(4,1,1);
            allPositions = getAllPositions(shipLengths(i), startingPos(1), startingPos(2), direction);
        end
        dir = direction(1);
        arrSize = size(allPositions);
        if (dir == 1) || (dir == 3)
            %For vertical ships
            for j=1:arrSize(2)
                %Fill the body of the ship
                board(allPositions(1,j), allPositions(2,j)) = 7;
            end
            %Correct the ends of the ship
            if (dir == 1)
                %For ships starting at the bottom
                board(allPositions(1, arrSize(2)), allPositions(2, arrSize(2))) = 6;
                board(allPositions(1, 1), allPositions(2, 1)) = 8;
            else
                %For ships starting at the top
                board(allPositions(1, 1), allPositions(2, 1)) = 8;
                board(allPositions(1, arrSize(2)), allPositions(2, arrSize(2))) = 6;
            end
        else
            %For horizontal ships
            for j=1:arrSize(2)
                %Fill the body of the ship
                board(allPositions(1,j), allPositions(2,j)) = 4;
            end
            %Correct the ends of the ship
            if (dir == 2)
                %For ships starting at the left
                board(allPositions(1, 1), allPositions(2, 1)) = 3;
                board(allPositions(1, arrSize(2)), allPositions(2, arrSize(2))) = 5;
            else
                %For ships starting at the right
                board(allPositions(1, 1), allPositions(2, 1)) = 5;
                board(allPositions(1, arrSize(2)), allPositions(2, arrSize(2))) = 3;
            end
        
        end
    end
end
    
