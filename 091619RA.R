liap = ts(log(scan('international_airline_passengers_Jan1949-Dec1962.txt')), start = 1949, frequency = 12)
plot(liap, col = 'red', main = 'Log international airline passengers')

cliap = liap - mean(liap) # Mean correct the time series

# Sqaured modulus of the complex numers gives the periodogram
n = length(cliap)
per = Mod(fft(cliap)[1: (n/2 + 1)])^2 / n

freq = (0: (n/2)) / n
plot(freq, per, type = 'l', xlab = 'frequency f', ylab = 'periodogram')

spectrum(cliap, log = 'no', detrend = FALSE, taper = 0)
lines(freq * 12, per / sqrt(n), col = 'red', lty = 2) # same

spectrum(cliap, log = 'no')

# Stimulate ts data and explore periodogram

f = 1/12
t = seq(1, 5 * 12)

# signal is the shifted sine wave
Xsignal = 5 * sin(2 * pi * f * t + pi / 3)

# add random noise
Xt = Xsignal + rnorm(60)

plot(t, Xt) # plot time series data
lines(t, Xsignal) # plot true signal

# periodogram of ts data
spectrum(Xt, log = 'no', detrend = FALSE)

# extra
phase = 1 / 3
W = rnorm(60)
Xsignal = 5 * sin(2 * pi * f * t + phase) + 3 * sin(2 * pi * f * t + phase)
Xt = Xsignal + W
plot(t, Xt)
lines(t, Xsignal)