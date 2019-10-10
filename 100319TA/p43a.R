b1 = 0
b2 = -0.8
set.seed(002)
ar2 = arima.sim(list(ar = c(b1, b2)), n = 1000, sd = 2)
plot(ar2, xlab = 't', ylab = 'X_t', main =
       'An AR(2) time series')