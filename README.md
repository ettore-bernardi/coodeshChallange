# Projeto Space Flight News Api
Neste projeto foi desenvolvida um RestAPI que utiliza os dados do projeto Space Flight News API.

[Apresentação do desafio](https://www.loom.com/share/69e39728dd9445c6bfad6e807e4c51b9)

## Tecnologias usadas

* Ruby: 2.7.3
* Rails: 6.0.4
* PostgreSQL

## Setup
#### No console:
```console
# clone o repositório
git clone git@github.com:ettore-bernardi/coodeshChallange.git

# entre no diretorio da API
cd coodeshChallange

# rode a instalação do bundle
bundle

# crie o banco de dados e faça as migrações
rake db:create db:migrate

# inicie o servidor
rails server
```
## Populando o banco
```
#inicie o console rails
rails c

#rode o script que grava todos os artigos do Space Flight API no banco da aplicação
::SpaceFlight::ArticleService.new.create_articles_on_db
```

## Usando
#### Endpoints:
- `[GET]/:` Retorna um Status: 200 e uma Mensagem "Back-end Challenge 2021 🏅 - Space Flight News"
- `[GET]/articles/:` Lista os 10 ultimos artigos da base de dados
- `[GET]/articles?limit=X` Subtituir o X pelo numero de artigos que deseja listar ou por "all" para listar todos (pode causar lentidão)
- `[GET]/articles/{id}:` Retorna apenas um artigo
- `[POST]/articles/:` Adiciona um artigo
- `[PUT]/articles/{id}:` Atualiza um artigo baseado no `id`
- `[DELETE]/articles/{id}:` Remove um artigo baseado no `id`

>  Este é um desafio por [Coodesh](https://coodesh.com/)

# English
In this project i developed a RestAPI using data from the Space Flight News API

## Technologies

* Ruby: 2.7.3
* Rails: 6.0.4
* PostgreSQL

## Setup
#### In the console:
```console
# clone the repo
git clone git@github.com:ettore-bernardi/coodeshChallange.git

# go to directory
cd coodeshChallange

# do the bundle instalation
bundle

# create the database and migrations
rake db:create db:migrate

# start the server
rails server
```
## Populating the DB
```
#Start the rails console
rails c

#run the script that writhe all articles from Space Flight API to the application database 
::SpaceFlight::ArticleService.new.create_articles_on_db
```

## Using
#### Endpoints:
- `[GET]/:` Return a Status: 200 and a message "Back-end Challenge 2021 🏅 - Space Flight News"
- `[GET]/articles/:` List 10 last articles from the database
- `[GET]/articles?limit=X` Replace X with the number of articles you want to list or with "all" to list all articles (may be slow)
- `[GET]/articles/{id}:` Return one article based on `id`
- `[POST]/articles/:` Create one article
- `[PUT]/articles/{id}:` Update one article based on `id`
- `[DELETE]/articles/{id}:` Delete one article based on `id`

>  This is a challenge by [Coodesh](https://coodesh.com/)