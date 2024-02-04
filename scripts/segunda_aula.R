# Carregando o pacote tidyverse para manipulação e visualização de dados
library(tidyverse)

# Leitura do arquivo CSV contendo dados sobre Chagas, utilizando um caminho relativo
# Isso é possível devido ao uso de um projeto R, o que facilita a organização e o acesso aos arquivos
chagas <- read.csv("dados/chagas_00_19.csv")

# Alternativa para leitura do arquivo usando caminho absoluto
# Útil caso o caminho relativo não funcione ou em ambientes fora de um projeto R
# chagas <- read.csv("/Users/jps89/Documents/GEMINI/aula_R/dados/chagas_00_19.csv")


# Limpeza dos dados -------------------------------------------------------


## IDADE -------------------------------------------------------------------


# Demonstração de operações básicas com vetores
idade <- c(20, 25, 30, 43, 22, 13)
# Adicionando 1 a cada elemento do vetor 'idade'
idade + 1

# Tentativa de adicionar 1 a um vetor de texto, o que gera erro pois a operação não é válida para strings
idade_texto <- c("20", "25", "30", "43", "22", "13")
# idade_texto + 1 # Essa linha resultaria em erro

# Explorando os dados do dataset 'chagas'
# Obtendo os nomes das colunas do dataframe
colnames(chagas)

# Criando uma tabela de frequência para a variável 'NU_IDADE'
table(chagas$NU_IDADE)

# Gerando um resumo estatístico para a variável 'NU_ANO', incluindo mínimo, média, máximo e quartis
summary(chagas$NU_ANO)

# Visualizando as dimensões do dataframe 'chagas', mostrando o número de linhas e colunas
dim(chagas)

# Transformação e categorização de dados
# Problema: 'NU_IDADE' é uma string com formato especial (ex: A020), e queremos convertê-la para numérico
# Solução: Remover o primeiro caractere e converter o resultado para numérico

# Usando substr() para extrair parte da string, excluindo o primeiro caractere
idade_texto <- substr(chagas$NU_IDADE, 2, 4)
idade_numerica <- as.numeric(idade_texto)  # Convertendo o resultado para numérico

# Identificando o tipo de idade (Ano, Mês, Dia) com base no primeiro caractere
tipo_idade <- substr(chagas$NU_IDADE, 1, 1)

# Usando table() para ver a frequência dos diferentes tipos de idade
table(tipo_idade)

# Ordenando as frequências com sort() para melhor visualização
sort(table(tipo_idade))

# Aplicando transformações com tidyverse para limpeza e manipulação dos dados
chagas <- chagas %>%
  mutate(
    idade_texto = substr(NU_IDADE, 2, 4),
    idade_numerica = as.numeric(idade_texto),
    tipo_idade = substr(NU_IDADE, 1, 1),
    # Convertendo idade para anos considerando o tipo (A, M, D)
    idade_anos = case_when(
      tipo_idade == "A" ~ idade_numerica,
      tipo_idade == "M" ~ idade_numerica / 12,
      tipo_idade == "D" ~ idade_numerica / 365
    )
  )


## Sexo --------------------------------------------------------------------

# Trabalhando com a variável 'sexo'
# Identificando a coluna que representa o sexo no dataset
colnames(chagas)
# A coluna de interesse é 'CS_SEXO'

# Verificando as categorias existentes na variável 'sexo'
table(chagas$CS_SEXO)

# Recodificando a variável 'sexo' para categorias mais descritivas e adicionando uma nova coluna ao dataframe
chagas <- chagas %>%
  mutate(
    sexo_categoria = recode(CS_SEXO, "F" = "Feminino", "M" = "Masculino", "I" = "Indeterminado"),
    banco = "Chagas DataSUS 2000-2019"  # Adicionando uma coluna constante para identificar a fonte dos dados
  )
