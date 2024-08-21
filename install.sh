#!/bin/bash

# Atualiza a lista de pacotes e faz upgrade dos pacotes instalados
sudo apt update && sudo apt upgrade -y

# Baixa o arquivo .deb do RustDesk
wget https://github.com/rustdesk/rustdesk/releases/download/1.3.0/rustdesk-1.3.0-x86_64.deb -O /tmp/rustdesk-1.3.0-x86_64.deb

# Tenta instalar o pacote .deb usando dpkg
sudo dpkg -i /tmp/rustdesk-1.3.0-x86_64.deb

# Verifica se houve algum erro durante a instalação
if [ $? -ne 0 ]; then
  # Instala as dependências faltantes
  sudo apt-get install -f -y
  
  # Tenta instalar novamente o pacote .deb
  sudo dpkg -i /tmp/rustdesk-1.3.0-x86_64.deb
fi

# Limpeza do arquivo .deb baixado
rm /tmp/rustdesk-1.3.0-x86_64.deb

echo "Instalação do RustDesk finalizada."
