b1 = 1.6
b2 = -0.64
set.seed(001)
ar2 = arima.sim(list(ar = c(b1, b2)), n = 1000, sd = 1)
plot(ar2, xlab = 'Time', ylab = 'X_t', main = 'AR(2)')
summary(ar2)
sd(ar2)^2
acorr = acf(ar2, type = 'correlation', lag.max = 50)
acorr
plot(acorr, xlab = 'Lag', ylab = 'ACF(CORR)',
     main = 'Autocorrelation of the AR(2)')