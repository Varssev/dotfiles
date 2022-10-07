# dotfiles

#1
pacman -S reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector -c ES -f 12 -l 10 -n 12 --download-timeout 60 --save /etc/pacman.d/mirrorlist

#2
sudo pacman -S xorg bspwm sxhkd kitty picom rofi feh polybar neovim

#3
mkdir -p .config/bspwm/
mkdir -p .config/sxhkd/
sudo cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
sudo cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/sxhkd/sxhkdrc

#4.Añadir a bspwm
setxkmap es &
feh --bg-fill /home/"usuario"/Images/background/bg1.jpg
~/.config/polybar/launch.sh
picom --experimental-backends &

bspc config focus_follows_pointer true

#Para instalar fonts
ir a la pagina de nerd fonts, descargar hack y pasar el zip a /usr/share/fonts
y descomprimirlo ahi y borrar el License.md y el readme y el comprimido

#configurar polybar
https://github.com/polybar/polybar/wiki/
importante cambiar el nombre de la polybar tanto en el config como en el launch.sh
https://github.com/adi1090x/polybar-themes
importante instalar las dependencias

#instalar oh my zsh
https://github.com/ohmyzsh/ohmyzsh

______________________________________
______________________________________
______________________________________

//Pastebin: https://pastebin.com/raw/EEX1Dsuq

//Agregar primero el repositorio de backports
sudo nano /etc/apt/sources.list
deb http://deb.debian.org/debian buster-backports main

sudo apt update
sudo apt-get install xorg bspwm sxhkd nano picom feh polybar git rofi rxvt-unicode build-essential

//sudo apt install firefox || sudo apt-get install firefox

//Si no funciona lo de arriba, entonces. Para instalar firefox: https://flatpak.org/setup/Debian/
//Despues de reiniciar, bajar del todo en esta página para ver el comando para instalar: https://flathub.org/apps/details/org.mozilla.firefox
//Ejecutar firefox: flatpak run org.mozilla.firefox

//Si polybar falla
sudo apt install cmake cmake-data pkg-config python3-sphinx libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen 
xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev 
libcurl4-openssl-dev libnl-genl-3-dev

sudo apt -t buster-backports install polybar

sudo mkdir .config //Esto es para crear el directorio .config para bspwm, etc... dentro del home
cd .config
sudo mkdir bspwm sxhkd
cd ..
sudo cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
sudo cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
sudo install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
sudo install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

sudo mkdir .config/polybar
sudo cp /usr/share/doc/polybar/config ~/.config/polybar/config
//Ejemplo de polybar, ejecuta: $ polybar example
sudo touch .config/polybar/launch.sh
sudo chmod +x .config/polybar/launch.sh
//Dentro de launch.sh
#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config
polybar nombrePolybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."

//Config picom
sudo mkdir .config/picom
//Copiar la config: sudo cp /usr/share/doc/picom/examples/picom.sample.conf ~/.config/picom/
sudo nano picom.sample.conf (guardarlo eliminado el .sample)

//Crear config de rofi
sudo mkdir -p .config/rofi/themes
sudo touch .config/rofi/config
rofi-theme-selector (alt + a - Para aplicar los cambios de tema en rofi)

//bspwm
//Agregar las siguientes lineas a bspwm
bspc config focus_follows_pointer true
feh --bg-fill /home/"usuario"/Imagenes/background/fondo1.jpg
~/.config/polybar/launch.sh
picom --experimental-backends & 
bspc config border_width 0

//Configuración para URvxt
sudo nano ~/.Xresources
//Escribir dentro
URxvt*background: black 
URxvt*foreground: white
URxvt*font: xft:Monospace:size=9:antialias=true
URxvt.clipboard.autocopy: true
URxvt.scrollBar: false
URxvt.transparent: true
URxvt.shading: 20
URxvt.internalBorder: 7
xrdb ~/.Xresources //Para recargar el archivo
//Pagina para ver una simple guia: https://www.enmimaquinafunciona.com/pregunta/133298/como-puedo-cambiar-los-colores-del-rxvt-a-blanco-sobre-negro
//Para copiar y pegar en terminales: ctrl + alt + c/v

//Agregar usuario a sudo en Debian
/sbin/usermod -aG sudo usuario
//Y reiniciar

//KDE Plasma
xorg plasma-desktop sddm dolphin konsole
apt-get remove dolphin
