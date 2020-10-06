book=imread('book.jpg');
whos book
imshow(book);
Book=rgb2gray(book);
imshow(Book);

[X,Y]=ginput(4);
disp(X);
disp(Y);

%A4 paper dimensions (210*297mm)
x_final=[0,210,210,0];
y_final=[0,0,297,297];

v=[x_final(1);
    y_final(1);
    x_final(2);
    y_final(2);
    x_final(3);
    y_final(3);
    x_final(4);
    y_final(4);];

A=[X(1),Y(1),1,0,0,0,-x_final(1)*X(1),-x_final(1)*Y(1);
    0,0,0,X(1),Y(1),1,-y_final(1)*X(1),-y_final(1)*Y(1);
    X(2),Y(2),1,0,0,0,-x_final(2)*X(2),-x_final(2)*Y(2);
    0,0,0,X(2),Y(2),1,-y_final(2)*X(2),-y_final(2)*Y(2);
    X(3),Y(3),1,0,0,0,-x_final(3)*X(3),-x_final(3)*Y(3);
    0,0,0,X(3),Y(3),1,-y_final(3)*X(3),-y_final(3)*Y(3);
    X(4),Y(4),1,0,0,0,-x_final(4)*X(4),-x_final(4)*Y(4);
    0,0,0,X(4),Y(4),1,-y_final(4)*X(4),-y_final(4)*Y(4)];
u=A\v;

U=reshape([u;1],3,3)';
disp(U);
w=U*[X';Y';ones(1,4)];
w=w./(ones(3,1)*w(3,:))

T=maketform('projective',U');
Book2=imtransform(Book,T,'XData',[0 210],'YData',[0 297]);
imshow(Book2);