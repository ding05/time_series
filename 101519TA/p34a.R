library(itsmr)

b1 = 1.6
b2 = -0.64
set.seed(001)
ar2 = arima.sim(list(ar = c(b1, b2)), n = 1000, sd = 1)

# OLS Method

resp = ar2[3: 1000]
pred1 = ar2[2: 999]
pred2 = ar2[1: 998]

fit.ols = lm(resp ~ -1 + pred1 + pred2)
summary(fit.ols)

# Method of Moments

yw = yw(ar2, 2)
yw