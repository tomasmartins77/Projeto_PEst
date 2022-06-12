library(ggplot2)

seed = 772
m = 1350
n <- seq(100, 2500, by = 100)
lambda = 3.54
lambda_c = 0.09
gama = 0.93

set.seed(seed)

soma = 0
soma_c = 0
Ma = c()
Ma_c = c()
a = qnorm((1+gama)/2)

for (i in 1:25){
  for (j in 1:m){
    data = rexp(n[i],lambda)    
    data_aux = rexp(n[i]*0.2,lambda_c)
    
    media = mean(data)
    
    inf = 1 - (a/sqrt(n[i]))/media
    sup = 1 + (a/sqrt(n[i]))/media
    
    amplitude = abs(sup - inf)
    soma = soma + amplitude
    
    data_c = data
    
    for (j in 1:n[i]*0.2){
      data_c[j] = data_aux[j]    
    }
    
      media_c = mean(data_c)
      
      inf_c = 1 - (a/sqrt(n[i]))/media_c
      sup_c = 1 + (a/sqrt(n[i]))/media_c
      
      amplitude_c = abs(sup_c - inf_c)
      soma_c = soma_c + amplitude_c
    
  }
  
  media2 = soma/m
  media_c = soma_c/m
  
  Ma[i] = media2
  Ma_c[i] = media_c
  soma = 0
  soma_c = 0
}

df = data.frame(Ma,Ma_c,n, data_aux, data_c, data)

ggplot(df) +
  geom_line(aes(x=n,y=Ma,color = "Nao Contaminadas"),size = 1) +
  geom_line(aes(x=n,y=Ma_c, color = "Contaminadas"),size = 1) +
  labs(title="amplitude do intervalo de confianca de amostras numa distribuicao exponencial",
       x="intervalo de amostras",
       y="amplitudes do intervalo de confianca")+
  theme_classic()+
  scale_color_manual(name = "Amostras",
                     values = c("Nao Contaminadas" = "#00C6EA", "Contaminadas" = "#F60000"))

