function  imdata=decryptImage(decimage)
[r,c,s]=size(decimage);
seedP=80890
%% EN'3
for ss= [10:-1:1]
rng(62+ss)
de3=uint8(randi([-255 255],r,c,s));
decimage= bitxor(decimage, de3);
end
%% EN'2
rng(62+seedP)
de2=uint8(randi([-255 255],r,c,s));
decimage= bitxor(decimage, de2);
%% EN'1
rng(seedP,'twister');
de1=uint8(randi([-255 255],r,c,s));
imdata = bitxor(decimage, de1);
end