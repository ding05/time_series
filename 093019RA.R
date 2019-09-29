data(co2)

plot(decompose(co2))

d1 = diff(co2, lag = 12)
plot(d1)

fit = lm(d1 ~ time(d1))
summary(fit)

d2 = diff(d1) # the second order difference
plot(d2) # like white noise?
acf(d2)

co2.ar1 = arima(d2, order = c(1, 0, 0))
co2.ar1

# AR(1)
phi0 = co2.ar1$coef[2]
phi1 = co2.ar1$coef[1]
simulated = c(phi0 + phi1 * d2[455])
for (i in seq(2, 100)) {
  simulated[i] = phi0 + phi1 * simulated[i - 1] + rnorm(1, 0, sqrt(0, 1399))
}

plot(c(d2, simulated), type = 'l')
abline(v = 455, col = 'red')

acf(d2)
ar1.acf = ARMAacf(co2.ar1$coef[1], 0, lag.max = 24)
acf(d2)
points((0: 24) / 12, ar1.acf)

# AR(2)
# simulated = c(phi0 + phi1 * d2[455] + phi2 * d3[455]) ?