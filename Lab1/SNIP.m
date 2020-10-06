P=imread('pckint.jpg');
imshow(P);

F=fft2(P);
S=abs(F);

imagesc(fftshift(S.^0.1));
colormap('default');

imagesc(S.^0.1);
colormap('default');

%[x,y]=ginput(2);

%disp(x);
%disp(y);

F(239:243,7:11)=0;
F(15:19,247:251)=0;

S2=abs(F);
imagesc(fftshift(S2.^0.1));
colormap('default');

S3=abs(F);
imagesc(S3.^0.1);
colormap('default');

invF=uint8(ifft2(F));
imshow(invF);


