FROM node:17.1.0

WORKDIR /app/medusa

COPY package.json .

USER 10014

RUN npm install -g npm@latest

RUN npm install -g @medusajs/medusa-cli@latest

RUN npm install --loglevel=error

COPY . .

ENTRYPOINT ["medusa", "develop"]