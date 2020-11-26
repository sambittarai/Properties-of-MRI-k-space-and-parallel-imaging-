%%
clear all
close all
clc

%%
%MRI Image
mri = imread('mri.png');
%a = mri(2:257,2:257);
%a = im2double(a); %Converting uint8 to double
%imshow(mri);

%Phantom Image
P = phantom('Modified Shepp-Logan',256);

%%
%Example k-space
[Mn, params, M0, Kn, K0] = phantom_parallel(0,2,100,0.1,0);
%imshow(K0(:,:,2))

%%  Task 1

%display k-space of coil 1
imagesc(abs(squeeze(K0(:,:,1))));
colormap gray;

%display k-space of coil 2
imagesc(abs(squeeze(K0(:,:,2))));
colormap gray;

%display of image from k-space of coil 1
coil1 = abs(k2x(squeeze(Kn(:,:,1)), 1));
imagesc(coil1);
colormap gray;

%display of image from k-space of coil 1
coil2 = abs(k2x(squeeze(Kn(:,:,2)), 1));
imagesc(coil2);
colormap gray;

%Include the following in your assignment report: (.) the resulting images and (.) describe the results

%% Task 2
%Here we are combining the data acquired by the coil-1 and coil-2 to get
%the final image using sos function
[i1] = k2x(Kn, 1);
[Im] = sos(i1);
imagesc(Im);
colormap gray;

% Include the following in your assignment report: (.) the resulting images and (.) describe the results

% What is different compared to the images from Task 1?
%In Task 1 we aquired 2 images of the same anatomy using 2 different coils.
%The part of the anatomy which is closed to coil 1 generated maximum data
%for that anatomy and less data for the anatomy far from it. Similar thing
%happens for coil 2. 
%But in Task 2 we combine those 2 images to get the final image of the
%anatomy, which contains the complete information.

%% Task 3
% a) 
Kn_new = K0;

%Replacing most of the central half with zeros
%Kn_new(64:192,64:192,:) = 0;
%Kn_new(110:140,110:140,:) = 0;
Kn_new(120:130,120:130,:) = 0;
[i1] = k2x(Kn_new, 1);
[Im] = sos(i1);
%Im = fft2(Kn_new);
%[Im] = sos(Im);
imagesc(Im);
colormap gray;

%% b)
Kn_new = zeros(128,128,2);
Kn_new = K0(92:220,92:220,:);
%Kn_new(1:128,1:128,:) = K0(64:191, 64:191,:);
%Im=ifft2(fftshift(fftshift(Kn_new,1),2));
%Im=sqrt(sum((abs(Im).^2),3));
[i1] = k2x(Kn_new, 1);
[Im] = sos(i1);
imagesc(Im);
colormap gray;

%% Task 4
% a)Removing top/bottom half of k-space
Kn_new = zeros(128,128,2);
Kn_new = K0(129:256,129:256,:);
%Kn_new = K0(1:128,1:128,:);
[i1] = k2x(Kn_new, 1);
[Im] = sos(i1);
imagesc(Im);
colormap gray;

%% c)
Kn_new = zeros(128,256,2);
for i=1:128
    for j=1:256
        Kn_new(i,j,:) = K0(2*i-1,j, :);
    end
end
[i1] = k2x(Kn_new, 1);
[Im] = sos(i1);
imagesc(Im);
colormap gray;


%% b)
Kn_new = zeros(256,128,2);
for i=1:256
    for j=1:128
        Kn_new(i,j,:) = K0(i,2*j-1,:);
    end
end
[i1] = k2x(Kn_new, 1);
[Im] = sos(i1);
imagesc(Im);
colormap gray;

%% Task 5
img = ifft2(K0);
imagesc(abs(img(:,:,2)));
colormap gray;


%Combine the images
img_combined = mean(img, 3);
imagesc(abs(img_combined));
colormap gray;

%
img_combined = sqrt(sum(abs(img).^2,3));
imagesc(img_combined);
colormap gray;

% C = S.M
% C - Image from Coil 'l', S - Sensitivity of Coil 'l', M - underlying sample magnetization.
%Here both S and M are unknowns, however we can use coil-combined image from the previous section as an 
%approximation of M, then we can find S.
S_0 = img./img_combined;
imagesc(abs(S_0(:,:,1)));
colormap jet;
imagesc(abs(S_0(:,:,2)));
colormap jet;

%The last step is to mask the sensitivities. 
%Because they won't be well defined anywhere outside of the brain (because  in those areas),
%we should mask the sensitivities to retain only the well-defined regions.
%We will not loose any information though.
thresh = 0.05*max(abs(img_combined(:)));
mask = abs(img_combined)>thresh;
S_2 = S_0.*mask;
imagesc(abs(S_2(:,:,1)));
colormap jet;
imagesc(abs(S_2(:,:,2)));
colormap jet;

%SENSE parallel imaging

%What happens to the images when we under-sample our k-space data. To do this we can zero/mask out the k-space values we want to pretend to not have acquired.
Kn_new = K0;
Kn_new(1:2:end,:,:) = 0;
img_R = ifft2(Kn_new);
imagesc(abs(img_R(:,:,1)));
colormap gray;
imagesc(abs(img_R(:,:,2)));
colormap gray;

%Collecting only half of the necessary k-space data in this way results in aliasing of the brain image, so that we can no longer unambiguously separate out the top and bottom portions of the brain.

%Initialize output image
img_out = zeros(256,256);
for i=1:128
	for j=1:256
		%Pick out the sub-problem sensitivities
		S_R2 = transpose(reshape(S_2([i i+128],j,:),2,[]));
		%solve the sub-problem in the least-squares sense
		img_out([i i+128],j) = pinv(S_R2)*reshape(img_R(i,j,:),[],1);
	end
end
imagesc(abs(img_out));
colormap gray;




