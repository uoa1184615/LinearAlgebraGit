% read and process the Pascal picture 292x277
rgb=imread('pascal.png');
A=double(rgb(:,:,1));
n=min(size(A))
[U,S,V]=svd(A); 
figure(1)
s=diag(S);
loglog(1:n,s(1:n),'.')
ylabel('singular values')
%print -depsc2 'pascalsing'
matlab2tikz('pascalsing.tex','showInfo',false ...
,'noSize',true,'parseStrings',false ...
)
figure(2)
colormap('gray')
ranks=[3 10 30 n];
for p=1:4
  k=ranks(p)
  subplot(2,2,p)
  imagesc(U(:,1:k)*S(1:k,1:k)*V(:,1:k)')
  title(['rank ' num2str(k)])
  axis equal, axis off
end
set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 14 10])
print -depsc2 'pascalrank'
