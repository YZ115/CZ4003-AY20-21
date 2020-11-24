% a)
P=imread('maccropped.jpg');
Picture = rgb2gray(P);
%imshow(Picture);

% b)
sobel_mask_h = [
    -1 0 1;
    -2 0 2;
    -1 0 1];
sobel_mask_v = [
    1 2 1;
    0 0 0;
    -1 -2 -1;];
pic_v = conv2(Picture, sobel_mask_h);
%figure, imshow(uint8(pic_v))
pic_h = conv2(Picture, sobel_mask_v);
%figure, imshow(uint8(pic_h)) 

% c
E = pic_v.^2 + pic_h.^2;
%figure, imshow(uint8(sqrt(E)))
%imshow((E),[])

% d)
t = [10,10000,20000,40000,80000];
Et = E>t(1);
%figure, imshow(Et)
Et = E>t(2);
%figure, imshow(Et)
Et = E>t(3);
%figure, imshow(Et)
Et = E>t(4);
%figure, imshow(Et)
Et = E>t(5);
%figure, imshow(Et)

% e)
tl = 0.04;
th = 0.1;
sigma = 1.0;
E = edge(Picture,'canny',[tl th],sigma); 
%imshow(E);

% e i)
sigma_l = [1.0, 2.0, 3.0, 4.0, 5.0];
E_canny = edge(Picture,'canny',[tl th],sigma_l(1)); 
%figure, imshow(E_canny)
E_canny = edge(Picture,'canny',[tl th],sigma_l(2)); 
%figure, imshow(E_canny)
E_canny = edge(Picture,'canny',[tl th],sigma_l(3)); 
%figure, imshow(E_canny)
E_canny = edge(Picture,'canny',[tl th],sigma_l(4)); 
%figure, imshow(E_canny)
E_canny = edge(Picture,'canny',[tl th],sigma_l(5)); 
%figure, imshow(E_canny)

% e ii)
tl_l = [0, 0.02, 0.04, 0.06, 0.08];
E_canny = edge(Picture,'canny',[tl_l(1) th],sigma); 
figure, imshow(E_canny)
E_canny = edge(Picture,'canny',[tl_l(2) th],sigma); 
figure, imshow(E_canny)
E_canny = edge(Picture,'canny',[tl_l(3) th],sigma); 
figure, imshow(E_canny)
E_canny = edge(Picture,'canny',[tl_l(4) th],sigma); 
figure, imshow(E_canny)
E_canny = edge(Picture,'canny',[tl_l(5) th],sigma); 
figure, imshow(E_canny)
