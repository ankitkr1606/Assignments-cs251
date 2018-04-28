data <- rexp(50000,0.2)
gr <- data.frame(X=seq(1,50000,1),Y=sort(data))
plot(gr)
max <- 100
x <- seq_along(data)
data1 <- split(data , ceiling(x/max))
plot(ecdf(data1[[1]]))
plot(ecdf(data1[[2]]))
plot(ecdf(data1[[3]]))
plot(ecdf(data1[[4]]))
plot(ecdf(data1[[5]]))
pdf1 <- rep(0,100);
for(i in 1:100){
  val=round(data1[[1]][i],1);
  if(val<=100)
  {
    pdf1[val]=pdf1[val] + 1/100;
  }
}
xcols <- c(0:99)

plot(xcols, pdf1, "l", xlab="X", ylab="f(X)")

pdf2 <- rep(0,100);
for(i in 1:100){
  val=round(data1[[2]][i],1);
  if(val<=100)
  {
    pdf2[val]=pdf2[val] + 1/100;
  }
}
xcols1 <- c(0:99)

plot(xcols1, pdf2, "l", xlab="X", ylab="f(X)")

pdf3 <- rep(0,100);
for(i in 1:100){
  val=round(data1[[3]][i],1);
  if(val<=100)
  {
    pdf3[val]=pdf3[val] + 1/100;
  }
}
xcols2 <- c(0:99)

plot(xcols2, pdf3, "l", xlab="X", ylab="f(X)")

pdf4 <- rep(0,100);
for(i in 1:100){
  val=round(data1[[4]][i],1);
  if(val<=100)
  {
    pdf4[val]=pdf4[val] + 1/100;
  }
}
xcols3 <- c(0:99)

plot(xcols3, pdf4, "l", xlab="X", ylab="f(X)")

pdf5 <- rep(0,100);
for(i in 1:100){
  val=round(data1[[5]][i],1);
  if(val<=100)
  {
    pdf5[val]=pdf5[val] + 1/100;
  }
}
xcols4 <- c(0:99)

plot(xcols4, pdf5, "l", xlab="X", ylab="f(X)")
  
me <- rep(0,500)
std <- rep(0,500)
for(i in 1:500){
  me[i]=mean(data1[[i]])
  std[i]=sqrt(var(data1[[i]]))
}

me[1]
me[2]
me[3]
me[4]
me[5]
std[1]
std[2]
std[3]
std[4]
std[5]

rounded = table(round(me,1))
plot(rounded, "h", xlab="Value", ylab="Frequency")
plot(ecdf(me))

pdf6 <- rep(0,500);
for(i in 1:500){
  val=round(me[i],0);
  if(val<=500)
  {
    pdf6[val]=pdf6[val] + 1/500;
  }
}
xcols4 <- c(0:499)

plot(xcols4, pdf6, "l", xlab="X", ylab="f(X)")

meome = mean(me)
stdome = sqrt(var(me))
tme = mean(data)
tstd = sqrt(var(data))
meome
stdome
tme
tstd
