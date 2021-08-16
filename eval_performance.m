clear;clc;close all;
format compact

vid='v009'; %Model version
for i1=1:6  % There are 6 validation 512x512 patch-images

 fileNameGT=strcat(num2str(i1-1),'_gt.png');
 fileNamePredict=strcat(num2str(i1-1),'_predict_',vid,'.png');

[acc(i1),cellAcc(i1),cultAcc(i1),conf,iou_cel(i1),iou_cul(i1)]=metrics(fileNameGT,fileNamePredict);
conf_test(:,:,i1)=conf;
[dsc(i1), dc_cel(i1), dc_cul(i1)]=dice_score(fileNameGT,fileNamePredict);
end

mAcc=mean(acc);
mcellAcc=mean(cellAcc);
mcultAcc=mean(cultAcc);

mConf=mean(conf_test,3)

mDc=mean(dsc);
mDcCult=mean(dc_cul);
mDcCell=mean(dc_cel);

mIoUCell=mean(iou_cel);
mIoUCult=mean(iou_cul);

[mAcc mcellAcc mcultAcc mDc mDcCell mDcCult mIoUCell mIoUCult]

[mDcCell mAcc]
%cellMetrics
%cultMetrics

%save results with vid
%save(strcat('results',vid));
