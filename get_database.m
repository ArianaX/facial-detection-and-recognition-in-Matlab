clc
clear all;%对所有文件夹下的人脸图片（已经截好的人脸）
%每一个都进行lbp取特征h保存下来.mat

srcfolder='D:\2016.1.20实习\data\3homeworkData\5Matlabdemo\fa_face';
imglist=dir([srcfolder,'\*.jpg']);%只有文件名

imsize=[100 100];
patchsize=[20 20];

file_number=size(imglist,1);%求变量的行，有多少个文件 1列
lable=cell(file_number,1);

file_number=size(imglist,1);%求变量的行，有多少个文件 1列
    fullname=cell(file_number,1);

    img=[];
number_lable=[];
lbp_fea=[];
for i=1:file_number
    imgname=imglist(i).name;
    lable{i,1}=imgname(1:5);%取出前面五个00001
    
    fullname{i,1}=num2str([srcfolder,'\',imgname]);
    number_lable=[number_lable;str2num(imgname(1:5))];
    full=[srcfolder,'\',imgname];
    I=imread(full);
    [h,width,d]=size(I);
    
%     if(d==3)
%         I=rgb2gray(I);
%     end
%     I=double(I);
%     I=imresize(I,imsize);
%     
%     img=[img I(:)];
    
    m=imsize(1,1);
    n=imsize(1,2);
    s=patchsize(1,1);
    t=patchsize(1,2);
    lbp_hist=hist_lbp(I,m,n,s,t);
    lbp_hist=lbp_hist/(20*20);
    
    lbp_fea=[lbp_fea,lbp_hist];
    
end
save('D:\2016.1.20实习\代码\1.25\lbp_hists\lbp_fea.mat','lbp_fea','lable','number_lable','fullname');






























