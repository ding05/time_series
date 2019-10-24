data(co2)

d = decompose(co2)
trend = d$trend
season = diff(co2)
season = season[7: 462]

x1 = c(1: 468)
x3 = x1^2

trend.ols = lm(trend ~ x1 + x3)
summary(trend.ols)
co2_trend_p = predict(trend.ols)
ts1 = ts(co2_trend_p, frequency = 12, start = 1959)
plot(ts1, main = 'Estimated Trend Component')
summary(ts1)
sd(ts1)

ssp = spectrum(season)  
per = 1 / ssp$freq[ssp$spec == max(ssp$spec)]
season.ols = lm(season ~ sin(2 * pi / per * x1) +
                  cos(2 * pi / per * x1))
co2_season_p = predict(season.ols)
summary(season.ols)
ts2 = ts(co2_season_p, frequency = 12, start = 1959)
plot(ts2, main = 'Estimated Seasonal Component')
summary(ts2)
sd(ts2)