Pc=imread('mrttrainbland.jpg');
whos Pc
P=rgb2gray(Pc);
whos P
imhist(P,256);
P3=histeq(P,255);
imshow(P3);
imhist(P3,256);
imhist(P3,10);
P4=histeq(P3,255);
imshow(P4);
imhist(P4,10);
imhist(P4,256);