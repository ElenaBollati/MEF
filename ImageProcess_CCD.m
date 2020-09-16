pic1 = imread('Blue.excitation.image1.tif');
pic_r = pic1(:,:,1);
pic_g = pic1(:,:,2);
pic_g = pic_g-67;
pic_g(pic_g<0)=0;

pic2 = imread('Green.excitation.image1.tif');

pic_r = double(pic_r);
pic_g = double(pic_g);
pic_b = pic2(:,:,1);
pic_b = pic_b-36;
pic_b(pic_b<0)=0;
pic_b = double(pic_b);


pic_new = pic_r;
pic_new(:,:,2) = pic_g;
pic_new(:,:,3) = pic_b;
pic_new = uint8(pic_new);


% imwrite(pic_new, 'combinedphoto1.tiff')