FROM node:latest
LABEL description="Plato Documentation."
RUN mkdir docs
COPY . docs
RUN npm install -g docsify-cli@latest
EXPOSE 3000/tcp
ENTRYPOINT docsify serve docs
