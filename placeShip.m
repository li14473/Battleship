function userBoard = placeShip(userBoard, length)
row = input('In which row would you like to place the ship?');
col = input('In which column would you like to place the ship?');
while (row<1 || row>10)
    row = input('In which row would you like to place the ship?');
end
while (col<1 || col>10)
    col = input('In which row would you like to place the ship?');
end
dir = input('In which direction would you like to place the ship? 1=up, 2=right, 3=down, 4=left');