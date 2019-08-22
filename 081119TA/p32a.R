x = rnorm(100, 0, 1)
white_noise = ts(x)
n = c(1:100)
signal = (n / 20) ^ 2
signal_in_noise = ts(signal + white_noise)
plot(signal_in_noise, ylab = 'Signal in Noise')