function [Leff,s2_eff]=effec_params(Si,Wx,Sigma)

% EFFEC_PARAMS
% 
% Calculate effective parameters from GRAPPA
%
% INPUT:
%         Si: Non noise reconstructed signal (A_i)
%         Wx: Grappa coefs. in X-domain
%         Sigma= covariance matrix
%
% OUTPUT:
%	  LEff: Effective Number of coils
%         s2_eff: Effectiva variance of noise
%
%  Parameters for GRAPPA analysis are taken from
%
%     S. Aja-Fernández, A. Tristán-Vega, S. Hoge. Statistical Noise Analysis in 
%     GRAPPA using a parametrized non-central chi approximation model. 
%     Magnetic Resonance in Medicine. Volume 65, Issue 4, pages 1195–1206, 2011
% 
%
% PARALLEL MRI TOOLBOX
%
% Santiago Aja-Fernandez, LPI
% www.lpi.tel.uva.es/~santi
% Valladolid, 28/05/2012


AT2=sos(Si).^2;
[Mx My coils]=size(Si);

for ii=1:Mx
for jj=1:My
Wi=squeeze(Wx(ii,jj,:,:));
Ai=squeeze(Si(ii,jj,:));
Ktmp=Wi*Sigma*Wi';
trCX(ii,jj)=trace(Ktmp);
FbCX2(ii,jj)=sum((abs(Ktmp(:))).^2);
ACXA(ii,jj)=(Ai')*Ktmp*(Ai);
end
end
Leff=real((AT2.*trCX+(trCX).^2)./(ACXA+FbCX2));
s2_eff=real(trCX./Leff);
