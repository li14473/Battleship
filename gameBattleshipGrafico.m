close all
% Initialize scene and set the color
my_scene = simpleGameEngine('Battleship.png',84,84,1,[160, 160, 160]);
% Set up variables to name the various sprites
blank_sprite = 1;
water_sprite = 2;
left_ship_sprite = 3;
horiz_ship_sprite = 4;
right_ship_sprite = 5;
top_ship_sprite = 6;
vert_ship_sprite = 7;
bot_ship_sprite = 8;
hit_sprite = 9;
miss_sprite = 10;

% Display empty board
board_display = water_sprite * ones(10,21);
board_display(:,11) = blank_sprite;
% Set up hits and misses layer
hitmiss_display = blank_sprite * ones(10,21);

%copy the board
board_aux = board_display;

board_display(:,11) = blank_sprite;


drawScene(my_scene,board_display,hitmiss_display)
title('Player        VS.        AI');

clc

%Get the user board
userBoard = GetUserBoard();
board_display(:,1:10) = userBoard;

%Generate the computer board
cpuBoardHidden = GenerateComputerBoard();

drawScene(my_scene,board_display,hitmiss_display)
title("Make a move!")

% Logic of the game
while true
    % Turn player
    playerMoveValid = 0;
    % check if the player clicked on a valid box
    while (~playerMoveValid)
        [r,c,bb] = my_scene.getMouseInput();  % get player input
        playerMove = [r,c];
        if playerMove(1) >= 1 && playerMove(1) <= 10 && playerMove(2) >= 12 && playerMove(2) <= 21 && hitmiss_display(playerMove(1), playerMove(2)) ~= 10 && hitmiss_display(playerMove(1), playerMove(2)) ~= 9
            playerMoveValid = 1;
            %Now, values will be compared to the small CPU only board, so
            %they must be changed from range 12-21 to 1-10
            playerMove(2) = playerMove(2)-11;
            if cpuBoardHidden(playerMove(1), playerMove(2)) > 2 && cpuBoardHidden(playerMove(1), playerMove(2)) < 9
                % the player hit a ship of the AI
                disp('You hit a ship!');
                board_display(playerMove(1), playerMove(2)+11) = 2;
                hitmiss_display(playerMove(1), playerMove(2)+11) = hit_sprite; 
            else
                % The player missed a hit
                disp('Missed!');
                hitmiss_display(playerMove(1), playerMove(2)+11) = miss_sprite;  
            end
    
        end
    end
    drawScene(my_scene,board_display,hitmiss_display)
    % Check if the player win
    tab = hitmiss_display(:,12:21); %board of the cpu
    cont = 0;
    for i = 1:10
        for j = 1:10
            if tab(i, j) == 9
                cont = cont + 1;
            end
        end
    end
    %Note: 17 is the amount of hits necesary to sink all ships
    if cont == 17
        title('Congratulations, you win!')
        break;
    end
    
    
    %Computer's Turn
    hitmiss_display(:, 1:10) = ComputerMove(hitmiss_display(:, 1:10), board_display(:, 1:10));
    drawScene(my_scene,board_display,hitmiss_display)

    % Check if the Computer wins
    tab = hitmiss_display(:,1:10); %board of the player
    cont = 0;
    for i = 1:10
        for j = 1:10
            if tab(i, j) == 9
                cont = cont + 1;
            end
        end
    end
    
    
    %Note: 17 is the amount of hits necesary to sink all ships
    if cont == 17
        title('Sorry, the computer beat you.')
        break;
    end
end