# Closing Prices of SP500

getwd()

sp500_07 = scan('sp500_2007_07_28-2008_12_31.txt')
sp500_09 = scan('sp500_2009_07_21-2017_07_18.txt')

sp500_07 = ts(sp500_07, frequency = 251, start = 2007)
sp500_09 = ts(sp500_09, frequency = 251, start = 2009)

plot(sp500_07, col = 'red')
plot(sp500_09, col = 'blue')

drift_07 = (sp500_07[466] - sp500_07[1]) / (length(sp500_07) - 1)
drift_09 = (sp500_09[2013] - sp500_07[1]) / (length(sp500_09) - 1)

vol_07 = sd(diff(sp500_07))
vol_09 = sd(diff(sp500_09))

# Forcasting

x = sp500_09
s = 1650

drift_est = (x[s] - x[1]) / (s - 1)
time(x)
time(x)[s]

trend_line = (0 : length(x)) * drift_est
plot(ts(trend_line)) # just a straight line

trend_line = (0 : (length(x) - 1)) * drift_est + x[1]
plot(time(x), trend_line) # error
plot(c(time(x)), trend_line)
lines(c(time(x)), trend_line)
abline(v = time(x)[s])
abline(v = time(x)[s], col = 'gray')

# Turn White Noise into Autoregression

phi0 = 0
phi1 = 1 # try 1, 0.5, -0.9, -0.1, -0.999, -1.1, -1.05

W = rnorm(250, 0, 1) + phi0
AR = filter(W, c(phi1), method = 'recursive') # Recursive implies AR
plot(ts(AR), col = 'green')
mean(AR)

phi0 = 0.25
phi1 = -0.5
phi2 = 0.3 # try these

W = rnorm(250, 0, 1) + phi0
AR = filter(W, c(phi1, phi2), method = 'recursive')
AR = AR[-(1 : 50)]
plot(ts(AR), col = 'violet')
mean(AR)