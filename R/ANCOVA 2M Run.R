#import tick figure data
tick <- read.csv("tickdata.csv", header=T)
View(tick)

# install.packages("car")
library(car)

#Simple Plot for 2METER SPRINT SPEED 
plot(x   = tick$HLL, 
     y   = tick$Max_2m, 
     col = tick$Yes1N0, 
     pch = 5,
     xlab = "HLL",
     ylab = "m/s")

legend('bottomright', 
       legend = levels(tick$Yes1N0), 
       col = 1:2, 
       cex = 1,    
       pch = 16)


#ANCOVA for 2METER SPRINT SPEED 
options(contrasts = c("contr.treatment", "contr.poly"))

#these are the default contrasts in R
#interaction between HLL and tick Presence_Absence is not significant, 
# so the slope across groups is not different
model.1 = lm (Max_2m ~ HLL + Yes1N0 + HLL:Yes1N0, data = tick)
Anova(model.1, type="II")


#The category varible (Yes1N0) is significant p = 0.009, so the intercepts among groups are different
model.2 = lm (Max_2m ~ HLL + Yes1N0,
              data = tick)
Anova(model.2, type="II")

 

# Now check the P value and R squared for the combined model
# Results are realitivly close to JMP values. 
summary(model.2)




# Drawing ANCOVA plot with fitted lines. 
# I.nought is Intercept 
# I2 is Presence_Absence estimate
# B is HLL estimate

I.nought = -0.31785 
I1 = I.nought + 0
I2 = I.nought + -0.30515 
B  = 0.05234 

plot(x   = tick$HLL, 
     y   = tick$Max_2m, 
     col = tick$Yes1N0, 
     pch = 16,
     xlab = "HLL",
     ylab = "Max_2m")

legend('bottomright', 
       legend = levels(tick$Yes1N0), 
       col = 1:2, 
       cex = 1,    
       pch = 16)

abline(I1, B,
       lty=1, lwd=2, col = 1)

abline(I2, B,
       lty=1, lwd=2, col = 2)




# Assumptions Check
# Histogram of residuals
# Note:histogram of residuals appear normal
hist(residuals(model.2), 
     col="darkgray")


# Plot of residuals vs. predicted values
# Note: residuals are unbiased and appear homoscedastic

plot(fitted(model.2), 
     residuals(model.2))



