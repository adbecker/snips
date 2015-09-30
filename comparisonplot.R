## df is simulated data or fitted data or something 
## data is the true data
## plot the true data versus the fitted data mean with confidence intervals


## add col for mean, sd, and time
df$mean <- apply(df, 1, function(row) mean(row))
df$sd   <- apply(df, 1, function(row) sd(row))

## use 95% conf
n <- nrow(df)
error <- qt(0.975,df=n-1)*df$sd/sqrt(n)
df$time <- dat$time

## this just makes an error bar ribbon around the data
## if SEM use mean +/- sd
## if 95% conf use mean +/- error
eb <- aes(ymax = mean + error, ymin = mean - error)

## compare the simulated cases data against the true data
data.sim <- data.frame(data,df)

## plot it 
comp <- ggplot(data.sim, aes(time)) +
  geom_line(aes(y = cases, colour = "true"),size=1) + xlab(NULL)+
  geom_line(aes(y = mean, colour = "fit"),size=1)+theme(legend.text=element_text(size=15))+
  theme(legend.title=element_text(size=0)) +theme(legend.position=c(.90,.90))+geom_ribbon(eb,alpha=0.3)
comp