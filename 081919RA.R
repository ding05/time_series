# Uniform White Noise

W = runif(200, -1, 1)
W = ts(W)
plot(W)

acf(W, type = 'covariance')
acf(W)

# Box-Pierce Test and Ljung-Box Test

k = 50 # Test different lags
Box.test(w, lag = k, type = 'Box-Pierce')
Box.test(w, lag = k, type = 'Ljung-Box')

# Moving Average

W = runif(200, 0, 1)
X = filter(w, c(1, 1, 1), sides = 1, method = 'convolution')
X = ts(X)
plot(X)

acf(X, type = 'covariance') # Error: missing values

W = runif(200, 0, 1)
X = filter(W, c(1, 1, 1), sides = 1, method = 'convolution')
X = ts(X[3: 200])
plot(X)
acf(X, type = 'covariance') # Good
acf(X)

k = 2
Box.test(W, lag = k, type = 'Box-Pierce') # To get a small p-value
Box.test(W, lag = k, type = 'Ljung-Box')