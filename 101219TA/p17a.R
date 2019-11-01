library(mFilter)

# Case 1 - Sginal in Noise

set.seed(001)
x = rnorm(100, 0, 1)
white_noise = ts(x)
n = c(1: 100)
signal = (n / 20) ^ 2
Case_1 = ts(signal + white_noise)
plot(Case_1)

# Apply the HP filter

Case_1.hp = hpfilter(Case_1)
plot(Case_1.hp)