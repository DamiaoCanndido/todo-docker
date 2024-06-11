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
