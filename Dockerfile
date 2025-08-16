FROM node:slim

WORKDIR /tmp

COPY . .

USER 10001 

RUN npm install

CMD ["node", "index.js"]
