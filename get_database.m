clc
clear all;%�������ļ����µ�����ͼƬ���Ѿ��غõ�������
%ÿһ��������lbpȡ����h��������.mat

srcfolder='D:\2016.1.20ʵϰ\data\3homeworkData\5Matlabdemo\fa_face';
imglist=dir([srcfolder,'\*.jpg']);%ֻ���ļ���

imsize=[100 100];
patchsize=[20 20];

file_number=size(imglist,1);%��������У��ж��ٸ��ļ� 1��
lable=cell(file_number,1);

file_number=size(imglist,1);%��������У��ж��ٸ��ļ� 1��
    fullname=cell(file_number,1);

    img=[];
number_lable=[];
lbp_fea=[];
for i=1:file_number
    imgname=imglist(i).name;
    lable{i,1}=imgname(1:5);%ȡ��ǰ�����00001
    
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
save('D:\2016.1.20ʵϰ\����\1.25\lbp_hists\lbp_fea.mat','lbp_fea','lable','number_lable','fullname');






























