function [ coords,D ] = prepareDataSet( choice )
%this function will prepare the experiment dataset
%choice==1-fifteen cities
%choice==2-fifty seven cities

    if choice==1
        load fifteenCityDistMat
        Y = cmdscale(fifteenCityDistMat);
        coords=Y(:,1:2);
        scatter(coords(:,1),coords(:,2));
        D=fifteenCityDistMat;
    else
        load fifySevenCityDistMat
        Y = cmdscale(fiftySevenCityDistMat);
        coords=Y(:,1:2);
        scatter(coords(:,1),coords(:,2));
        D=fifySevenCityDistMat;
    end
end

