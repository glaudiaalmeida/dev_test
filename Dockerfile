#TODO Configure o Dockerfile
# Use uma imagem base oficial do Node.js
FROM node:18

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos necessários para o container
COPY package*.json ./
COPY tsconfig.json ./
COPY src ./src

# Instala as dependências
RUN npm install

# Copiar todos os arquivos do projeto para dentro do container
COPY . .

# Compila o TypeScript
RUN npm run build

# Definir a porta que a aplicação vai expor
EXPOSE 3000

# Define o comando para iniciar a aplicação
CMD ["npm", "start"]
