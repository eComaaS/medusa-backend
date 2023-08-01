FROM node:17.1.0

WORKDIR /app/medusa

COPY package.json .

RUN addgroup -g 10014 choreo && \
    adduser  --disabled-password  --no-create-home --uid 10014 --ingroup choreo choreouser

USER 10014

RUN npm install --loglevel=error

COPY . .

ENTRYPOINT ["npx", "medusa", "develop"]