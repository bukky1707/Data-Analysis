d1<-read.csv("/Users/Lenovo/Downloads/final.csv")
dim(d1)
str(d1)
d1$ID<-NULL
dim(d1)
sapply(d1,function(x) sum(is.na(x)))
d2<-d1[,c('RMOB', 'WI', 'RCA', 'Religion', 'Region',
 'AOR', 'HEL', 'DOBCMC', 'DOFBCMC', 'MTFBI', 'RW','RH','RBMI')]
d3<-na.omit(d2)
dim(d2)
dim(d3)
summary(d3)
 DOBCMC, DOFBCMC and mtfbi
d3$AVG<-(d3$DOBCMC+d3$DOFBCMC+d3$MTFBI)/3
dim(d3)
d3$NewReligion[d3$Religion <= 1] <- 1
d3$NewReligion[d3$Religion > 1] <- 2
table(d3$Region)
table(d3$Region,d3$Religion)
tapply(d3$AOR,d3$Region,mean)
aggregate(AOR~Religion,data=d3,var)
boxplot(d3$MTFBI,main="Boxplot for MTFBI variable")
hist(d3$RCA,main="Histogram for RCA variable",
xlab='class limit',ylab='Frequency', col='Red')
labels <- factor(d3$Region, levels = c(1:7), 
labels = c("1","2","3","4","5","6","7"))
barplot(table(labels), main='Barplot for Region Variable',xlab='Region categories', ylab='Frequency')
pie(table(labels),main="Pie chart for Region variable")
par(mfrow=c(2,2))
labels <- factor(d3$Region, levels = c(1:7), 
labels = c("1","2","3","4","5","6","7"))
barplot(table(labels), main='Barplot for Region Variable',xlab='Region categories', ylab='Frequency')
pie(table(labels),main="Pie chart for Region variable")
boxplot(d3$MTFBI,main="Boxplot for MTFBI variable")
hist(d3$RCA,main="Histogram for RCA variable",
xlab='class limit',ylab='Frequency', col='Red')
d4<-with(d3,split(d3,WI))
table(d4)

mat11<-matrix(NA,length(d4),5)
for(i in 1:length(d4)){
d<-d4[[i]]
mean1<-round(mean(d$MTFBI),1)
min1<-round(min(d$MTFBI),1)
max1<-round(max(d$MTFBI),1)
var1<-round(var(d$MTFBI),1)
med1<-round(median(d$MTFBI),1)
All<-c(mean1,min1,max1,var1,med1)
mat11[i,]<-All
}
mat11
#-------
#-------
colnames(mat11)<-c('mean_MTFBI','min_MTFBI','max_MTFBI','var_MTFBI','median_MTFBI')
m<-data.frame(mat11)
t.test(d3$MTFBI, mu =30, alternative = "two.sided", alpha = 0.05)
shapiro.test(d3$MTFBI)
t.test(d3$MTFBI~d3$NewReligion, alternative = "two.sided")
temp<-d3[,c('DOBCMC','DOFBCMC','AOR','MTFBI','RW','RH','RBMI')]
cor(temp)
reg<-lm(MTFBI~AOR+RW+Region,data = d3)
summary(reg)
#48
reg1<-lm(MTFBI~AOR,data = d3)
summary(reg1)
#49
t<-d3[,c('AOR','MTFBI')]
cor(t)
cor(d3$AOR,d3$MTFBI)
#50
install.packages("EnvStats")
library(EnvStats)
varTest(d3$AOR, alternative = "two.sided", 
conf.level = 0.95, sigma.squared =10, data.name = NULL)
library("ggplot2")
eq = function(x){exp(x)/factorial(x)}
ggplot(data.frame(x=c(2, 15)), aes(x=x)) + 
  stat_function(fun=eq)
tmpFn<-function(x){
ifelse(x < 0, 2*x^2 + exp(x) + 3, ifelse(x < 10, 9*x + log(20), 7*x^2 + 5*x - 17))
}
t <- seq(-10, 10, len=100)
plot(t, tmpFn(t), type="l")
fun1<-function(x){
	fx<-pi*x^2
	fx
}
fun1(10:19)
a<-1:10000
sum(1/log(a))
s1<-0
	for(r in 1:30){
	for(s in 1:10)
	s1<-s1+(r^10)/(3+s)
	}
	s1
s1<-0
	for(r in 1:10000){
	s1<-s1+(1/log(r))
	}
	s1

integrand=function (x) {(x^15)*exp(-40*x)}
integrate(integrand,0,Inf)
integrand=function (x) {(x^150)*(1-x)^(30*x)}
integrate(integrand,0,1)
foo1<-function(a,b,c){
      b^2-4*a*c
}
# part-2
foo2 <- function(a,b,c){
  if(foo1(a,b,c) > 0){ # first case D>0
        x1 = (-b+sqrt(foo1(a,b,c)))/(2*a)
        x2 = (-b-sqrt(foo1(a,b,c)))/(2*a)
        result = c(x1,x2)
		return(result)
  }
  else if(foo1(a,b,c) == 0){ # second case D=0
        x = -b/(2*a)
		return(x)  
}
  else {"There are no real roots."} # third case D<0
}
#a
foo2(1,-33,1)
f1 <- function(x,y,z)
{
	fx<-(exp(x)-log(z^2))/(5+y)
	fx
}
f1(1:5,2:6,3:7)
f1(2,3,4)
f1(3,4,5)
f1(4,5,6)
f1(5,6,7)
s1<-0
	for(x in 1:5){
	for(y in 2:6){
	for(z in 3:7)
	s1<-(exp(x)-log(z^2))/(5+y)
}
s1
}

p*(1+r)^t. p=40, t=50, and r=.10
40*(1+.10)^50
n= 1

simdata <-function(n){
x1 = rbinom(n,20,.70)
x2 = runif(n,-1,1)
x3 = runif(n,15,30)
x4 = round(rnorm(n,0,5),2)

y= 50 + 10*x1 + 20*x3 + 100*(x4) + x2
y = round(y,2)
y
}
simdata(n)
foo <-function(n)
{
x<-simdata(n)
mean.x<-mean(x)
var.x<-var(x)
mv<-c(mean.x,var.x)
mv
}
foo(n)
a<-replicate(B, foo(n))
sim.mean<-mean(a[1,])
sim.var<-mean(a[2,])
abs(640-sim.mean)
abs(257920-sim.var)