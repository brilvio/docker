#!/bin/bash
# Script para permitir portas privilegiadas (80, 443) no Docker rootless
# Requer sudo

echo "Configurando sistema para permitir portas não privilegiadas começando em 80..."

# Adicionar configuração ao sysctl.conf se não existir
if ! grep -q "net.ipv4.ip_unprivileged_port_start=80" /etc/sysctl.conf; then
    echo "Adicionando net.ipv4.ip_unprivileged_port_start=80 ao /etc/sysctl.conf..."
    sudo bash -c 'echo "net.ipv4.ip_unprivileged_port_start=80" >> /etc/sysctl.conf'
fi

# Aplicar configuração imediatamente
echo "Aplicando configuração..."
sudo sysctl -p

echo ""
echo "✅ Configuração aplicada!"
echo ""
echo "Reinicie o Docker rootless para aplicar as mudanças:"
echo "  systemctl --user restart docker"
echo ""
echo "Ou reinicie o serviço do Docker se estiver usando systemd:"
echo "  sudo systemctl restart docker"
