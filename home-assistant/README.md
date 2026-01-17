# Home Assistant

Sistema de automação residencial open-source para controlar e automatizar dispositivos inteligentes.

## 🚀 Inicialização

```bash
docker compose up -d
```

## 🌐 Acesso

- Interface Web: http://localhost:8123
- Na primeira inicialização, será necessário criar uma conta de administrador

## ⚙️ Configuração

### Estrutura de Pastas

- `config/`: Arquivos de configuração do Home Assistant
- `storage/`: Dados persistentes (opcional)

### Portas

- `8123`: Interface web do Home Assistant

### Dispositivos USB

O container está configurado para acessar dispositivos USB comuns para adaptadores Z-Wave/Zigbee:

- `/dev/ttyUSB0`: Dispositivos USB seriais
- `/dev/ttyACM0`: Dispositivos USB CDC/ACM
- `/dev/ttyAMA0`: Dispositivos seriais AMA

**Nota:** Remova ou ajuste os dispositivos no `docker-compose.yml` se não estiver usando adaptadores USB.

### Timezone

Timezone configurado para `America/Sao_Paulo`. Para alterar, edite a variável `TZ` no `docker-compose.yml`.

## 🔧 Integração com Nginx Proxy Manager

Para acessar via domínio através do Nginx Proxy Manager:

1. Acesse o Nginx Proxy Manager em http://localhost:81
2. Vá em **Proxy Hosts** → **Add Proxy Host**
3. Configure:
   - **Domain Names**: `homeassistant.seudominio.com` (ou o domínio desejado)
   - **Forward Hostname/IP**: `home-assistant` (nome do container)
   - **Forward Port**: `8123`
   - **SSL**: Configure certificado SSL (Let's Encrypt recomendado)
   - **Websockets Support**: ✅ Ative esta opção (importante para Home Assistant)

## 📱 Recursos

- ✅ Interface web responsiva
- ✅ Aplicativo móvel (iOS/Android)
- ✅ Suporte a milhares de integrações
- ✅ Automações avançadas
- ✅ Assistente de voz (Nabu Casa)
- ✅ Z-Wave e Zigbee (com adaptadores USB)
- ✅ MQTT
- ✅ Integração com Google Assistant e Alexa

## 🔄 Atualização

```bash
docker compose pull
docker compose up -d
```

## 📚 Documentação

- [Home Assistant Documentation](https://www.home-assistant.io/docs/)
- [Getting Started](https://www.home-assistant.io/getting-started/)
- [Integrations](https://www.home-assistant.io/integrations/)
- [Community Forum](https://community.home-assistant.io/)

## 💡 Dicas

- A primeira inicialização pode levar alguns minutos
- Configure backups regulares da pasta `config/`
- Use o Supervisor (Add-ons) para instalar complementos úteis
- Configure integrações através da interface web em **Settings** → **Devices & Services**

## 🔐 Segurança

- Altere a senha padrão no primeiro acesso
- Configure autenticação de dois fatores (2FA)
- Use HTTPS quando expor publicamente (via Nginx Proxy Manager)
- Mantenha o Home Assistant atualizado
