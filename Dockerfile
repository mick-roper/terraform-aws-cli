ARG TF_VERSION="latest"

FROM hashicorp/terraform:${TF_VERSION}

RUN apk add --no-cache python3 py3-pip
RUN pip3 install --upgrade pip --break-system-packages
RUN pip3 install --no-cache-dir awscli --break-system-packages
RUN rm -rf /var/cache/apk/*

RUN aws --version