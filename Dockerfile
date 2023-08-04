FROM node:18-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN addgroup -g 10014 choreo && \
    adduser  --disabled-password --uid 10014 --ingroup choreo choreouser

USER 10014

RUN ls /home/
RUN ls /home/choreouser

ENTRYPOINT ["node", "index.js"]