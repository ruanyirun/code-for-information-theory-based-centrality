clear all;
A=load('data.txt');%Load author relationship data
TT=A(:, 1:2);
%%%%%%%%%%%%%  Generate adjacency matrix   %%%%%%%%%%%%%%%
mixedsig=zeros(max(max(TT)));
len=length(TT);
for i=1:len
    mixedsig(TT(i,1),TT(i,2))=1;
    mixedsig(TT(i,2),TT(i,1))=1;
end
%%%%%%%%%%%%%  resistance distance calculation   %%%%%%%%%%%%%%%
cdist= kfindex(mixedsig);
jkf=sum(cdist);

%%%%%%%%%%%%% calculate information-theory-based centrality of nodes %%%%%%%%%%%%%%%
for i=1:N
    B=find(mixedsig(i,:));
    len1=length(B);%
    ddd2=[];
    for j=1:len1
        ddd2(j)=cdist(i,B(j))/jkf(i)*log(cdist(i,B(j))/jkf(i));
    end
    CH(i)=-1*sum(ddd2);
end

