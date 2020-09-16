pic1 = imread('combinedphoto1.tiff');
pic1 = double(pic1);


for i=1:1944
    for j=1:2592
       if pic1(i,j,1)>20 && pic1(i,j,1)/pic1(i,j,2) > 3 && pic1(i,j,1)/pic1(i,j,3) > 3
            map1(i,j)=1;
       else
           map1(i,j)=0;
    end
end
end
imwrite(map1, 'Chl.tiff');
subplot(3,2,1), imagesc(map1), title('Chl');

for i=1:1944
    for j=1:2592
       if pic1(i,j,2)>20 && pic1(i,j,1)/pic1(i,j,2) < 0.2 && pic1(i,j,2)/pic1(i,j,3) > 4
            map2(i,j)=1;
       else
           map2(i,j)=0;
    end
end
end
imwrite(map2, 'GFP.tiff');
subplot(3,2,3), imagesc(map2), title('GFP');


for i=1:1944
    for j=1:2592
        if pic1(i,j,1)>20 && pic1(i,j,3)>20 && pic1(i,j,1)/pic1(i,j,2)<10 && pic1(i,j,1)/pic1(i,j,3) <3 && pic1(i,j,2)/pic1(i,j,3) <4
            map4(i,j)=1;
       else
           map4(i,j)=0;
    end
end
end
imwrite(map4, 'RFP_Phyco.tiff');
subplot(3,2,4), imagesc(map4), title('Red Coral/CCA');

for i=1:1944
    for j=1:2592
       if (pic1(i,j,1)>20 || pic1(i,j,2)>20 || pic1(i,j,3)>20) && (map1(i,j)==0 && map2(i,j)==0 && map4(i,j)==0)
            map5(i,j)=1;
       else
           map5(i,j)=0;
    end
end
end
imwrite(map5, 'Other.tiff');
subplot(3,2,5), imagesc(map5), title('Other');
