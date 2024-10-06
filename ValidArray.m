function valid = ValidArray(positions)
    valid = 1;
    arrSize = size(positions);
    for i=1:arrSize(1)
        for j=1:arrSize(2)
            if positions(i, j) > 10 || positions(i, j) < 1
                valid = 0;
            end
        end
    end
end
