FROM ghcr.io/runatlantis/atlantis:latest

ENV TFVER=1.3.6
ENV TGVER=0.42.5
ENV TFSEC=1.28.1

RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/v${TGVER}/terragrunt_linux_amd64
RUN wget https://releases.hashicorp.com/terraform/${TFVER}/terraform_${TFVER}_linux_amd64.zip
RUN wget https://github.com/aquasecurity/tfsec/releases/download/v${TFSEC}/tfsec-checkgen-linux-amd64

RUN unzip terraform_${TFVER}_linux_amd64.zip
RUN cp terragrunt_linux_amd64 /usr/local/bin/terragrunt
RUN cp terraform /usr/local/bin/terraform
RUN cp tfsec-checkgen-linux-amd64 /usr/local/bin/tfsec
