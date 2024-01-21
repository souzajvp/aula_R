install.packages("tidyverse")

# Preparo inicial ------------------------------------------------------

# Carregando pacotes
library(palmerpenguins) # banco de dados de pinguins 
library(tidyverse) # pacote para analisar dados no R

# carrego meu banco dados
data("penguins")

data <- penguins_raw

## Exploração dos dados ----------------------------------------------------

colnames(data) # avaliando as colunas do banco


# colunas com espaços
data$studyName
data$`Delta 15 N (o/oo)`

data <- data %>% #pipe |> # ctrl + shift + m %>%
  rename(delta = `Delta 15 N (o/oo)`,
         cu_len = `Culmen Length (mm)`,
         weight = `Body Mass (g)`)  # nome novo = nome velho

# == "comparação" igual a xxx 
# != "comparação" diferente de, exlcui a caracteristica
# > ou >=
# < ou <=

## Traga pra mim tudo que NAO FOR IGUAL a Adelie
data %>% 
  filter(Species != "Adelie Penguin (Pygoscelis adeliae)") %>%
  group_by(Species) %>% 
  summarize(n=n())

## Traga pra mim tudo que for igual a Adelie
data %>% 
  filter(Species == "Adelie Penguin (Pygoscelis adeliae)") %>%
  group_by(Species) %>% 
  summarize(n=n())

data %>% 
  filter(weight >= 3500)

data %>% 
  filter(weight >= 5000)

# faixa entre 3500 e 5000

data %>% 
  filter(weight > 3500 & weight <= 5000 & Species == "Adelie Penguin (Pygoscelis adeliae)")

data %>% 
  filter(weight == 3000)

# %in%

data %>% 
  filter(weight %in% c(3000, 3500, 4000, 4500))

# Especie seja adelie ou especie seja chinstrap
data %>% 
  filter(Species == "Adelie Penguin (Pygoscelis adeliae)" |
           Species == "Chinstrap penguin (Pygoscelis antarctica)")

data %>% 
  filter((weight > 3500 & weight <= 5000) | 
           Species == "Adelie Penguin (Pygoscelis adeliae)")


