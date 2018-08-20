function [ss]=hist_lbp(img,m,n,s,t)%原图
img_lbp=[];

if ndims(img)==3
    img_gray=rgb2gray(img);
else
    img_gray=img;
end
    img_gray=double(img_gray);
img_gray=imresize(img_gray,[m,n],'bicubic');%大图切成100*100
img_lbp=lbp_img(img_gray);%可显示的int图片
img_lbp=double(img_lbp);

%patchsize=[s,t];%小块
fea=[];
for i=1:s:m
    for j=1:t:n
        patchsize(1:20,1:20)=img_lbp(i:i+s-1,j:j+t-1);
        %h=imhist(patchsize,255);
        patchsize=uint8(patchsize);
        h=imhist(patchsize,256);
        %new_hist(fix(i/s)+1,fix(j/t)+1)=h;
        fea=[fea;h];
    end
end
ss=fea;
        
    
