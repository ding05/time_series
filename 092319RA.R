mu = 1; phi1 = 0.8
mu = 0.1

# set.seed(002) # every time run the same TS
y = arima.sim(n = 200, list(ar = 0.8)) + mu # higher n, closer to sample mean
plot(y, col = 'red')
abline(h = mu) # plot theoretical mean
mean(y) # calculate sample mean

acf(y) # calculate and plot sample ACF
theo_acf = phi1 ^ (0 : 24) # calculate theoretical ACF
points(0 : 24, theo_acf, col = 'red') # add theoretical ACF to sample ACF plot

phi1 ^ 20