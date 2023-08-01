FROM node:17.1.0

WORKDIR /app/medusa

COPY package.json .

USER 10014

RUN npm install --loglevel=error

COPY . .

ENTRYPOINT ["npx", "medusa", "develop"]