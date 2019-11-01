library(mFilter)

# Case 2 - Closing Price of the SP500

sp500_31 = scan('sp500_31Dec59-30Dec16.txt')
# To shorten the operation time, 1/20 of the data is used.
sp500_31_0.1 = sp500_31[seq(1, length(sp500_31), 20)]
Case_2 = ts(sp500_31_0.1)
plot(Case_2, xlab = 'Time', ylab = 'Closing Price of
     the SP500')

# Apply the HP filter

Case_2.hp = hpfilter(Case_2)
plot(Case_2.hp)