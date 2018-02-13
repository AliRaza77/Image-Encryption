function Key = encryptmain()
%% Load Module
[F,P] = uigetfile('*.png','Select the JPG image file');
FullPath=[P,F];
imdata=imread(FullPath);
%% Encrypt Module
%% EN 1
d=datetime('today');
d=datenum(d);
d=datestr(d);
seed1=str2num(d(1:2));
seedP=abs((seed1^2+seed1-seed1^3+2*seed1^4-seed1^5));
rng(seedP,'twister');
[r,c,s]=size(imdata);
en1=uint8(randi([-255 255],r,c,s));
encimage = bitxor(imdata, en1);
%% EN 2
rng(62+seedP)
en2=uint8(randi([-255 255],r,c,s));
encimage= bitxor(encimage, en2);
%% EN 3
for ss= 1:1:10
rng(62+ss)
en3=uint8(randi([-255 255],r,c,s));
encimage= bitxor(encimage, en3);
end
%% KeyGen
Key = seedP
imwrite(encimage,'encrypted.png')
figure ,imshow(encimage)
end