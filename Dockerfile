FROM node:12.18.1-alpine

LABEL version="1.0.0"
LABEL repository="https://github.com/ImJustChew/preact-action"
LABEL homepage="https://github.com/ImJustChew/preact-action"
LABEL maintainer="Chew Tzi Hwee <chewtzihwee@gmail.com>"

LABEL com.github.actions.name="GitHub Action for Preact"
LABEL com.github.actions.description="Wraps the preact-cli to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

RUN apk --update add openjdk8-jre
RUN apk add --no-cache git

RUN npm install -g preact-cli

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
