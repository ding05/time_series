unemp = scan('unemp_nz_quarterly_1986Q1-2019Q2.txt')
unemp = ts(unemp, frequency = 4, start = 1986)
diff1 = diff(unemp)
Box.test(diff1, lag = 3)