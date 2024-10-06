%Returns the board of the user.  A digit 0 indicates that there is no
%ship in that position, and a digit 1-5 indicates that one of the ships is
%in that position.

% Note that the direction variable will work as follows:
% 1 means the ship goes up from its starting coordinate,
% 2 means it goes right, 3 means it goes down, 4 means it goes left.

%michael 

function userBoard = GetUserBoard()
    % Start with a blank board
    player_board = zeros(10, 10);
    %change zeros to twos (2=water)
    player_board = player_board+2;

    %establish values 
    % blank_sprite = 1;
    % water_sprite = 2;
    % left_ship_sprite = 3;
    % horiz_ship_sprite = 4;
    % right_ship_sprite = 5;
    % top_ship_sprite = 6;
    % vert_ship_sprite = 7;
    % bot_ship_sprite = 8;
    % hit_sprite = 9;
    % miss_sprite = 10;

    % Ask user where to place the ship
    first_key = input('What type of ship would you like to place? (refer to ship key)\n ', 's');

    % Handle ship placement based on user input
    if first_key == '1'
        first_ship_length = 5;
    elseif first_key == '2'
        first_ship_length = 4;
    elseif first_key == '3'
        first_ship_length = 3;
    elseif first_key == '4'
        first_ship_length = 2;
    elseif first_key == '5'
        first_ship_length = 1;
    else
        fprintf("Invalid entry, please enter 1, 2, 3, 4, or 5\n");
        userBoard = GetUserBoard(); % Ask for ship placement again
        return;
    end

    % Ask for ship coordinates and direction
    first_ship_x = input('What is the x coordinate for this ship? ');
    first_ship_y = input('What is the y coordinate for this ship? ');
    first_ship_direction = input('What direction do you want the ship to go? 1=up 2=right 3=down 4=left ');

    % Place the ship on the board
    if first_ship_direction == 1
        if first_ship_y - first_ship_length + 1 >= 1
            player_board(first_ship_y:-1:first_ship_y-first_ship_length+1, first_ship_x) = str2double(first_key);
            player_board(first_ship_y:-1:first_ship_y-first_ship_length+1, first_ship_x) = vert_ship_sprite;
            player_board(first_ship_y)= bot_ship_sprite;
            player_board(first_ship_y-first_ship_length+1)= top_ship_sprite;
            
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
        
        
    elseif first_ship_direction == 2
        if first_ship_x + first_ship_length - 1 <= 10
            player_board(first_ship_y, first_ship_x:first_ship_x+first_ship_length-1) = str2double(first_key);
            player_board(first_ship_y, first_ship_x:first_ship_x+first_ship_length-1) = horiz_ship_sprite;
            player_board(first_ship_x)= left_ship_sprite; 
            player_board(first_ship_y, first_ship_x+first_ship_length-1)= right_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    elseif first_ship_direction == 3
        if first_ship_y + first_ship_length - 1 <= 10
            player_board(first_ship_y:first_ship_y+first_ship_length-1, first_ship_x) = str2double(first_key); 
            player_board(first_ship_y:first_ship_y+first_ship_length-1, first_ship_x) = vert_ship_sprite;
            player_board(first_ship_y)= top_ship_sprite;
            player_board(first_ship_y+first_ship_length-1, first_ship_x)= bot_ship_sprite;

        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    elseif first_ship_direction == 4
        if first_ship_x - first_ship_length + 1 >= 1
            player_board(first_ship_y, first_ship_x:-1:first_ship_x-first_ship_length+1) = str2double(first_key);
            player_board(first_ship_y, first_ship_x:-1:first_ship_x-first_ship_length+1) = horiz_ship_sprite;
            player_board(first_ship_y, first_ship_x)= right_ship_sprite; 
            player_board(first_ship_y, first_ship_x-first_ship_length+1)= left_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    else
        fprintf("Invalid first_ship_direction. Try again.\n");
        userBoard = GetUserBoard();
        return;
    end

    

    userBoard = player_board




%second ship 

second_key = input('What type of ship would you like to place? (refer to ship key)\n ', 's');

    % Handle ship placement based on user input
    if second_key == '1'
        second_ship_length = 5;
    elseif second_key == '2'
        second_ship_length = 4;
    elseif second_key == '3'
        second_ship_length = 3;
    elseif second_key == '4'
        second_ship_length = 2;
    elseif second_key == '5'
        second_ship_length = 1;
    else
        fprintf("Invalid entry, please enter 1, 2, 3, 4, or 5\n");
        userBoard = GetUserBoard(); % Ask for ship placement again
        return;
    end

    % Ask for ship coordinates and direction
    second_ship_x = input('What is the x coordinate for this ship? ');
    second_ship_y = input('What is the y coordinate for this ship? ');
    second_ship_direction = input('What direction do you want the ship to go? 1=up 2=right 3=down 4=left ');

    % Place the ship on the board
    if second_ship_direction == 1
        if second_ship_y - second_ship_length + 1 >= 1
            player_board(second_ship_y:-1:second_ship_y-second_ship_length+1, second_ship_x) = str2double(second_key)
            player_board(second_ship_y:-1:second_ship_y-second_ship_length+1, second_ship_x) = vert_ship_sprite;
            player_board(second_ship_y)= bot_ship_sprite;
            player_board(second_ship_y-second_ship_length+1)= top_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    elseif second_ship_direction == 2
        if second_ship_x + second_ship_length - 1 <= 10
            player_board(second_ship_y, second_ship_x:second_ship_x+second_ship_length-1) = str2double(second_key)
            player_board(second_ship_y, second_ship_x:second_ship_x+second_ship_length-1) = horiz_ship_sprite;
            player_board(second_ship_x)= left_ship_sprite; 
            player_board(second_ship_y, second_ship_x+second_ship_length-1)= right_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    elseif second_ship_direction == 3
        if second_ship_y + second_ship_length - 1 <= 10
            player_board(second_ship_y:second_ship_y+second_ship_length-1, second_ship_x) = str2double(second_key);
            player_board(second_ship_y:second_ship_y+second_ship_length-1, second_ship_x) = vert_ship_sprite;
            player_board(second_ship_y)= top_ship_sprite;
            player_board(second_ship_y+second_ship_length-1, second_ship_x)= bot_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    elseif second_ship_direction == 4
        if second_ship_x - second_ship_length + 1 >= 1
            player_board(second_ship_y, second_ship_x:-1:second_ship_x-second_ship_length+1) = str2double(second_key);
            player_board(second_ship_y, second_ship_x:-1:second_ship_x-second_ship_length+1) = horiz_ship_sprite;
            player_board(second_ship_y, second_ship_x)= right_ship_sprite; 
            player_board(second_ship_y, second_ship_x-second_ship_length+1)= left_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    else
        fprintf("Invalid second_ship_direction. Try again.\n");
        userBoard = GetUserBoard();
        return;
    end

    userBoard = player_board;

    %third ship
   
    % Ask user where to place the ship
    third_key = input('What type of ship would you like to place? (refer to ship key)\n ', 's');

    % Handle ship placement based on user input
    if third_key == '1'
        third_ship_length = 5;
    elseif third_key == '2'
        third_ship_length = 4;
    elseif third_key == '3'
        third_ship_length = 3;
    elseif third_key == '4'
        third_ship_length = 2;
    elseif third_key == '5'
        third_ship_length = 1;
    else
        fprintf("Invalid entry, please enter 1, 2, 3, 4, or 5\n");
        userBoard = GetUserBoard(); % Ask for ship placement again
        return;
    end

    % Ask for ship coordinates and direction
    third_ship_x = input('What is the x coordinate for this ship? ');
    third_ship_y = input('What is the y coordinate for this ship? ');
    third_ship_direction = input('What direction do you want the ship to go? 1=up 2=right 3=down 4=left ');

    % Place the ship on the board
    if third_ship_direction == 1
        if third_ship_y - third_ship_length + 1 >= 1
            player_board(third_ship_y:-1:third_ship_y-third_ship_length+1, third_ship_x) = str2double(third_key);
            player_board(third_ship_y:-1:third_ship_y-third_ship_length+1, third_ship_x) = vert_ship_sprite;
            player_board(third_ship_y)= bot_ship_sprite;
            player_board(third_ship_y-third_ship_length+1)= top_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    elseif third_ship_direction == 2
        if third_ship_x + third_ship_length - 1 <= 10
            player_board(third_ship_y, third_ship_x:third_ship_x+third_ship_length-1) = str2double(third_key); 
            player_board(third_ship_y, third_ship_x:third_ship_x+third_ship_length-1) = horiz_ship_sprite;
            player_board(third_ship_x)= left_ship_sprite; 
            player_board(third_ship_y, third_ship_x+third_ship_length-1)= right_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    elseif third_ship_direction == 3
        if third_ship_y + third_ship_length - 1 <= 10
            player_board(third_ship_y:third_ship_y+third_ship_length-1, third_ship_x) = str2double(third_key);
            player_board(third_ship_y:third_ship_y+third_ship_length-1, third_ship_x) = vert_ship_sprite;
            player_board(third_ship_y)= top_ship_sprite;
            player_board(third_ship_y+third_ship_length-1, third_ship_x)= bot_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    elseif third_ship_direction == 4
        if third_ship_x - third_ship_length + 1 >= 1
            player_board(third_ship_y, third_ship_x:-1:third_ship_x-third_ship_length+1) = str2double(third_key); 
            player_board(third_ship_y, third_ship_x:-1:third_ship_x-third_ship_length+1) = horiz_ship_sprite;
            player_board(third_ship_y, third_ship_x)= right_ship_sprite; 
            player_board(third_ship_y, third_ship_x-third_ship_length+1)= left_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    else
        fprintf("Invalid third_ship_direction. Try again.\n");
        userBoard = GetUserBoard();
        return;
    end

    userBoard = player_board


%fourth ship 

fourth_key = input('What type of ship would you like to place? (refer to ship key)\n ', 's');

    % Handle ship placement based on user input
    if fourth_key == '1'
        fourth_ship_length = 5;
    elseif fourth_key == '2'
        fourth_ship_length = 4;
    elseif fourth_key == '3'
        fourth_ship_length = 3;
    elseif fourth_key == '4'
        fourth_ship_length = 2;
    elseif fourth_key == '5'
        fourth_ship_length = 1;
    else
        fprintf("Invalid entry, please enter 1, 2, 3, 4, or 5\n");
        userBoard = GetUserBoard(); % Ask for ship placement again
        return;
    end

    % Ask for ship coordinates and direction
    fourth_ship_x = input('What is the x coordinate for this ship? ');
    fourth_ship_y = input('What is the y coordinate for this ship? ');
    fourth_ship_direction = input('What direction do you want the ship to go? 1=up 2=right 3=down 4=left ');

    % Place the ship on the board
    if fourth_ship_direction == 1
        if fourth_ship_y - fourth_ship_length + 1 >= 1
            player_board(fourth_ship_y:-1:fourth_ship_y-fourth_ship_length+1, fourth_ship_x) = str2double(fourth_key);
            player_board(fourth_ship_y:-1:fourth_ship_y-fourth_ship_length+1, fourth_ship_x) = vert_ship_sprite;
            player_board(fourth_ship_y)= bot_ship_sprite;
            player_board(fourth_ship_y-fourth_ship_length+1)= top_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    elseif fourth_ship_direction == 2
        if fourth_ship_x + fourth_ship_length - 1 <= 10
            player_board(fourth_ship_y, fourth_ship_x:fourth_ship_x+fourth_ship_length-1) = str2double(fourth_key);
            player_board(fourth_ship_y, fourth_ship_x:fourth_ship_x+fourth_ship_length-1) = horiz_ship_sprite;
            player_board(fourth_ship_x)= left_ship_sprite; 
            player_board(fourth_ship_y, fourth_ship_x+fourth_ship_length-1)= right_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    elseif fourth_ship_direction == 3
        if fourth_ship_y + fourth_ship_length - 1 <= 10
            player_board(fourth_ship_y:fourth_ship_y+fourth_ship_length-1, fourth_ship_x) = str2double(fourth_key);
            player_board(fourth_ship_y:fourth_ship_y+fourth_ship_length-1, fourth_ship_x) = vert_ship_sprite;
            player_board(fourth_ship_y)= top_ship_sprite;
            player_board(fourth_ship_y+fourth_ship_length-1, fourth_ship_x)= bot_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    elseif fourth_ship_direction == 4
        if fourth_ship_x - fourth_ship_length + 1 >= 1
            player_board(fourth_ship_y, fourth_ship_x:-1:fourth_ship_x-fourth_ship_length+1) = str2double(fourth_key);
            player_board(fourth_ship_y, fourth_ship_x:-1:fourth_ship_x-fourth_ship_length+1) = horiz_ship_sprite;
            player_board(fourth_ship_y, fourth_ship_x)= right_ship_sprite; 
            player_board(fourth_ship_y, fourth_ship_x-fourth_ship_length+1)= left_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    else
        fprintf("Invalid fourth_ship_direction. Try again.\n");
        userBoard = GetUserBoard();
        return;
    end

    userBoard = player_board 

  %fifth ship 

fifth_key = input('What type of ship would you like to place? (refer to ship key)\n ', 's');

    % Handle ship placement based on user input
    if fifth_key == '1'
        fifth_ship_length = 5;
    elseif fifth_key == '2'
        fifth_ship_length = 4;
    elseif fifth_key == '3'
        fifth_ship_length = 3;
    elseif fifth_key == '4'
        fifth_ship_length = 2;
    elseif fifth_key == '5'
        fifth_ship_length = 1;
    else
        fprintf("Invalid entry, please enter 1, 2, 3, 4, or 5\n");
        userBoard = GetUserBoard(); % Ask for ship placement again
        return;
    end

    % Ask for ship coordinates and direction
    fifth_ship_x = input('What is the x coordinate for this ship? ');
    fifth_ship_y = input('What is the y coordinate for this ship? ');
    fifth_ship_direction = input('What direction do you want the ship to go? 1=up 2=right 3=down 4=left ');

    % Place the ship on the board
    if fifth_ship_direction == 1
        if fifth_ship_y - fifth_ship_length + 1 >= 1
            player_board(fifth_ship_y:-1:fifth_ship_y-fifth_ship_length+1, fifth_ship_x) = str2double(fifth_key);
            player_board(fifth_ship_y:-1:fifth_ship_y-fifth_ship_length+1, fifth_ship_x) = vert_ship_sprite;
            player_board(fifth_ship_y)= bot_ship_sprite;
            player_board(fifth_ship_y-fifth_ship_length+1)= top_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    elseif fifth_ship_direction == 2
        if fifth_ship_x + fifth_ship_length - 1 <= 10
            player_board(fifth_ship_y, fifth_ship_x:fifth_ship_x+fifth_ship_length-1) = str2double(fifth_key);
            player_board(fifth_ship_y, fifth_ship_x:fifth_ship_x+fifth_ship_length-1) = horiz_ship_sprite;
            player_board(fifth_ship_x)= left_ship_sprite; 
            player_board(fifth_ship_y, fifth_ship_x+fifth_ship_length-1)= right_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    elseif fifth_ship_direction == 3
        if fifth_ship_y + fifth_ship_length - 1 <= 10
            player_board(fifth_ship_y:fifth_ship_y+fifth_ship_length-1, fifth_ship_x) = str2double(fifth_key);
            player_board(fifth_ship_y:fifth_ship_y+fifth_ship_length-1, fifth_ship_x) = vert_ship_sprite;
            player_board(fifth_ship_y)= top_ship_sprite;
            player_board(fifth_ship_y+fifth_ship_length-1, fifth_ship_x)= bot_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    elseif fifth_ship_direction == 4
        if fifth_ship_x - fifth_ship_length + 1 >= 1
            player_board(fifth_ship_y, fifth_ship_x:-1:fifth_ship_x-fifth_ship_length+1) = str2double(fifth_key);
            player_board(fifth_ship_y, fifth_ship_x:-1:fifth_ship_x-fifth_ship_length+1) = horiz_ship_sprite;
            player_board(fifth_ship_y, fifth_ship_x)= right_ship_sprite; 
            player_board(fifth_ship_y, fifth_ship_x-fifth_ship_length+1)= left_ship_sprite;
        else
            fprintf("Invalid ship placement. Try again.\n");
            userBoard = GetUserBoard();
            return;
        end
    else
        fprintf("Invalid fifth_ship_direction. Try again.\n");
        userBoard = GetUserBoard();
        return;
    end
     userBoard = player_board;
en