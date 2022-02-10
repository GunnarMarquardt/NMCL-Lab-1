p = [[0;0] [0;1] [1;0] [1;1]];
t = [0 1 1 0];

net = newff(p,t,[2], {'tansig', 'logsig'},'traingd','','mse',{},{},'')
net = init(net);

net.trainParam.lr = 2;
net.trainParam.epochs = 1000;
[trained_net, status] = train(net, p ,t);
plot_xor(trained_net)