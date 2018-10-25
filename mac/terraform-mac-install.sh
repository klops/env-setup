# lift mostly from https://github.com/pinterb/install-terraform.sh
#!/bin/bash

#https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_darwin_amd64.zip

export TERRAFORM_VERSION="0.11.10"
export INSTALL_DIR="/usr/local/bin"
export SYSTEM="darwin"
export DOWNLOAD_DIR="/tmp"
export DOWNLOAD_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${SYSTEM}_amd64.zip"
export DOWNLOADED_FILE="$DOWNLOAD_DIR/terraform.zip"

prerequisites() {
  local curl_cmd=`which curl`
  local unzip_cmd=`which unzip`

  if [ -z "$curl_cmd" ]; then
    error "curl does not appear to be installed. Please install and re-run this script."
    exit 1
  fi

  if [ -z "$unzip_cmd" ]; then
    error "unzip does not appear to be installed. Please install and re-run this script."
    exit 1
  fi
}

# Install Terraform
install_terraform() {
  echo ""
  echo "Downloading Terraform zip'd binary"
  curl -o "$DOWNLOADED_FILE" "$DOWNLOAD_URL"

  echo ""
  echo "Extracting Terraform executable"
  unzip "$DOWNLOADED_FILE" -d "$INSTALL_DIR"
  
  rm "$DOWNLOADED_FILE"
}

main() {
  prerequisites
  install_terraform
}

main
