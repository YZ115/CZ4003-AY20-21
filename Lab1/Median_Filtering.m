P=imread('ntugn.jpg');
imshow(P);

PMF1=medfilt2(P,[3 3]);
imshow(PMF1);
PMF2=medfilt2(P,[5 5]);
imshow(PMF2);

P2=imread('ntusp.jpg');
imshow(P2);

PMF3=medfilt2(P2,[3 3]);
imshow(PMF3);
PMF4=medfilt2(P2,[5 5]);
imshow(PMF4);