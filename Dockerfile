# Use uma imagem base oficial do Node.js
FROM node:20-alpine3.20

# Defina o diretório de trabalho no contêiner
WORKDIR /usr/src/app

# Copie os arquivos package.json e package-lock.json
COPY package*.json ./

# Instale as dependências
RUN npm i

# Copie o restante do código da aplicação
COPY . .

RUN npm run build

RUN npx prisma generate

# Exponha a porta em que a aplicação vai rodar
EXPOSE 10000

# Comando para iniciar a aplicação
CMD ["npm", "run", "start"]

# Usa a imagem oficial do PostgreSQL como base
FROM bitnami/postgresql:latest

# Define variáveis de ambiente para inicializar o banco de dados
ENV POSTGRES_DB=todo
ENV POSTGRES_USER=docker
ENV POSTGRES_PASSWORD=docker

# Copia arquivos de inicialização SQL ou scripts de shell para a pasta de inicialização do PostgreSQL
# (opcional - se você tiver scripts de inicialização personalizados)
# COPY ./init.sql /docker-entrypoint-initdb.d/

# Exponha a porta padrão do PostgreSQL
EXPOSE 5432

# Define o comando padrão para executar quando o container iniciar
CMD ["postgres"]
