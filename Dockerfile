FROM ghcr.io/runatlantis/atlantis:latest

ENV TG_VERSION=0.39.2
ENV TFSEC_VERSION=1.28.1
ENV TG_ATL_CONF_VERSION=1.16.0

ENV TG_ARCH=linux_amd64
ENV TG_URL=https://github.com/gruntwork-io/terragrunt/releases/download/v${TG_VERSION}/terragrunt_${TG_ARCH}

ENV TFSEC_ARCH=linux-amd64
ENV TFSEC_URL=https://github.com/aquasecurity/tfsec/releases/download/v${TFSEC_VERSION}/tfsec-checkgen-${TFSEC_ARCH}

ENV TG_ATL_CONF_ARCH=linux_amd64
ENV TG_ATL_CONF_URL=https://github.com/transcend-io/terragrunt-atlantis-config/releases/download/v${TG_ATL_CONF_VERSION}/terragrunt-atlantis-config_${TG_ATL_CONF_VERSION}_${TG_ATL_CONF_ARCH}.tar.gz

RUN apk add --no-cache aws-cli

RUN wget -qO /usr/local/bin/terragrunt ${TG_URL}

RUN wget -qO /usr/local/bin/tfsec ${TFSEC_URL}

RUN wget -qO tf_atl_conf.tar.gz ${TG_ATL_CONF_URL}
RUN tar xf tf_atl_conf.tar.gz
RUN mv terragrunt-atlantis-config_${TG_ATL_CONF_VERSION}_linux_amd64 terragrunt-atlantis-config
RUN mv terragrunt-atlantis-config /usr/local/bin/terragrunt-atlantis-config

RUN chmod +x /usr/local/bin/terragrunt /usr/local/bin/tfsec /usr/local/bin/terragrunt-atlantis-config
