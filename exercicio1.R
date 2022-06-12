  library(xlsx)  
  library(ggplot2) 
  
  datas <- read.xlsx("ResiduosPerCapita.xlsx", sheetIndex = 1, startRow = 12, endRow = 43)

  paises = c(datas[2,1],datas[30,1],datas[29,1])

  quantidade <- as.double(c(datas[2,2],datas[30,2],datas[29,2],datas[2,3],datas[30,3],datas[29,3]))
  Anos <- rep(c("2004","2018"),times=c(3,3))
  df <- data.frame(paises,Anos,quantidade)
  
  residuos = c(datas[2,2],datas[2,3],datas[30,2])

  ggplot(data= df, aes(x = paises,y=quantidade,fill=Anos))+
  geom_bar(stat='identity', position = 'dodge', color = 'black', alpha = 0.6) + 
    labs(title="Residuos per capita", y = "Quantidade", x = "Paises") + 
    geom_text(aes(label=quantidade), position=position_dodge(width=0.9), vjust=-0.25)+
    scale_fill_manual(values=c("#5BB2FF", "#FFEF4F"))+
    theme_light()
 
  