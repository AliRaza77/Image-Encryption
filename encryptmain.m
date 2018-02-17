function Key = encryptmain()
    %% Load Module
    [F,P] = uigetfile('*.png','Select the JPG image file');
    FullPath=[P,F];
    imdata=imread(FullPath);
    %% Encrypt Module
    IsEn=IsEncrypted(imdata);
    if IsEn == 1
        msgbox('Error. The image has already been encrypted.','Error','error')
    elseif IsEn == 0 
        %% EN 1
        d=datetime('today');
        d=datenum(d);
        d=datestr(d);
        t=num2str(now);
        t=str2num(t(end-1:end));
        seed1=str2num(d(1:2))+t;
        seedP=abs((seed1^2+seed1-seed1^3+10*seed1^4-seed1^5));
        seedP=num2str(seedP);
        seedP=seedP(1:3);
        seedP=str2num(seedP);
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
        %% IsEncrypted
        IsE=[encimage(1),numel(num2str(encimage(1))),encimage(end),numel(num2str(encimage(end)))];
        IsEC=num2str(IsE);
        IsEC=IsEC(find(~isspace(IsEC)));
        encimage(1)=69; encimage(end)=26;
        SK=[num2str(seedP),IsEC];
        SK=SK(find(~isspace(SK)));
        format long g
        %% Image Tagger
        Tag=encimage(floor(end/2))
        Tag=num2str(Tag);
        Tag=[Tag,num2str(numel(Tag))]
        SK=[SK(1:3),Tag,SK(4:end)]
        SK=str2num(SK);
        %% KeyGen
        Key = SK;
        imwrite(encimage,'encrypted.png')
        figure ,imshow(encimage)
        clipboard('copy',Key);
    end
end