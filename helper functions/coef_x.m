function Wx=coef_x(coef,tasa,N,mode,full)

% GRAPPA convolution matrix in the x-domain
%
% INPUTS:
%
% 	coef: GRAPPA coefs
% 	tasa: Acceleration Rate
% 	N: Number of points (NxN size of image)
% 	mode: Reconstruction mode (see k2x)
% 	full: full iDFT
%
%
% PARALLEL MRI TOOLBOX
%
% Santiago Aja-Fernandez, LPI
% www.lpi.tel.uva.es/~santi
% Valladolid, 28/05/2012
%------------------------------------------
%-
if length(size(coef))==2
	coef=ajusta_coef(coef);
end

[X,Y,Z,W]=size(coef);

if Z~=W
	error('Wrong nunber of coeffs');
end

Wx=zeros([N,N,Z,W]);

%Matrix in K----------------------------

w2=coef_conv(coef,tasa);

for kk=1:Z
for jj=1:Z

if full==0
  if mode==1
	Wx(:,:,jj,kk)=ifft2(fftshift(fftshift(w2(:,:,jj,kk),1),2),N,N);
  elseif mode==2
	Wx(:,:,jj,kk)=ifftshift(ifft2(ifftshift(w2(:,:,jj,kk)),N,N));
  elseif mode==3
	Wx(:,:,jj,kk)=fftshift(ifft2(w2(:,:,jj,kk),N,N),2);
  else
	Wx(:,:,jj,kk)=ifft2(w2(:,:,jj,kk),N,N);
  end
else

  Wt=zeros(N);
  Wt(1:2,1:2)=w2(2:3,2:3,jj,kk);
  Wt(1:2,N)=w2(2:3,1,jj,kk);
  Wt(N,1:2)=w2(1,2:3,jj,kk);
  Wt(N,N)=w2(1,1,jj,kk);  
 

    if mode==2
      %Wx(:,:,jj,kk)=ifftshift(ifft2(Wt));
       Wx(:,:,jj,kk)=ifftshift(fft2(Wt)./(N.^2));
    elseif mode==3
	Wx(:,:,jj,kk)=fftshift(fft2(Wt)./(N.^2),2);
    else
      Wx(:,:,jj,kk)=(fft2(Wt)./(N.^2));
    end
  end
end
end
end




