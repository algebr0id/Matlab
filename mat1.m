clc; close all; clear all;
%--------------------------------------------------------------------------
%NOTE: all necessary plot commands have been commented out
%--------------------------------------------------------------------------
%run('create_mat_file.m'); %run the file containing faces
load('image_data.mat'); 

%(1)

v = A(:,1); %first column of A
%imshow(uint8(reshape(v,200,175))); %first column is a stallone face
A1 = v;
save('A1.dat','A1','-ascii');

%(2)
%compute means
r = zeros(35000,1); %vector containing each mean
for j = 1:35000
    r(j) = sum(A(j,:))/length(A(j,:));
end
r;

A0 = zeros(35000,40); 
for j = 1:35000
    A0(j,:) = (A(j,:)-r(j)); %subtract mean of each row of A from the row of A
end
A0;

%find the singular value decomp of A0

[U,S,V] = svd(A0,'econ');

%look at sing. values

C = diag(S);
 
A2 = C;

save('A2.dat','A2','-ascii');

%(3)
%want first three columns of U -- principle directions
 
R = U(:,1:3);

A3 = R;

save('A3.dat','A3','-ascii');

% %(4)
% %re-index data in terms of coordinates in R

P = ctranspose(R)*A;

x = P(1,:);
y = P(2,:);
z = P(3,:);

x0 = x(1:20);
y0 = y(1:20);
z0 = z(1:20);

x1 = x(21:40);
y1 = y(21:40);
z1 = z(21:40);

A4 = x;

save('A4.dat','A4','-ascii');

%plot against each other; stallone is blue and swift is red

%plot3(x0,y0,z0,'bo',x1,y1,z1,'ro');

%(5)
w = ctranspose(R)*u;
w1 = w(1);
w2 = w(2);
w3 = w(3);
%plot3(x0,y0,z0,'bo',x1,y1,z1,'ro',w1,w2,w3,'gs'); %green square (w) appears in stallone (blue)

A5 = w;

save('A5.dat','A5','-ascii');






