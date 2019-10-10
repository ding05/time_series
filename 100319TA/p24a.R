b1 = 0.8
b2 = -0.6
set.seed(001)
ma2 = arima.sim(list(ma = c(b1, b2)), n = 1000, sd = 2)
acorr = acf(ma2, type = 'correlation', lag.max = 24)
acorr
plot(acorr, xlab = 'Lag', ylab = 'ACF(CORR)',
     main = 'Autocorrelation of the MA(2)')
points(0, 1)
points(1, 0.16)
points(2, -0.3)
for (i in (3: 24)) {
  points(i, 0)
}
# Equivalent to "ma2.acf = ARMAacf(0, c(b1, b2), lag.max = 24)"
legend(x = 'topright', legend =
         c('Theoretical autocorrelation', 
           'Sample autocorrelation'), 
       pch = c('o', 'l'))