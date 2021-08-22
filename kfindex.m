function cdist= kfindex(G)
W=G;
[nw,mw]=size(W);
index=zeros(1,nw);

num=size(W,1);
d = sum(W,2); 
D = spdiags(d,0,num,num);

% generate Laplacian 
L = (D-W); 
% compute pseudoinverse PL of Laplacian 
% first = 1/sqrt(num)*ones(num,1);
% PL = inv(full(L)+first*first')-first*first'; % this is very inefficient
%PL=pinv(L);%geninv
PL=geninv(L);
clear D; 
clear W;clear L;
kf=0;
PLD = diag(PL); first = ones(num,1);
%resistance distance
cdist =(PLD*first' + first*PLD' - 2*PL); 
%
    