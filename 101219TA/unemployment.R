unemp = scan('unemp_nz_quarterly_1986Q1-2019Q2.txt')
unemp = ts(unemp, frequency = 4, start = 1986)
acorr = acf(unemp, type = 'correlation', lag.max = 200)
acorr
plot(acorr, xlab = 'Lag', ylab = 'ACF(CORR)', main = 'Unemployment')

plot(unemp, xlab = 'Year', ylab = 'Unemployment Rate')