train = dlmread('train.csv' ,',', 0,0);
k = train(1,1);
if ( k == 0),
	x_train=train(2:end,1);
	y_train=train(2:end,2);
else,
	x_train=train(1:end,1);
	y_train=train(1:end,2);
end,
x_train

