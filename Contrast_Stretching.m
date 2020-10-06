Pc=imread('mrttrainbland.jpg');
whos Pc
P=rgb2gray(Pc);
whos P
min(P(:)), max(P(:))
P_sub=imsubtract(P,13);
P2=immultiply(P_sub,255/191);
min(P2(:)), max(P2(:))
imshow(P2);