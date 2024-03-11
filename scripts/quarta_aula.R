

pacientes <- data.frame(
  nome = c("João", "Maria", "José", "Ana", "Pedro", "Luana", "Carlos", "Beatriz", "Paulo", "Fernanda",
           "Rafael", "Aline", "Roberto", "Camila", "Márcio", "Isabela", "Lucas", "Sofia", "Gustavo", "Juliana",
           "Marcelo", "Mariana", "Diego", "Carolina", "Rodrigo", "Tatiane", "André", "Bianca", "Felipe", "Vitória"),
  idade = sample(18:80, 30, replace = TRUE),
  sexo = sample(c("M", "F"), 30, replace = TRUE),
  altura_cm = sample(150:190, 30, replace = TRUE),
  peso_kg = sample(50:100, 30, replace = TRUE),
  pressao_sistolica = sample(100:160, 30, replace = TRUE),
  pressao_diastolica = sample(60:100, 30, replace = TRUE),
  temperatura_corporal = runif(30, 36.0, 37.5)
)

pacientes

banco <- data.frame(nome = c("Leticia", "Giulie", "Re", "Joao"),
                    idade = c(25, 13, 32, 55),
                    cargo = c("Doutora", "Mestranda", "Mestranda", "Pos-doc"),
                    cargo_fator = factor(c("Doutora", "Mestranda", "Mestranda", "Pos-doc"),
                                          levels= c("Pos-doc", "Doutora", "Mestranda")),
                    
                    ID = 1:nrow(banco))

sample(1:50, 30, replace = TRUE)

# Bootstraping 

library(tidyverse)

banco %>% 
  ggplot(aes(x=cargo_fator, y=idade))+
  geom_col()

# mode
# class

# Avaliando o tipo das variaveis
class(pacientes) # na func class, voce precisa especificar a variavel

# Jeitos diferentes de fazer a mesma coisa
class(pacientes$sexo) # "character" - variavel textual - R Básico

pacientes$sexo
pacientes[, "sexo"]
pacientes["sexo"]
pacientes %>% 
  select(sexo) %>% 
  pull()

pacientes[5, "sexo"]

pacientes %>% 
  select(sexo) %>% 
  pull(sexo) %>% 
  class()



c(25, 13, 32, 55) # Vetor (vector), lista(list)
matrix(c(c("Leticia", "Giulie", "Re", "Joao"),
         c("Leticia", "Giulie", "Re", "Joao")))


lista <- list(
  idade=c(25, 13, 32, 55, 33),
  nome=c("Leticia", "Giulie", "Re", "Joao", "Joao")
)

# mean(nome_da_variavel)
resultados <- list(media=mean(20:50),
                   mediana=median(20:50))
resultados$media
resultados$mediana

lista$idade
lista[[1]]


lista$idade[1]
lista$idade[c(1,2,3)]
lista$idade[lista$idade > 25]

teste <- lista$idade > 25

lista$idade[teste]
lista$idade[lista$idade > 25]
teste

# media
mean(pacientes$idade)
# Resumo
summary(pacientes)
