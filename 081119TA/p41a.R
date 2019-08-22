sp500_31 = scan('sp500_31Dec59-30Dec16.txt')
sp500_31 = ts(sp500_31, frequency = 251, start = 1960)
plot(sp500_31, xlab = 'Year', ylab = 'Closing Price of
     the SP500')