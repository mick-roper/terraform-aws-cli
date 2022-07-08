ARG TF_VERSION='latest'

FROM --platform=linux/amd64 hashicorp/terraform:${TF_VERSION}

RUN export PATH=/usr/local/bin:$PATH
RUN apk --no-cache add curl gnupg

WORKDIR /usr/local/aws-cli

RUN  curl -o awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip

COPY ./aws-cli.pub .
RUN gpg --import aws-cli.pub
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip.sig -o awscliv2.sig 
RUN ls -a
RUN gpg --verify awscliv2.sig awscliv2.zip

RUN unzip ./awscliv2.zip
RUN ./aws/install
RUN /usr/local/bin/aws --version