library(xlsx)  
library(ggplot2)

datas <- read.xlsx("QualidadeARO3.xlsx", sheetIndex = 1)
values = c(1:8784)
Estações = rep(c("Antas.Espinho","Sobreiras.Porto"),c(8784,8784))
Antas_Espinho = as.numeric(c(datas[,1]))
Sobreiras_Porto = as.numeric(c(datas[,9]))

valores = rep(c(Antas_Espinho,Sobreiras_Porto))
df = data.frame(valores, Estações)


ggplot(df, mapping = aes(valores, group = Estações, color = Estações,fill = Estações)) + 
  geom_histogram(position = 'identity', bins = 148, alpha = 0.5) + scale_color_brewer(palette="Dark2")+
  scale_fill_brewer(palette="Dark2") + 
  labs(title = "níveis de ozono na atmosfera em duas estações",x="níveis de ozono")+
  theme_classic()

