co2_t = co2[7: 462]
co2_t = co2_t - ts1 - ts2
plot(co2_t, main = 'Residuals after Removing the Estimated Trend
     and Seasonal Components', ylab = 'Residuals')