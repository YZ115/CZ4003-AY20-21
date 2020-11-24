% a)
P=imread('maccropped.jpg');
Picture = rgb2gray(P);

tl = 0.04; 
th = 0.1; 
sigma = 5.0;
E = edge(Picture,'canny',[tl th],sigma);
%figure,imshow(E);

% b)
[H, xp] = radon(E); 
class(H)
% Convert H from type 'double' to 'uint8' to display
imshow(uint8(H))

% c)
imagesc(uint8(H));
colormap('default');

% Finding maximum pixel intensity
maxValue = max(H(:));
[radius, theta] = find(H == maxValue);
disp(theta)
disp(radius)

% d)
radius = xp(radius);
[A, B] = pol2cart(theta*pi/180, radius); % Convert angle to radians
B = -B;

% General equation of converting polar to cartesian: x = r*cos(theta), y =
% r*sin(theta), where x*cos(theta) + y*sin(theta) = r

% Thus, A = radius * cos(theta*pi/180);
% B = radius * sin(theta*pi/180);
% x*r*cos(theta*pi/180) + y*r*sin(theta*pi/180) = radius.^2

% Finally, A*x + B*y = radius.^2;

% We need to shift back to the original origin (top-left corner of image)

% Dimensions image : 358 x 290, therefore the center of the image is at :
% 179 x 145

% Finally, A*(x-179) + B*(y-145) = radius.^2;
% Which simplifies to : A*x + B*y = radius.^2 + 179*A + 145*B;
% C = radius.^2 + 179*A + 145*B;
% The final equation for C is shown below:

C = A*(A+179)+B*(B+145);

% e)
xl = 0;
% width of image is: 358 pixels
xr = 357;
yl = (C-A*xl)/B;
yr = (C-A*xr)/B;

% f)
figure, imshow(Picture)
line([xl xr], [yl yr])