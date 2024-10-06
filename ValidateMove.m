%Returns 1 if the coordinate [row, col] is a valid move on the board,
%returns 0 otherwise
%Note that the direction variable will work as follows: 1 means the 
%ship goes up from its starting coordinate, 2 means it goes right, 3 
%means it goes down, 4 means it goes left.
function valid = ValidateMove(startingPos, length, direction)
% length is the length of the ship
% direction is from 1 to 4
%startingPos is the start of the ship

valid = 1;

  if(direction == 1) %if the ship goes up
      if(startingPos(1, 1) < length)
          valid = 0;
      end
  elseif(direction == 2) %if the ship goes right
      if(startingPos(1, 2) > (11 - length))
          valid = 0;
      end
  elseif(direction == 3) %if the ship goes down
      if(startingPos(1, 1) > (11 - length))
          valid = 0;
      end
  else
      if(startingPos(1, 2) < length)
          valid = 0;
      end
  end


