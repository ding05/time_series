# Murder reports in the U.S.

mur = scan('murders_by_steam_1999-2009.txt')
age = scan('ages_miss_america_1999-2009.txt')
mean(mur)
mean(age)
var(mur)
var(age)
cov(mur,age)
cor(mur,age)

# White Noises

W = rnorm(200, 0, 1)
W = ts(W)
plot(W)

W = runif(200, -1, 1)
W = ts(W)
plot(W)
# slightly different looks

# White Noises -> Random Walks

W = rnorm(200)
X = cumsum(W)
X = ts(X)
plot(X)

Xdiff = diff(X)
plot(ts(Xdiff))
# it becomes white noises again

W= rnorm(200)
d= 0.1
X= cumsum(W+d)
X= ts(X)
plot(X)
# when d = 3, the line is almost straight

# Genereate Difference

W = rnorm(200)
d = 0.1
X = cumsum(W+d)
X = ts(X)
plot(X)

Xdiff = diff(X)[1:150]
d_est = mean(Xdiff)
d_est = (X[200]-X[1])/199
# X[t-1]-X[t] = W[t]+drift
# Var(X[t-1]-X[t]) = Var(W[t]+drift) = Var(W[t]) = 1/(n-1)sum((X[t-1]-X[t])^2)
var_est = var(Xdiff)
fit = lm(X ~ seq(1,200))

# Forecasting Example
d_150_est = mean(Xdiff[1:150])
plot(X, col = 'red')
lines(d_150_est*(0:199)+W[1])
abline(v = 150, col = 'gray')