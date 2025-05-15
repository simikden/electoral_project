#Block 1
Dead_Inside <-  read.csv ("C:/Users/Vladimir/Desktop/python1/Ïðîåêò/Table.csv", sep=";")

#Block 2
attach(Dead_Inside)
Turnout <- (voting_before+voting_normally+voting_outside)/Voters
Turnout  <- round(Turnout, digits = 3)
Share_inValid <- Invalid/(Valid+Invalid)
Share_inValid  <- round(Share_inValid, digits = 3)
Wildways <- cbind(Turnout,Share_inValid,Dead_Inside)
attach(Wildways)
Bez_Obid <- Wildways[,-c(1:9)]
for(i in 1:ncol(Bez_Obid)){ Bez_Obid[,i] <- as.numeric(sub("%",
                                                   "",Bez_Obid[,i],fixed=TRUE))/100 }
Bez_Obid <- round(Bez_Obid, digits=3)

Muse <- cbind(X,Turnout,Share_inValid , Bez_Obid)
attach(Muse)


Net_Slov <- lm(Edinaya_rasiya~ Turnout + Share_inValid)
summary(Net_Slov)

#Block 3


par(mfrow = c(1, 2))
Yavka <- hist (Turnout, main = "Turnount Distribution", xlab = "Turnout Percentage", ylab = "PECs", breaks= 30) 
lines(density(Turnout), col="blue")
Rashka <- hist (Edinaya_rasiya, main = "Edinaya rosiya Votes Distribution", xlab = "Votes Percentage", ylab = "PECs",  breaks= 30) 
lines(density(Edinaya_rasiya), col="blue")

library(ggplot2)
library(cowplot)

 
Obshyak <- (Pensy_za_spravedlivost+Green+Grazhd_Platforma+Parnas+Rodina+Kommunisty_rosii+Rosta+Grazhd_Sila+Patrioty)
RIP <- ggplot() + 
  geom_boxplot(data = Muse, aes(y = Edinaya_rasiya, x= "Edinaya rosiya"), col = "#B0B7C6", fill = "#FFFF99") +
  geom_boxplot(data = Muse, aes(y = kprf, x = "KPRF"), col = "#F34723", fill = "#4D220E") +
  
  geom_boxplot(data = Muse, aes(y = ldpr, x = "LDPR"), col = "#FFDB58", fill = "#00693E") +
  geom_boxplot(data = Muse, aes(y = Yabloko, x="Yabloko"), col = "#30BA8F", fill = "#01796F") +
  geom_boxplot(data = Muse, aes(y = Sprav_rasiya, x="Spravedlivaya rosiya"), col = "#B0B7C6", fill = "pink") +
  geom_boxplot( aes(y = Obshyak, x="Other Parties"), col = "#FFDB58", fill = "red") + 
  xlab("Parties") +
  ylab('Percent') +
  ggtitle("Parties Percentages")   
RIP


yadro <-ggplot(Muse) + 
  aes(x=Turnout, y=Edinaya_rasiya) +
  geom_point() +
  ylab("Percentage of Edinaya rosiya")+
  xlab("Percentage of Turnout")+
  ggtitle("Dependence of EdRo Result from Turnout")+
  stat_smooth(method = "lm", se = T, col="blue")

cummunna <-ggplot(Muse) + 
  aes(x=Turnout, y=kprf) +
  geom_point() +
  ylab("Percentage of KPRF")+
  xlab("Percentage of Turnout")+
  ggtitle("Dependence of KPRF Result from Turnout")+
  stat_smooth(method = "lm", se = T, col="red")

liberal <-ggplot(Muse) + 
  aes(x=Turnout, y=ldpr) +
  geom_point() +
  ylab("Percentage of LDPR")+
  xlab("Percentage of Turnout")+
  ggtitle("Dependence of LDPR Result from Turnout")+
  stat_smooth(method = "lm", se = T, col="yellow")

yabluko <-ggplot(Muse) + 
  aes(x=Turnout, y=Yabloko) +
  geom_point() +
  ylab("Percentage of Yabloko")+
  xlab("Percentage of Turnout")+
  ggtitle("Dependence of Yabloko Result from Turnout")+
  stat_smooth(method = "lm", se = T, col="green")

pvravda <-ggplot(Muse) + 
  aes(x=Turnout, y=Sprav_rasiya) +
  geom_point() +
  ylab("Percentage of Spravedlivaya rosiya")+
  xlab("Percentage of Turnout")+
  ggtitle("Dependence of SpavRos Result from Turnout")+
  stat_smooth(method = "lm", se = T, col="gray")

BlaBla <- plot_grid(yadro,cummunna,liberal, yabluko, pvravda)
BlaBla




FallOutBoy <- lm (Edinaya_rasiya ~ Share_inValid*Turnout)
summary(FallOutBoy) #Share_inValid:Turnout p value  0.375 > 0.05

library(car)
library(sandwich)

qqPlot(Net_Slov, main="QQplot")
#we can assume about the presence of problem because of points which are out of the confidence field 



crPlots(Net_Slov)
#trendlines are not matching so there might be a problem of non-linear relationship between the IV and DV

#Block 4

descr <- data.frame(Turnout, Share_inValid, Rodina, Kommunisty_rosii, Pensy_za_spravedlivost, Edinaya_rasiya, Green, Grazhd_Platforma, ldpr, Parnas, Rosta, Grazhd_Sila,
                    Yabloko, kprf, Patrioty, Sprav_rasiya)
library(stargazer)

stargazer(descr , type="html",
          title="Descriptive statistics", 
          digits=3, 
          summary.stat=c("n","mean","sd", "min", "max","median"),
          out="Partiyi.htm")

#Block 5

stargazer(Net_Slov, type="html", 
          title = "Regression Output",
          ci=TRUE,
          out = "Regr.htm")
          
#there are two statistically significant independent variables in the regression: Turnout and Invalid Share
#Between Edinaya_rasiya and Turnout - positive direction of relationship
#Between Edinaya_rasiya and Share_inValidt - negative direction of relationship
#Multiple R-squared:  0.1079,	Adjusted R-squared:  0.104  / the share of variability of the model is ~ 10,4%-10,8%
#p-value: 5.483e-12 < 0.05 - the model has predictive capability 

#Block 6 


vif(Net_Slov)
#nothing is greater than 10 so there is no multicollinearity

spreadLevelPlot(Net_Slov)
#the blue dashed trendline going up and pink reference line varying SO there is might be a problem of heteroscedasticity
ncvTest(Net_Slov)
#p = < 2.22e-16 (<0.05) so the problem exists and it hinders the model’s characteristics

outlierTest(Net_Slov)
#outlier is in the 341st line (Bonferroni p  2.8583e-06 < 0.05)
#outlier is in the 182nd line (Bonferroni p  1.5383e-02 < 0.05)
#outlier is in the 195th line (Bonferroni p  4.1288e-02 < 0.05)



plot(Net_Slov, which=4, cook.levels=1)
abline(h=1, lty=2, col="red")
#no influential observations in the graph (no one is greater than 1)

Complince <- lm (Edinaya_rasiya ~ Share_inValid * Turnout)
summary(Complince) #Share_inValid:Turnout p value  0.375 > 0.05
#no interaction effect