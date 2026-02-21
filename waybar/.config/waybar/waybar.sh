#!/bin/bash

# Matar cualquier instancia previa del script o de waybar para evitar duplicados
killall waybar

# Iniciar waybar en segundo plano
waybar &

# Vigilar la carpeta de configuración por cualquier cambio
while inotifywait -e modify,create,delete -r ~/.config/waybar; do
    # Cuando detecta un cambio, envía la señal de recarga suave
    killall -SIGUSR2 waybar
done
