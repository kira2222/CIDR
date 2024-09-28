# Network Information Script

Este script Bash obtiene información de red basada en una dirección IP y un CIDR utilizando la herramienta `ipcalc` a través de una solicitud web. Los resultados son procesados y mostrados de manera organizada en la terminal.

## Características
- Muestra información de la red como la dirección IP, la red, y otros detalles clave.
- Manejo de colores para mejorar la legibilidad en la terminal.
- Manejador de señales para la interrupción (Ctrl + C), que garantiza la restauración del cursor y la salida segura.
- Utiliza `curl` para obtener los datos y `awk`, `sed` y `grep` para procesarlos.

## Requisitos
- `curl` instalado en el sistema.
- Acceso a internet (para hacer solicitudes a `ipcalc`).

## Uso

### Ejecución

Para ejecutar el script, simplemente utiliza el siguiente comando en tu terminal:

```bash
./script.sh <IP> <CIDR>

Ejemplo

./script.sh 192.168.1.1 24

Opciones
<IP>: Dirección IP que deseas consultar.
<CIDR>: El CIDR asociado a la dirección IP.

Salida
El script mostrará la información de la red, destacando los valores clave con colores para facilitar la interpretación.

Manejo de Interrupciones
Si el script es interrumpido con Ctrl + C, limpiará la salida y restaurará el estado normal del cursor antes de salir.
