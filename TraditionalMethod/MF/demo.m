clc;close all;clear all;addpath(genpath('./'));
%gt_path = 'E:\work\Test2\testA-20210422T131743Z-001\testA\data\DICM\';
gt_path = 'C:\code2\MF\';

gt_list = dir(strcat(gt_path,'*.png'));
img_num = length(gt_list);
if img_num > 0 
   for j = 1:img_num 
       
       gt_name = gt_list(j).name;
       gt = imread(strcat(gt_path, gt_name));
       pic=multi_fusion(gt);
       imwrite(pic,['C:\code2\MF\ce1\',num2str(gt_name)]);
    
   end
end