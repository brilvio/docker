# Nginx Proxy Manager

Gerenciador de proxy reverso com interface web para gerenciar facilmente proxies, SSL e domínios.

## ⚙️ Configuração Inicial (Docker Rootless)

Se você estiver usando Docker rootless e receber erro de permissão nas portas 80/443, execute:

```bash
./fix-rootless-ports.sh
```

Ou configure manualmente:

```bash
sudo bash -c 'echo "net.ipv4.ip_unprivileged_port_start=80" >> /etc/sysctl.conf'
sudo sysctl -p
systemctl --user restart docker
```

## Inicialização

```bash
docker compose up -d
```

## Acesso

- Interface Web: http://localhost:81
- Credenciais padrão:
  - Email: `admin@example.com`
  - Senha: `changeme`

**⚠️ IMPORTANTE: Altere a senha no primeiro acesso!**

## Portas

- `80`: HTTP
- `81`: Interface de gerenciamento
- `443`: HTTPS

## Estrutura de Pastas

- `data/`: Dados do banco de dados e configurações
- `letsencrypt/`: Certificados SSL do Let's Encrypt

## Documentação

- [Nginx Proxy Manager GitHub](https://github.com/NginxProxyManager/nginx-proxy-manager)
- [Documentação Oficial](https://nginxproxymanager.com/)
