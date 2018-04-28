train = dlmread('train.csv' ,',', 0,0);
k = train(1,1);
if ( k == 0),
	x_train=train(2:end,1);
	y_train=train(2:end,2);
else,
	x_train=train(1:end,1);
	y_train=train(1:end,2);
end,
new_x_train=ones(size(x_train,1),1);
new_x_train(:,2) = repmat(x_train,1);
n_train=rows(x_train);



w=rand(2,1);

hold on;
scatter (x_train, y_train, "r");
xlabel ("feature");
ylabel ("label");
title ("Scatter plot");
plot(x_train,new_x_train*w);
print -dpdf "fig1.pdf";
close;


w_direct=inv(new_x_train'*new_x_train)*new_x_train'*y_train;
hold on;
scatter (x_train, y_train, "r");
plot(x_train,new_x_train*w_direct);
print -dpdf "fig2.pdf";
close;


eta=0.00000001;
for nepoch = 1:2,
	for j = 1:n_train,
		x=x_train(j);
		y=y_train(j);
		x=[1,x];
		x=x';
		temp = (w'*x-y)*x;
		w=w-eta*temp;
		if (rem(j,100)==0),
			hold on;
			plot(x_train,new_x_train*w);
		end,	
	end,
end,
print -dpdf "fig3.pdf";
close;

hold on;
plot(x_train,new_x_train*w);
print -dpdf "fig4.pdf";
close;

test = dlmread('test.csv' ,',', 0,0);
k1 = test(1,1);
if ( k1 == 0),
	x_test=test(2:end,1);
	y_test=test(2:end,2);
else,
	x_test=test(1:end,1);
	y_test=test(1:end,2);
end,

n_test=rows(x_test);
new_x_test=ones(size(x_test,1),1);
new_x_test(:,2) = repmat(x_test,1);
y_pred1 = new_x_test*w;
y_pred2 = new_x_test*w_direct;
s1=0.0;
s2=0.0;
for i = 1:n_test,
	s1 = s1 + (y_pred1(i)-y_test(i))*(y_pred1(i)-y_test(i));
	s2 = s2 + (y_pred2(i)-y_test(i))*(y_pred2(i)-y_test(i));
end,
rms1 = s1/n_test;
rms2 = s2/n_test;
rms1 = sqrt(rms1);
rms2 = sqrt(rms2);
disp(rms1);
disp(rms2);


	
