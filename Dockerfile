FROM mesosphere/aws-cli

COPY . /scripts

WORKDIR /scripts

RUN apk update && apk add --no-cache bash jq openssl vim && \
    chmod +x *.sh

ENTRYPOINT [ "/bin/bash" ]