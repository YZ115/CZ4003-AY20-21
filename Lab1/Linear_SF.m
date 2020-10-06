kernel1=fspecial('gaussian',[5 5],1);
kernel2=fspecial('gaussian',[5 5],2);
figure()
mesh(kernel1);
figure()
mesh(kernel2);

P=imread('ntugn.jpg');
imshow(P);

PSF1=uint8(conv2(P,kernel1));
imshow(PSF1);
PSF2=uint8(conv2(P,kernel2));
imshow(PSF2);

P2=imread('ntusp.jpg');
imshow(P2);
PSF3=uint8(conv2(P2,kernel1));
imshow(PSF3);
PSF4=uint8(conv2(P2,kernel2));
imshow(PSF4);