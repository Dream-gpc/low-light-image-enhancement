clc;close all;clear all;addpath(genpath('./'));
load modelparameters.mat
 blocksizerow    = 96;
 blocksizecol    = 96;
 blockrowoverlap = 0;
 blockcoloverlap = 0;
file_path = 'E:\work\传统方法\MF\LOL\';
%file_path = 'E:\work\deeplearning\KinD-master\results\LOLdataset_eval15\';
%file_path = 'E:\work\deeplearning\MIRNet-master\MIRNet-master\results\enhancement\lol\';
%gt_path = 'E:\work\Test2\testA-20210422T131743Z-001\testA\data\DICM\';
gt_path = 'E:\work\deeplearning\LPNet\lol\';
path_list = dir(strcat(file_path,'*.png'));
gt_list = dir(strcat(gt_path,'*.png'));
img_num = length(path_list);
%calculate psnr
total_psnr = 0;
total_ssim = 0;
total_niqe=0;
a1=char('.png');
a2 =char('_kindle.png');

if img_num > 0 
   for j = 1:img_num 
       

       gt_name = gt_list(j).name;
       A1 = gt_name(1:end-4);
       image_name = [A1,a1];
       gt = imread(strcat(gt_path, gt_name));
       input = imread(strcat(file_path,gt_name));
       
       
       %PSNR=psnr_rgb(input,gt);
       PSNR= psnr(input,gt);
       SSIM= ssim(input,gt);
       NIQE= niqe(input);
       %NIQE= computequality(input,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap, ...
    %mu_prisparam,cov_prisparam);
       total_psnr = total_psnr + PSNR;
       total_ssim = total_ssim + SSIM;
       total_niqe = total_niqe +NIQE;
       fprintf('%d %f %f %f %s\n',j,PSNR,SSIM,NIQE,strcat(file_path,image_name));
   end
end
qm_psnr = total_psnr / img_num;
qm_ssim = total_ssim / img_num;
qm_niqe = total_niqe/img_num;
fprintf('The avgerage psnr is: %f\n', qm_psnr);
fprintf('The avgerage ssim is: %f\n', qm_ssim);
fprintf('The avgerage niqe is: %f', qm_niqe);