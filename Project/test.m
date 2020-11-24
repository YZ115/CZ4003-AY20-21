Ic = imread('sample01.png');
whos I;
imshow(Ic)
I = rgb2gray(Ic);
n1 = I(:, 1 : end/3);
n2 = I(:, end/3 : (end*2)/3 );
n3 = I(:, (end*2)/3 : end );


se = strel('disk',1);
background1 = imopen(n1,se);
background2 = imopen(n2,se);
background3 = imopen(n3,se);

n1_1 = n1 + background1/1.8;
%figure,imshow(n1_1)
n2_1 = n2 + background2*1.7;
%figure,imshow(n2_1)
n3_1 = n3 + background3*3.5;
%figure,imshow(n3_1)

F = [n1_1, n2_1, n3_1];
figure,imshow(F)

imwrite(F,'processed_sample1.png')