% a)
% Please see map.m file

% b)
left = imread('corridorl.jpg');
left = rgb2gray(left);
%figure,imshow(left);
right = imread('corridorr.jpg');
right = rgb2gray(right);
%figure,imshow(right);

% c)
D = map(left,right,11,11);
%figure,imshow(-D,[-15,15])
disp = imread('corridor_disp.jpg');
%figure, imshow(disp);

% d)
left_i = imread('triclopsi2l.jpg');
left_img = rgb2gray(left_i);
%figure,imshow(left_img);
right_i = imread('triclopsi2r.jpg');
right_img = rgb2gray(right_i);
%figure,imshow(right_img);
D_triclops = map(left_img,right_img,11,11);
figure,imshow(-D_triclops,[-15 15]);
disp_img = imread('triclopsid.jpg');
figure,imshow(disp_img);