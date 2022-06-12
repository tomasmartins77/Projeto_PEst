library(ggplot2)
library(gridExtra)

n1 <- 3
n2 <- 28
n3 <- 87
seed <- 1334
amostras <- 1340
inf <- 3
sup <- 7

set.seed(seed)

E = (inf+sup)/2
V = ((sup-inf)^2)/12

vetor1 = c(0)
vetor2 = c(0)
vetor3 = c(0)
for (i in 1:amostras){
  data1 = runif(n1, inf, sup)
  data2 = runif(n2,inf,sup)
  data3 = runif(n3,inf,sup)
  media1 = mean(data1)
  media2 = mean(data2)
  media3 = mean(data3)
  
  vetor1[i] = media1
  vetor2[i] = media2
  vetor3[i] = media3
}

df = data.frame(vetor1,vetor2,vetor3)

plot1 <- ggplot(data=df) + 
  geom_histogram(aes(y = after_stat(density), x = vetor1),bins = 30,color="black", fill = "#E5F91C",alpha=0.5)+
  stat_function(fun = dnorm, args=list(mean = E,sd = sqrt(V/n1)), size =1)+
  labs(x = "media das distribuicoes para o valor 3")+
  theme_light()

plot2 <- ggplot(data=df) + 
  geom_histogram(aes(y = after_stat(density), x = vetor2),bins = 30,color="black", fill = "#E5F91C",alpha=0.5)+
  stat_function(fun = dnorm, args=list(mean = E,sd = sqrt(V/n2)), size =1)+
  labs(x = "media das distribuicoes para o valor 28")+
  theme_light()

plot3 <- ggplot(data=df) + 
  geom_histogram(aes(y = after_stat(density), x = vetor3),bins = 30,color="black", fill = "#E5F91C",alpha=0.5)+
  stat_function(fun = dnorm, args=list(mean = E,sd = sqrt(V/n3)), size =1)+
  labs(x = "media das distribuicoes para o valor 87")+
  theme_light()

grid.arrange(plot1,plot2,plot3,ncol=3,top="Graficos de densidade relacionado com a media das distribuicoes")
