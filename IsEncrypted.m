function IsEn=IsEncrypted(imdata)
    if imdata(1)== 69 && imdata(end)== 26
        IsEn=1;
    else
        IsEn=0;
    end
end