%% Load Module
function decryptmain(seedP)
    [F,P] = uigetfile('*.png','Select the JPG image file');
    FullPath=[P,F];
    encimage=imread(FullPath);
    [r,c,s]=size(encimage);
    %% IsEn Check
    IsEn= IsEncrypted(encimage);
    if IsEn == 1
        
    elseif IsEn == 0
        msgbox('Error. The image has not been encrypted.','Error','error')
        return
    end

    %% Decrypt Module
    SK=seedP;
    SK=num2str(seedP);
    seedP=str2num(SK(1:3));
    n2=str2num(SK(end)); n1=str2num(SK(end-n2-1)); n3=str2num(SK(end-n2-n1-2));
    enc2=str2num(SK(end-n2:end-1)); enc1=str2num(SK(end-n2-n1-1:end-n2-2));
    encimage(1)=enc1; encimage(end)=enc2;
    %% Image Verification
    if encimage(floor(end/2)) == str2num(SK(end-n2-n1-n3-2:end-n2-n1-n3))
        
    else
        msgbox('Error. The key for your image is incorrect.','Error','error')
        return
    end
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