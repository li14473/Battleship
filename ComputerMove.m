%The computer makes its next move
function userBoard = ComputerMove(userBoard, boardWithShips)
    activeRow = 11; %Initialized to 11 because it will surely be changed
    activeCol = 11;
    
    %Clear any sunken ships from the list of hits so that the computer will
    %not try to sink a ship for the second time
    userBoardToRestore = userBoard;
    for row=1:10
        for col=1:10
            if boardWithShips(row, col) == 3
                %For horizontal ships
                currentRow = row;
                ogCol = col;
                currentCol = col;
                while (userBoard(currentRow, currentCol) == 9)
                    if boardWithShips(currentRow, currentCol) == 5
                        userBoard(currentRow, ogCol:currentCol) = 10;
                    end
                    currentCol = currentCol + 1;
                end
            end

            if boardWithShips(row, col) == 6
                %For vertical ships
                currentRow = row;
                ogRow = row;
                currentCol = col;
                while (userBoard(currentRow, currentCol) == 9)
                    if boardWithShips(currentRow, currentCol) == 8
                        %A sunken ship has been found
                        userBoard(ogRow:currentRow, currentCol) = 10;
                    end
                    currentRow = currentRow + 1;
                end
            end
        end
    end
    
    %If any ships have been hit , this loop will find the
    %coordinate of the hit.
    for row=1:10
        for col=1:10
            if userBoard(row, col) == 9
                activeRow = row;
                activeCol = col;
                break;
            end
        end
    end
    
    %This block will only execute if there is a ship that has been hit but not
    %sunk
    if activeRow~=11
        %Initialize targets in all directions to 100, meaning they do not exist
        %(in the event that they do exist, they will be assigned their proper
        %value)
        targetOnRight = 100;
        targetOnLeft = 100;
        targetBelow = 100;
        targetAbove = 100;
    
        %If the target exists, assign it its proper value
        if activeCol<10
            targetOnRight = userBoard(activeRow, activeCol+1);
        end
        if activeCol>1
            targetOnLeft = userBoard(activeRow, activeCol-1);
        end
        if activeRow>1
            targetAbove = userBoard(activeRow-1, activeCol);
        end
        if activeRow<10
            targetBelow = userBoard(activeRow+1, activeCol);
        end
    
        %Find the orientation of the current target ship
        if (targetOnRight == 9) || (targetOnLeft == 9)
            orientation = "horizontal";
        elseif (targetAbove == 9) || (targetBelow == 9)
            orientation = "vertical";
        else
            orientation = "mystery";
        end
    
        madeMove = 0;
        if orientation == "mystery"
            madeMove = 1;
        end
        loopCounter = 0;
    
        while ~madeMove
            %Make the appropriate move based on the orientation
            %For a horizontal orientation
            if (orientation == "horizontal")
                for i=activeCol:10
                    if userBoard(activeRow, i) < 9
                        userBoardToRestore(activeRow, i) = 8;
                        madeMove = 1;
                        break
                    elseif userBoard(activeRow, i) == 10
                        break
                    end
                end
                if (~madeMove)
                    for i=activeCol:-1:1
                        if userBoard(activeRow, i) < 9
                            userBoardToRestore(activeRow, i) = 8;
                            madeMove = 1;
                            break
                        elseif userBoard(activeRow, i) == 10
                            break
                        end
                    end
                end
            end
            %For a vertical orientation
            if (orientation == "vertical")
                for i=activeRow:10
                    if userBoard(i, activeCol) < 9
                        userBoardToRestore(i, activeCol) = 8;
                        madeMove = 1;
                        break
                    elseif userBoard(i, activeCol) == 10
                        break
                    end
                end
                if (~madeMove)
                    for i=activeRow:-1:1
                        if userBoard(i, activeCol) < 9
                            userBoardToRestore(i, activeCol) = 8;
                            madeMove = 1;
                            break
                        elseif userBoard(i, activeCol) == 10
                            break
                        end
                    end
                end
            end
            %The following is added to the end of this loop to ensure the
            %computer is not stumped by adjacent ships
            loopCounter = loopCounter+1;
            if loopCounter == 1
                if orientation == "horizontal"
                    orientation = "vertical";
                elseif orientation == "vertical"
                    orientation = "horizontal";
                end
            elseif loopCounter == 2 && ~madeMove
                orientation = "random";
                activeRow = 11;
                madeMove = 1;
            end
        end
    
    
        %The following only executes if the current target has no other hits
        %around it
        if orientation=="mystery"
            if targetOnRight< 9
                userBoardToRestore(activeRow, activeCol+1) = 8;
            elseif targetOnLeft< 9
                userBoardToRestore(activeRow, activeCol-1) = 8;
            elseif targetBelow<9
                userBoardToRestore(activeRow+1, activeCol) = 8;
            elseif targetAbove< 9
                userBoardToRestore(activeRow-1, activeCol) = 8;
            else
                activeRow = 11;
                madeMove = 0;
            end
        end
    end
    
    userBoard = userBoardToRestore;
    %If there is no known target, make a random move
    if activeRow == 11
        madeMove = 0;
        while ~madeMove
            activeRow = randi(10, 1 ,1);
            activeCol = randi(10, 1 ,1);
            if userBoard(activeRow, activeCol) < 9
                userBoard(activeRow, activeCol) = 8;
                madeMove = 1;
            end
        end
    end
    %Now, assign the spot picked the correct HIT/MISS value
    for row=1:10
        for col=1:10
            if userBoard(row,col) == 8
                if (boardWithShips(row,col) > 2 && boardWithShips(row,col) <= 9)
                    %for a hit
                    userBoard(row,col) = 9;
                else
                    userBoard(row, col) = 10;
                end
            end
        end
    end
end
       