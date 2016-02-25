%Christo Robison  CpE 520 HW #2

%1a)create and solve 3D XOR problem using 2 layer functional link
nu = 0.1; %learning rate
% generate inputs
n = 3; %number of bits/input variables
O = genBinIn(n); %generate input set
%desired output
Y = [0,1,1,0,1,0,0,1]'; %desired outputs per our input values
%generate initial weights
wts = genWeights(n);
%generate input tensor thingy
y = zeros(length(O(1)));
count = 0;
stop = true;
iters = 50;
Er = [];
while(stop==true)
    for i=1:length(O)        
        out = genTensor(O(i,:),n);
        % add bias to inputs
        out = [out 1];
        sumOprods = sum(out.*wts');
        y(i) = sigmoid(sumOprods)';
        E(:,i) = .5*(Y(i)-y(i)*out(i))^2;
        W(:,i) = (-nu*(Y(i)-y(i))*out(i));
        D(:,i) = Y(i)-y(i);
        sq = D.*D;
        Ev = sqrt(sum(sq(:)));
        
    end
    q = y';
    [k l] = size(q);
    for i = 1:k
        for j = 1:l
            d(i,j) = (Y(i,j)-q(i,j))*q(i,j)*(1-Y(i,j));
        end
    end
    Z = q*d';
    
    %
    if count == 0
        etta = 0.6;alpha=1;del_W=zeros(length(wts),1);
    end
    del_W= alpha.*del_W+etta.*Y;
    error = wts*d';
    %find d*
    clear k l
    [k l] = size(error);
    for i = 1:k
        for j = 1:l
            d_star(i,j) = error(i,j)*q(i)*(1-q(i));
        end
    end
    X = Y'*d_star;
    wts = alpha*wts+etta*X';
    
    if count >= iters
        stop=false;
    end
    count = count+1;
    
    Er = [Er sum(E)];
%     
    
    %calculate delta W
end
figure;
p=[1:count];
plot(p,Er);
fLinkNodes = n+(n*(n-1)/2);
%y = getNumNodes(n)




