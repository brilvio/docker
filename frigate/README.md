# Frigate NVR

Sistema de detecção de objetos e gravação de vídeo com IA usando OpenVINO para aceleração por GPU Intel.

## 🚀 Inicialização

```bash
docker compose up -d
```

## 🌐 Acesso

- Interface sem Auth: http://localhost:5000
- Interface com Auth: http://localhost:8971

## ⚙️ Configuração

### Hardware Acceleration

Esta configuração está otimizada para **Intel HD Graphics 520 (Skylake)** com aceleração por GPU usando:

- **OpenVINO** para detecção de objetos na GPU
- **VAAPI** desabilitado (pode ser reativado se necessário)
- Driver: `iHD` (Intel HD Graphics)

### Estrutura de Pastas

- `config/`: Arquivos de configuração do Frigate
- `storage/`: Gravações, snapshots e banco de dados
- `config/config.yml`: Configuração principal

### Portas

- `5000`: Interface web do Frigate
- `8971`: Go2RTC (streaming)
- `8555`: RTSP (TCP/UDP)

## 🔧 Configuração de GPU

### Permissões do Dispositivo GPU

Para que o OpenVINO funcione corretamente com a GPU, é necessário ajustar as permissões do dispositivo:

```bash
# Executar no host (requer sudo)
sudo chmod 666 /dev/dri/renderD128 /dev/dri/card0
```

### Tornar Permanente (Recomendado)

Crie uma regra udev para manter as permissões após reinicializações:

```bash
sudo bash -c 'cat > /etc/udev/rules.d/99-gpu-permissions.rules << EOF
KERNEL=="renderD128", MODE="0666"
KERNEL=="card0", MODE="0666"
EOF'
sudo udevadm control --reload-rules
sudo udevadm trigger
```

Ou execute o script fornecido:

```bash
./fix-gpu-permissions.sh
```

## 📋 Detecção de Objetos

### Objetos Configurados

- Person (pessoa)
- Car (carro)
- Dog (cachorro)
- Cat (gato)

### Modelo

- **Modelo**: SSDLite MobileNet V2
- **Resolução**: 300x300
- **Dispositivo**: GPU (OpenVINO)
- **Formato de entrada**: NHWC, BGR

## 🎥 Câmeras

As câmeras são configuradas no arquivo `config/config.yml`. Exemplo de configuração:

```yaml
cameras:
  camera_1:
    ffmpeg:
      inputs:
        - path: rtsp://user:password@ip:port/stream
          roles:
            - detect
            - record
    detect:
      width: 800
      height: 448
      fps: 5
```

## 📊 Recursos

- ✅ Detecção de objetos em tempo real
- ✅ Gravação com retenção configurável
- ✅ Snapshots automáticos
- ✅ Zonas de detecção
- ✅ Autotracking PTZ (ONVIF)
- ✅ Reconhecimento facial
- ✅ Busca semântica
- ✅ Aceleração por GPU Intel

## 🔍 Troubleshooting

### GPU não detectada

1. Verifique as permissões do dispositivo:
   ```bash
   ls -la /dev/dri/
   ```

2. Teste dentro do container:
   ```bash
   docker exec frigate ls -la /dev/dri/
   ```

3. Verifique os logs:
   ```bash
   docker logs frigate | grep -i "gpu\|openvino\|error"
   ```

### FFmpeg falhando

- Verifique se a câmera está acessível
- Confirme as credenciais RTSP
- Verifique a configuração de hardware acceleration

### Alto uso de CPU

- Certifique-se de que a GPU está sendo usada (verifique logs)
- Reduza a resolução de detecção
- Diminua o FPS de detecção

## 📚 Documentação

- [Frigate Documentation](https://docs.frigate.video/)
- [OpenVINO Setup](https://docs.frigate.video/configuration/hardware_acceleration/)
- [Hardware Acceleration Guide](https://docs.frigate.video/configuration/hardware_acceleration_video/)

## 🔄 Atualização

```bash
docker compose pull
docker compose up -d
```

## 📝 Notas

- O container roda em modo `privileged` para acesso ao hardware
- Shared memory (`shm_size`) configurado para 1GB
- Cache temporário em tmpfs para melhor performance
- Timezone sincronizado com o host
