b1 = 1.6
b2 = -0.64
set.seed(001)
ar2 = arima.sim(list(ar = c(b1, b2)), n = 1000, sd = 1)

# Sample ACF(CORR)
acorr = acf(ar2, type = 'correlation', lag.max = 50)
acorr
plot(acorr, xlab = 'Lag', ylab = 'ACF(CORR)',
     main = 'Autocorrelation of the AR(2)')

# Theoretical ACF(CORR)
g = c()
g[1] = 25625 / 729
g[2] = 25000 / 729
for (h in (3: 50)){g[h] = 1.6 * g[h-1] - 0.64 * g[h-2]}
g[]
r = c()
r[1] = 1
r[2] = 40 / 41
for (h in (3: 50)){r[h] = g[h] / g[1]}
r[]
for (i in (0: 49)) {points(i, r[i + 1])}
legend(x = 'topright', legend =
         c('Theoretical autocorrelation', 
           'Sample autocorrelation'), 
       pch = c('o', 'l'))

# Sample Partial ACF(CORR)
pacorr = pacf(ar2, lag = 50)
pacorr
plot(pacorr, xlab = 'Lag', ylab = 'PACF(CORR)',
     main = 'Partial Autocorrelation of the AR(2)')

# Theoretical Partial ACF(CORR)
p = c()
p[1] = 40 / 41
p[2] = -0.64
for (h in (3: 50)){p[h] = 0}
for (i in (1: 50)) {points(i, p[i])}
legend(x = 'topright', legend =
         c('Theoretical autocorrelation', 
           'Sample autocorrelation'), 
       pch = c('o', 'l'))