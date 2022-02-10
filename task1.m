p = [[0;0] [0;1] [1;0] [1;1]];
t = [0 1 1 0];

net = newff(p,t,[2], {'tansig', 'logsig'},'traingd','','mse',{},{},'')

%net = init(net); [trained_net, status] = train(net, p ,t);

learning_rates = [0.1 2 20];
number_epochs = [2500 250 100];


for i=1:length(learning_rates)

    figure;
    ax = axes; 
    hold on;
    grid on;
    
    title_lr = ['lr = ' num2str(learning_rates(i))];
    title(title_lr);
    

    for j=1:10
        net = init(net); 
        net.trainParam.lr = learning_rates(i);
        net.trainParam.epochs = number_epochs(i);
        [trained_net, status] = train(net, p ,t);
        
        plot(ax, status.perf)
        %plot_xor(trained_net)
    end
    %pause
    
end



