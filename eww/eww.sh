# Matar cualquier instancia previa para evitar duplicados
killall eww

# Iniciar el demonio y abrir la barra
eww daemon &
sleep 1 # Pequeña pausa para asegurar que el demonio despierte
~/.config/eww/scripts/workspace.sh &
eww open bar_widget



# Vigilar la carpeta de configuración por cualquier cambio
while inotifywait -e modify,create,delete -r ~/Dotfiles/eww; do
    # Cuando detecta un cambio, reinicia la barra limpiamente
    killall eww
    eww daemon &
    sleep 1
    eww open bar_widget
done