p = [[0;0] [0;1] [1;0] [1;1]];
t = [0 1 1 0];

net = newff(p,t,[2], {'tansig', 'logsig'},'trainrp','','mse',{},{},'')

% Assume that for the start we will not change the deltamax and delta0 so
% much

delta0s= [0.2];
deltamaxs= [4];


for i=1:length(delta0s)

    figure;
    ax = axes; 
    hold on;
    grid on;
    
    title_lr = ['delta0 = ' num2str(delta0s(i)) ' deltamax = ' num2str(deltamaxs(i))];
    title(title_lr);
    

    for j=1:10
        net = init(net); 
        net.trainParam.delta0 = delta0s(i);
        net.trainParam.deltamax = deltamaxs(i);
        %net.trainParam.delt_inc = 1.2;
        %net.trainParam.delt_dec = 0.3;
        net.trainParam.epochs = 100;
        
        [trained_net, status] = train(net, p ,t);
        
        plot(ax, status.perf)
        %plot_xor(trained_net)
        %pause;
    end
   
    
end