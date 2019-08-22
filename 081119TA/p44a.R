library(pracma)
sp = scan('sp500_31Dec59-30Dec16.txt')
sp_1 = sp[2:14349]
sp_c = (sp[2:14349] - sp[1:14348]) / sp[1:14348]
ts_sp_c = ts(sp_c, frequency = 251, start = 1960)
plot(ts_sp_c, xlab = 'Year', ylab = 'Daily Growth
     Rates')
avg_sp_c = movavg(x = sp_c, n = 50)
ts_avg_sp_c = ts(avg_sp_c[50:14298], frequency = 250,
                 start = 1960)
plot(ts_avg_sp_c, xlab = 'Year', ylab = 'Average Growth
     Rates in 50 Days')