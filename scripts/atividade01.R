# Nesse caso, vamos usar um banco de dados salvo na nossa máquina.
# com R e outras linguagens de prog., precisamos passar o caminho do banco de dados pra poder carregar
# o caminho vai ser algo que se parece com isso "Documentos/Arquivos/dados.csv".
# Usando Windows, vc pode clicar com o botao direito e ir em propriedades

# No meu caso, meus dados estao salvos em .../aula_R/dados/

chagas <- read.csv("dados/chagas_00_19.csv")
# Importante!! Eu consegui usar um caminho encurtado pra carregar os meus dados
# pois estou usando um projeto do R. Mais uma vantagem de usar um projeto!!!

# Alternativamente, eu poderia fazer isso aqui.
# Esse é o caminho completo para o mesmo arquivo. Os dois métodos vao dar o mesmo resultado!!!
# No caso de vocês, pode ser que vcs precisem usar o caminho completo
chagas <- read.csv("/Users/jps89/Documents/GEMINI/aula_R/dados/chagas_00_19.csv")