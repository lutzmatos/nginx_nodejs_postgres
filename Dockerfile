FROM node:carbon

# Partir desta linha a configuração ocorrerá neste diretório no contêiner
WORKDIR /usr/src/app

# Copiar o package.json para a pasta de trabalho (WORKDIR)
COPY crud-node-postgres/package*.json ./
# Vamos instalar as dependências deste package.json
RUN npm install

# Vamos copiar a pasta do projeto para a pasta de trabalho (WORKDIR)
COPY ./crud-node-postgres/ .

# Instalação do nodemon
RUN npm install -g nodemon

# Instalação do bower
RUN npm install -g bower
# Cópia do pacote de dependências do bower
COPY crud-node-postgres/bower*.json ./
# Instalação das dependências do bower
RUN bower install --allow-root

# Porta de acesso ao host
EXPOSE 3090

# Comando que rodará o servidor
CMD [ "node", "server.js" ]