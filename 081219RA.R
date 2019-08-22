# Internet Airline

data = scan('international_airline_passengers_Jan1949-Dec1962.txt')

iap = ts(data, start = c(1949, 1), frequency = 12)
plot(iap, col = 'red')

plot(diff(iap), col = 'red')
plot(diff(iap, lag = 12), col = 'red')

# Growth rates = (X_t - X_{t-1}) / X_{t-1}
monthly_growth_iap = 100 * diff(iap) / iap[-144]
annual_growth_iap = 100 * (diff(iap, lag = 12) / iap[-(133: 144)])

# Use logarithm to approximate the rate
approx_annual_growth_iap = 100 * log(diff(iap, lag = 12))

plot(monthly_growth_iap, col = 'red')
plot(annual_growth_iap, col = 'red')
line(approx_annual_growth_iap)
plot(approx_annual_growth_iap, col = 'red')

log_iap = log(iap)
plot(log_iap, col = 'red')
# Make it linearized

trend_line = d0 + time(iap) * drift
lines(exp(trend_line))

# log(AB) = log(A) + log(B)
drift = mean(diff(log_iap))

d0 = mean(log_iap - drift * time(log_iap))
lines(d0 + time(iap) * drift)

plot(log_iap - time(log_iap) * drift - d0, col = 'red')