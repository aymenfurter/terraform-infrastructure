FROM ubuntu:20.04

ARG TERRAFORM_VERSION=1.2.2
ARG KUBECTL_VERSION=1.25.3
ARG HELM_VERSION=3.9.3

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    curl \
    unzip \
    wget \
    git \
    iputils-ping \
    jq \
    lsb-release \
    openssh-client \
    software-properties-common

RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip
RUN unzip terraform.zip  -d /usr/local/bin  
RUN rm terraform.zip

RUN wget https://storage.googleapis.com/kubernetes-release/release/v$KUBECTL_VERSION/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

# Installing Helm
RUN wget https://get.helm.sh/helm-v$HELM_VERSION-linux-amd64.tar.gz -O /tmp/helm-v$HELM_VERSION-linux-amd64.tar.gz && \
    tar -zxvf /tmp/helm-v$HELM_VERSION-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm
    
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Can be 'linux-x64', 'linux-arm64', 'linux-arm', 'rhel.6-x64'.
ENV TARGETARCH=linux-x64

WORKDIR /azp

COPY ./start.sh .
RUN chmod +x start.sh

ENTRYPOINT [ "/azp/start.sh" ]