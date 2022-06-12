library(xlsx)  
library(ggplot2)
library(ggthemes)
datas <- read.xlsx("Utentes.xlsx", sheetIndex = 1)

IMC = as.numeric(c(datas[,3]))
TAD = as.numeric(c(datas[,4]))

df = data.frame(IMC,TAD)

ggplot(df, aes(IMC,TAD)) + geom_point(color = "#3D3D3D") +
  geom_smooth(formula = y ~ x,method = "lm", color = "#CB0000") + 
  labs(title = "Relação TAD/IMC") +
  theme_tufte()



