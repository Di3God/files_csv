
library(readr)
library(tseries)
library(dplyr)

BPCCTrimestral <- read_csv("Trimestrales-20221023-174921.csv", 
                           col_names = FALSE )
BPCCTrimestral <- BPCCTrimestral[2:nrow(BPCCTrimestral),2]
names(BPCCTrimestral) <- "BPTri"
BPCCTrimestral = ts(BPCCTrimestral, start = c(2012,1), frequency = 4)
balanzapridif = diff(BPCCTrimestral)

modelo.arma44=arma(balanzapridif,order=c(4,4))
resumen =summary(modelo.arma44)
resumen$aic
