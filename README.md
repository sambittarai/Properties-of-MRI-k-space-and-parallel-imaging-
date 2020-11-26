# Properties-of-MRI-k-space-and-parallel-imaging-
The aim of this repository is to get familiar with the properties of MRI k-space and parallel imaging. The task is to investigate different properties of k-space and their influence on image space by using only parts of k-space.

## Task 1

* During MRI data acquisition, the space covered by the phase and frequency encoding data is known as the k-space. The k-space and Image space are related by Fourier Transform.
* Here we are using multi-channel coils (number of coils = 2), to gain SNR, where each coil is independent. Each coil acquires the point of image which they were of most sensitive to.
* Each coil acquires the information independently and we can combine the images acquired by the different coils to get the final image.

**k-space of coil 1**     

![](Image_Plots/Task_1/1_k_space_coil1.png) 

**k-space of coil 2**

![](Image_Plots/Task_1/2_k_space_coil2.png)

**Image reconstructed from k-space of coil 1**

![](Image_Plots/Task_1/Image_coil1.png) 

**Image reconstructed from k-space of coil 2**

![](Image_Plots/Task_1/Image_coil2.png)

**Observations**

* The image acquied by coil 1 has lower contrast in the bottom as compared to the top region. Hence, it is darker in the bottom region because the coil 1 is placed closer to the top. Therefore, the coil is most sensitive to the area which is closer to it.
* Similarly, the image acquired by coil 2 has lower contrast in the top as compared to the bottom region. Hence, it is darker in the top region because the coil 2 is placed closer to the bottom region.

## Task 2

**Construct a composite image using the sum of squares (SoS) method**

![](Image_Plots/Task_2/MRI.png)




