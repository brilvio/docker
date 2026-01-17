# Nginx Proxy Manager

Gerenciador de proxy reverso com interface web para gerenciar facilmente proxies, SSL e domínios.

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
