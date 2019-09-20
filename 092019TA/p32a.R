unemp = scan('unemp_nz_quarterly_1986Q1-2019Q2.txt')
unemp = ts(unemp, frequency = 4, start = 1986)
acov = acf(unemp, type = 'covariance', lag.max = 200)
acov
plot(acov, xlab = 'Lag', ylab = 'ACF(COV)', main = 'Unemployment')