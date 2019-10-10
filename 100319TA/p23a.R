b1 = 0.8
b2 = -0.6
set.seed(001)
ma2 = arima.sim(list(ma = c(b1, b2)), n = 1000, sd = 2)
plot(ma2, xlab = 't', ylab = 'X_t', main =
       'An MA(2) time series')