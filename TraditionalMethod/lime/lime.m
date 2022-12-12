% ���ģ� LIME: A Method for Low-light Image Enhancement
% ���ߣ�Xiaojie Guo
% ���ӣ�
% Author: HSW
% Date: 2018-04-27

clc;
close all;
clear;

addpath(genpath('removeHaze\')); 
addpath(genpath('BM3D\')); 

% img = imread('timg1.png');
% img = imread('timg2.png');
 img = imread('123.png');
% img = imread('timg4.png');
figure;
imshow(img, []);
title('ԭͼ��');
Model = 'Normal'; % 'Dehaze' / 'Normal'
method = 'SA'; 
denoiseFlag = 1;  % = 0ʱ��ʾ�������������� = 1ʱ��ʾ������������
if size(img, 3) == 3
    img_in = im2double(img); 
    img_out = Lime_enhance(img_in, Model, method, 0, 0);     
    figure;
    imshow(img_out, []);
    title(['��ǿ���(', 'Model:', Model, ' | Smooth Method:', method, ')']);
    imwrite(img_out,"C:\code2\LIME\lime\321.png")
else
    disp('LIMEģ�ʹ����ɫͼ��');
end

