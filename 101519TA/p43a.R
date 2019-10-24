acorr= acf(co2_t, type = 'correlation', lag.max = 800)
plot(acorr, xlab = 'Lag', ylab = 'ACF(CORR)',
     main = 'Autocorrelation')
pacorr = pacf(co2_t, lag = 800)
plot(pacorr, xlab = 'Lag', ylab = 'PACF(CORR)',
     main = 'Partial Autocorrelation')