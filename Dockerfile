ARG TF_VERSION

FROM hashicorp/terraform:${TF_VERSION}

RUN apk add --no-cache aws-cli

RUN aws --version