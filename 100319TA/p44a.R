b1 = 0
b2 = -0.8
set.seed(002)
ar2 = arima.sim(list(ar = c(b1, b2)), n = 1000, sd = 2)
acorr = acf(ar2, type = 'correlation', lag.max = 24)
acorr
plot(acorr, xlab = 'Lag', ylab = 'ACF(CORR)',
     main = 'Autocorrelation of the AR(2)')
points(0, 1)
for (i in (1: 24)) {
  if (i %% 2 == 1) {points(i, 0)}
  else {points(i, (- 0.8)^(i / 2))}
}
# Equivalent to "ar2.acf = ARMAacf(c(b1, b2), 0, lag.max = 24)"
legend(x = 'topright', legend =
         c('Theoretical autocorrelation', 
           'Sample autocorrelation'), 
       pch = c('o', 'l'))