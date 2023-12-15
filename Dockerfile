FROM node:alpine
RUN apk update && apk add --no-cache bash
WORKDIR /usr/src/opt
COPY package*.json ./
RUN npm install
COPY . .
RUN adduser -D app && chown -R app /usr/src/opt
USER app
EXPOSE 3000
CMD ["node", "app.js","-D"]
