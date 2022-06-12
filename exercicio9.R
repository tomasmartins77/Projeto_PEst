library(ggplot2)

seed = 284
m = 1000
n <- seq(100, 5000, by = 100)
lambda = 1.27
gama = 0.94

set.seed(seed)

soma = 0
Ma = c()
a = qnorm((1+gama)/2)


for (i in 1:50){
  for (j in 1:m){
    data = rexp(n[i],lambda)    

    media = mean(data)
    
    inf = (1 - a/sqrt(n[i]))/media
    sup = (1 + a/sqrt(n[i]))/media
    amplitude = abs(sup - inf)
    soma = soma + amplitude
  }
  media2 = soma/m
  Ma[i] = media2
  soma = 0
}

df = data.frame(Ma,n)

ggplot(df,aes(x=n,y=Ma),color = "red",fill = "black") +
  geom_line(size = 1, color = "#00C6EA") +
  labs(title="amplitude do intervalo de confianca de amostras numa distribuicao exponencial",
       x="intervalo de amostras",
       y="amplitudes do intervalo de confianca")+
  theme_classic()
