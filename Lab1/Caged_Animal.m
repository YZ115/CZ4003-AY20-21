Primate=imread('primatecaged.jpg');
whos Primate
imshow(Primate);

PrimateGray=rgb2gray(Primate);
imshow(PrimateGray);

F_Primate=fft2(PrimateGray);
S_Primate=abs(F_Primate);
imagesc(fftshift(S_Primate.^0.1));
colormap('default');

imagesc(S_Primate.^0.1);
colormap('default');

%[x,y]=ginput(8);

%disp(x);
%disp(y);

F_Primate(251:255,9:13)=0;
F_Primate(3:7,245:249)=0;
F_Primate(8:12,235:239)=0;
F_Primate(245:249,20:24)=0;
F_Primate(241:245,8:12)=0;
F_Primate(235:239,18:22)=0;
F_Primate(14:18,245:249)=0;
F_Primate(19:23,237:242)=0;

S2_Primate=abs(F_Primate);
imagesc(fftshift(S2_Primate.^0.1));
colormap('default');

imagesc(S2_Primate.^0.1);
colormap('default');

invF_Primate=uint8(real(ifft2(F_Primate)));
imshow(invF_Primate);

