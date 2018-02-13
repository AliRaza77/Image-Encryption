%% Load Module
function decryptmain(seedP)
[F,P] = uigetfile('*.png','Select the JPG image file');
FullPath=[P,F];
encimage=imread(FullPath);
[r,c,s]=size(encimage);
%% EN'3
for ss= [10:-1:1]
rng(62+ss)
de3=uint8(randi([-255 255],r,c,s));
encimage= bitxor(encimage, de3);
end
%% EN'2
rng(62+seedP)
de2=uint8(randi([-255 255],r,c,s));
encimage= bitxor(encimage, de2);
%% EN'1
rng(seedP)
de1=uint8(randi([-255 255],r,c,s));
imdata = bitxor(encimage, de1);
figure, imshow(imdata)
imwrite(imdata,'decrypted.png')
end