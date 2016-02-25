%Christopher Robison
%Cpe 520 HW 2
n = 3;  %3 bit XOR
iter = 100000;  % iterations
bias = -11;

input = genBinIn(n);
%desired output pattern
output = [0,1,1,0,1,0,0,1]';
%learning rate
eta = .1;
layerSize= max(size(getInputs(input(1,:))))+n;
rand('state',sum(100*clock));
wts = -1 + 2.*rand(layerSize+1,1)

% inital setup complete

for i=1:iter
    
    nodeIn = length(input(:,1));
    for j = 1:nodeIn
        inpt = getInputs(input(j,:));
        L_inpt = [input(j,:) inpt]; 
        %sum of products of input nodes
        ILayer = bias*wts(1)+sum(L_inpt.*wts(2:end)');
        %output Layer
        outpt(j,:) = sigmoid(ILayer);
        %Adjust delta of weights
        delta_OUT = outpt(j)*(1-outpt(j))*(output(j)-outpt(j));
        %Propagate delta back into input layer
        delta_IN = outpt(j)*(1-outpt(j)).*wts*delta_OUT;
        
        %add delta_IN to original weights
        for k=1:length(max(size(delta_IN)))
            if k == 1 %for bias weight
                wts(k) = wts(k) + eta*bias*delta_IN(k);
            else % for actual input neurons
                wts(k) = wts(k) + eta*L_inpt(k)*delta_IN(k);
            end
        end
    end
    if mod(i,100)==0
        disp(strcat('Output  :', num2str(outpt')))
        disp(strcat('Iter = ',num2str(i)))
    end
end