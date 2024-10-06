function won = checkWinCondition(board)
%Based on a given board, this function returns true/false based on whether
%the board has all the ships sunk (true if all ships are sunk).  It does
%this by counting the total amount of sunk ships on the board.
won = 0;
sunkCount = 0;

for i=0:10
    for j=0:10
        if board(i,j) >20
            sunkCount = sunkCount + 1;
        end
    end
end

%Note: there are 17 total ship tiles that can be sunk
if sunkCount == 17
    won = 1;
end