sp = scan('sp500_31Dec59-30Dec16.txt')
lgsp = log(sp)
drift_sp = (sp[14349] - sp[1]) / (length(sp) - 1)
drift_sp
vol_sp = sd(diff(sp))
vol_sp
drift_lgsp = (lgsp[14349] - lgsp[1]) / (length(lgsp)
              - 1)
drift_lgsp
vol_lgsp = sd(diff(lgsp))
vol_lgsp