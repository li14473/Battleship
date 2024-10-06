%User Attacks on Computer Board
%Michael 

function [userMoveRow, userMoveCol] = GetUserMove(computerBoard, scene)

fprintf('Click the location on the computer board you want to strike') 

%Determine which sprite was clicked
    % r = row, c= column
    
[r,c,~] = getMouseInput(computerBoard); 

userMoveRow = r;
userMoveCol = c;


end
