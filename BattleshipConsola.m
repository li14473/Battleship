% Main game file

%% Setup
clear
clc

% Key for board arrays:
% 0 = empty space
% 1 = Carrier Regular (length = 5)
% 2 = Battleship Regular (length = 4)
% 3 = Cruiser Regular (length = 3)
% 4 = Submarine Regular (length = 2)
% 5 = Destroyer Regular (length = 1)
% 11 = Carrier Hit
% 12 = Battleship Hit
% 13 = Cruiser Hit
% 14 = Submarine Hit
% 15 = Destroyer Hit
% 21 = Carrier Sank
% 22 = Battleship Sank
% 23 = Cruiser Sank
% 24 = Submarine Sank
% 25 = Destroyer Sank

computerBoard = GenerateComputerBoard();
userBoard = GetUserBoard();

%% Main game loop 
while true
    % Display player's board
    disp('Your Board:');
    disp(userBoard);

    % Player (user)'s move
    userMove = GetUserMove();
    if IsHit(userMove, computerBoard)
        disp('You hit a ship!');
    else
        disp('Missed!');
    end

    % Check if the player has won
    if all(computerBoard(:) == 0)
        disp('Congratulations! You sunk all the computer ships. You win!');
        break;
    end

    % Computer's move
    computerMove = GetComputerMove();
    if IsHit(computerMove, userBoard)
        disp('Computer hit one of your ships!');
    else
        disp('Computer missed!');
    end

    % Check if the computer has won
    if all(userBoard(:) == 0)
        disp('Oh no! The computer sunk all your ships. You lose!');
        break;
    end
end
