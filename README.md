# Properties-of-MRI-k-space-and-parallel-imaging-
The aim of this repository is to get familiar with the properties of MRI k-space and parallel imaging. The task is to investigate different properties of k-space and their influence on image space by using only parts of k-space.

## Task 1

* During MRI data acquisition, the space covered by the phase and frequency encoding data is known as the k-space. The k-space and Image space are related by Fourier Transform.
* Here we are using multi-channel coils (number of coils = 2), to gain SNR, where each coil is independent. Each coil acquires the point of image which they were of most sensitive to.
* Each coil acwuires the information independently and we can combine the images acquired by the different coils to get the final image.

**k-space of coil 1**     

![](Image_Plots/Task_1/1_k_space_coil1.png) 

**k-space of coil 2**

![](Image_Plots/Task_1/2_k_space_coil2.png)

**Image reconstructed from k-space of coil 1**

![](Image_Plots/Task_1/Image_coil1.png) 

**Image reconstructed from k-space of coil 2**

![](Image_Plots/Task_1/Image_coil2.png)




