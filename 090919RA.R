# Decomposition

data = scan('international_airline_passengers_Jan1949-Dec1962.txt')
data = ts(data, start = c(1949, 1), frequency = 12)

liap = log(data)
plot(liap)

# X_t = /beta_0 + /beta_1*t + /sum_{i=1}^12 * /delta_i * D_{t, i}
# /delta_i = 1, t = Jan or 0, others
# /delta_1 = effect of Jan
# /delta_12 = - /delta_1 - /delta_2 - /delta_3 ... - /delta_11 = effect of Dec

D = diag(12)
D[12, ] = -1

D = kronecker(rep(1, 12), D)
D[ , 12] = time(liap)

fit = lm(liap ~ D)
summary(fit)

dec_est = - sum(coef(fit)[2: 12])

fitted = ts(fitted.values(fit), start = c(1949, 1), frequency = 12)

lines(fitted, col = 'blue')

plot(liap, col = 'red')
slope = coef(fit)[13]
inter = coef(fit)[1]
lines(inter + slope * time(liap))

seas = coef(fit)[2: 12]
seas = c(seas, dec_est)
plot(seas, col = 'red', type = 'l')

irr = ts(residuals(fit), start = c(1949, 1), frequency = 12)
plot(irr, col = 'red')

par(mfrow = c(4, 1))

d = decompose(liap)
plot(d)

d = decompose(data, type = 'additive')
plot(d)

d = decompose(data, type = 'multiplicative')
plot(d)

s = stl(liap, s.window = 'periodic')
plot(s)