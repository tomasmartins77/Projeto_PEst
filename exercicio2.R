library(xlsx)  
library(ggplot2)

datas <- read.xlsx("EsperancaVida.xlsx", sheetIndex = 1, startRow = 9, endRow = 70)

Anos = c(1:18)
valores_eslovenia_H = c(1:18)
valores_polonia_H = c(1:18)
valores_noruega_H = c(1:18)
valores_eslovenia_M = c(1:18)
valores_polonia_M = c(1:18)
valores_noruega_M = c(1:18)
j = 1
i = 43
while(i < 61){
  Anos[j] = datas[i,"NA."]
  valores_eslovenia_H[j] = datas[i,"SI...Eslovénia.1"]
  valores_polonia_H[j] = datas[i,"PL...Polónia.1"]
  valores_noruega_H[j] = datas[i,"NO...Noruega.1"]
  valores_eslovenia_M[j] = datas[i,"SI...Eslovénia.2"]
  valores_polonia_M[j] = datas[i,"PL...Polónia.2"]
  valores_noruega_M[j] = datas[i,"NO...Noruega.2"]
  i = i+1
  j = j+1
}

Anos = rep(Anos,6)
Paises = rep(c("Eslovenia","Polonia","Noruega"),times = c(18,18,18))
Paises = rep(Paises,2)
Sexo = rep(c("Male","Female"),c(54,54))
Esperanca_vida = c(valores_eslovenia_H,valores_polonia_H,valores_noruega_H,valores_eslovenia_M,valores_polonia_M,valores_noruega_M)

df <- data.frame(Anos,Esperanca_vida,Paises, Sexo)

ggplot(df , aes(Anos, Esperanca_vida, color = Paises, linetype = Sexo)) + 
  geom_line(size = 1) + labs(title = "Esperança de vida em anos",y = "Idade", x = "Anos")+
  theme_classic()+
  scale_color_manual(values=c("#5BB2FF","#00D11C", "#F54317"))
