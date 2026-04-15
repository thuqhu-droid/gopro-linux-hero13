# GoPro HERO13 Webcam for Linux (Ultra-Low Latency & GPU Accelerated)

Este repositorio contiene una versión altamente optimizada del script para usar la **GoPro HERO13** (y modelos anteriores) como una webcam profesional en Linux. A diferencia de otras versiones, esta implementación se enfoca en la **latencia cero**, **calidad visual cinematográfica** y el **mínimo uso de CPU**.

## 🚀 Características Principales (HERO13 Optimized)

*   **⚡ Latencia Ultra-Baja:** Optimización de buffers UDP y flags de FFmpeg (`probesize`, `analyzeduration`) para lograr una respuesta instantánea (ideal para videollamadas).
*   **🎮 Aceleración por Hardware (GPU):** Decodificación de video mediante **Intel VA-API (Iris Xe/TigerLake)**. Libera tu CPU y reduce el calor de tu equipo.
*   **🎬 Filtros de Imagen "Pro":** Post-procesamiento en tiempo real que mejora la saturación, el contraste y la nitidez para un look más profesional y menos "lavado".
*   **🔌 Plug & Play Real:** Reglas de `udev` personalizadas para detectar el Vendor ID `2672` (GoPro). La cámara se activa sola al conectarla.
*   **📶 Auto-Tuning de Red:** Configuración automática de MTU y `txqueuelen` en la interfaz virtual para evitar parpadeos en 1080p.
*   **🖥️ Servicio Systemd:** Gestión automática del stream mediante un servicio de sistema que se detiene limpiamente al desconectar la cámara sin cerrar tu sesión de usuario.

## 🛠️ Requisitos

*   **GoPro HERO13** (o HERO9/10/11/12) conectada por USB.
*   **v4l2loopback** instalado (`sudo apt install v4l2loopback-dkms`).
*   **FFmpeg** con soporte para VA-API.
*   **Intel GPU** (TigerLake o superior recomendada para Iris Xe).

## 📥 Instalación Inmediata

1.  Clona este repositorio:
    ```bash
    git clone https://github.com/TU_USUARIO/gopro-linux-hero13.git
    cd gopro-linux-hero13
    ```

2.  Ejecuta el instalador con privilegios de root:
    ```bash
    sudo ./install.sh
    ```

El instalador copiará el binario a `/usr/local/sbin`, configurará la regla de `udev` y habilitará el servicio de sistema.

## 🎥 Uso

¡No hay pasos adicionales! Simplemente **conecta tu GoPro por USB**.
*   El sistema la reconocerá inmediatamente.
*   La luz de la GoPro indicará que está en modo Webcam.
*   Abre tu aplicación favorita (Zoom, OBS, Teams) y selecciona **"GoPro HERO13"** o el dispositivo `/dev/video42`.

### Scripts Manuales
Si prefieres control manual, puedes usar:
*   `sudo gopro_start.sh`: Inicia y optimiza todo manualmente.
*   `sudo systemctl status gopro_webcam.service`: Verifica el estado del flujo automático.

## ⚙️ Detalles Técnicos de la Optimización

### Cadena de Filtros FFmpeg
Usamos la GPU para aplicar:
*   `eq=contrast=1.05:saturation=1.25:gamma=1.1`: Para colores vibrantes.
*   `unsharp`: Para una definición de bordes superior.

### Parámetros de Red
*   `MTU 1500`
*   `txqueuelen 10000`
*   `UDP fifo_size=1000000` (1MB para evitar delay acumulativo).

---
*Desarrollado para ofrecer la mejor experiencia de Webcam con cámaras de acción en entornos Linux profesionales.*

## 🤝 Créditos y Reconocimientos

Esta versión es una variante altamente optimizada y mejorada basada en el trabajo original de [Joshua Schmid (jschmid1)](https://github.com/jschmid1/gopro_as_webcam_on_linux). 

**Mejoras añadidas en esta versión:**
*   Soporte específico y optimizado para **GoPro HERO13**.
*   Aceleración por hardware **Intel VA-API (Iris Xe)**.
*   Filtros de imagen en tiempo real (saturación, contraste y nitidez).
*   Configuración de **ultra-baja latencia** para videollamadas.
*   Automatización completa mediante servicios de sistema y reglas `udev` para un reconocimiento inmediato.
