library(mFilter)

unemp = scan('unemp_nz_quarterly_1986Q1-2019Q2.txt')
Case_3 = ts(unemp, frequency = 4, start = 1986)
plot(Case_3, xlab = 'Year', ylab = 'NZ Unemployment Rate')

# Apply the HP filter with different values for frequency

Case_3.hp = hpfilter(Case_3)
Case_3.hp1 = hpfilter(Case_3, drift = TRUE)
Case_3.hp2 = hpfilter(Case_3, type = 'lambda', freq = 800,
                      drift = TRUE)
Case_3.hp3 = hpfilter(Case_3, type = 'lambda', freq = 52,
                      drift = TRUE)
Case_3.hp4 = hpfilter(Case_3, type = 'lambda', freq = 12,
                      drift = TRUE)
Case_3.hp5 = hpfilter(Case_3, type = 'lambda', freq = 15,
                      drift = TRUE)
Case_3.hp6 = hpfilter(Case_3, type = 'lambda', freq = 6,
                      drift = TRUE)

plot(Case_3.hp, '')
plot(Case_3.hp1, '')
plot(Case_3.hp2, '')
plot(Case_3.hp3, '')
plot(Case_3.hp4, '')
plot(Case_3.hp5, '')
plot(Case_3.hp6, '')