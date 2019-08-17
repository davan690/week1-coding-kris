# Logistic regression for ticks KWild 
library(ggplot2)

# set working directory
setwd("~/Dropbox/RWorkingDirectory/Ticks")

# importdata (be sure to change Y/N to 0/1)
tick <- read.csv("Tickdata.csv", head = T)
head(tick)



# Basic plot of data
plot(tick$SVL, tick$Yes1N0)

# model summary 
model<- glm(Yes1N0 ~ SVL, data=tick, family=binomial(link="logit"))
summary(model)

# plotting model
ggplot(tick, aes(x=SVL, y=Yes1N0)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Reduce some of the margins so that the plot fits better
par(mar = c(4, 4, 1, 1)) 


plot(tick$SVL, tick$Yes1N0)
curve(predict(model, data.frame(SVL=x), type="response"), add=TRUE) 


