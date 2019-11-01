library(mFilter)

# Case 3 - NZ Unemployment Rate

unemp = scan('unemp_nz_quarterly_1986Q1-2019Q2.txt')
Case_3 = ts(unemp, frequency = 4, start = 1986)
plot(Case_3, xlab = 'Year', ylab = 'NZ Unemployment Rate')

# Apply the HP filter

Case_3.hp = hpfilter(Case_3)
plot(Case_3.hp)