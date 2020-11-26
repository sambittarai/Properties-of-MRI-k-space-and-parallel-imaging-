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

**Inference**

* Here we are combining the data acquired by the coil-1 and coil-2 to get the final image using SoS function.
* In Task 1 we acquired 2 images of the same anatomy using 2 different coils at 2 different positions.
* The part of the anatomy which is closest to coil-1 generated maximum information for that anatomy and less data for the anatomy far from it. A similar thing happens for coil-2.
* In Task 2 we combine those 2 images (in Task 1) to get the final image of the anatomy, which contains the complete information of the anatomy.

## Task 3

Our k-space is of dimension (256, 256, 2).

### [a] Remove half of k-space by replacing the most central half with zeros.

**Case 1 - By Replacing half of the central elements of the k-space with zeros i.e. Kn(64:192, 64:192, :) = 0**

![](Image_Plots/Task_3/1_Removing64_192.png)

**Inference**
* Since the central parts of the k-space contains all the low-frequency components and also contains very high signals (high SNR), so by replacing most of the central parts of the k-space with 0, we were actually doing some kind of high pass filtering.
* When we reconstruct our image from this k-space then we have mostly high-frequency components in our image and most of the high-frequency components corresponding to noise. Hence, the image looks noisy.
* In other words, most of the signal contrast of the image corresponds to the central part of the k-space and replacing them with 0, which means we are decreasing the overall contrast of the image. Hence, the overall image is noist as well as reduced contrast.

**Case 2 - By Replacing some of the central elements of the k-space with zeros i.e. Kn(110:140, 110:140, :) = 0**

![](Image_Plots/Task_3/2_Removing110_140.png)

**Inference**
* A similar thing happens here as described above in case 1.
* Here, as we can see that the edges are more clear although the overall contrast is improved a little as compared to case 1. This is because we are replacing a smaller central region of k-space with 0, which means now we have comparatively more number of lower frequencies present, which means better contrast and SNR.

**Case 3**

### [b]
