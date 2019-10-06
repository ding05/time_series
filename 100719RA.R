y = arima.sim(n = 1000, list(ar = c(0.4, 0.2)))
acf(y)
pacf(y)

z = arima.sim(n = 1000, list(ma = c(0.6, 0.9)))
acf(z)
pacf(z)

y = arima.sim(n = 1000, list(ar = 0.8))
abs(polyroot(c(1, -0.8)))
abs(polyroot(c(1, -1)))