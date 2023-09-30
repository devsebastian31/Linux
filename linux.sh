#!/bin/bash

while :
do 

clear

echo 

banner(){
echo
echo " ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗    ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗ "
echo " ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝    ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║ "
echo " ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝     ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║ "
echo " ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗     ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║ "
echo " ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗    ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║ "
echo " ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝    ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝ "                                                                                          
echo 
echo "                              https://github.com/bl4ck44                                         "
}

banner
echo

int_handler (){
    clear
    echo
    echo "[+] Adios"
    kill $PPID
    exit 1
}

trap 'int_handler' INT

if [ "$(id -u)" != "0" ]; then
   echo "Ejecute este script como root (usando sudo)."
   exit 1
fi

echo

echo "[1] Actualizar el sistema"
echo "[2] Instalar Servicios"
echo "[3] Instalar Herramientas"
echo "[4] Version del sistema"
echo "[5] Salir"

echo

#leemos del teclado
read -p $'[+] Seleccione una opción: ' opcion



Actualizar(){
   
   # Actualizando el Sistema
   apt-get update && sudo apt-get dist-upgrade -y
   apt update && apt upgrade -y

   echo
   echo "[+] Sistema Actualizado"
   sleep 1.5
}



Version(){
   lsb_release -a
   echo
   sleep 3.0
}



Exit(){
   clear
   echo
   sleep 0.5
   exit
}



Servicios(){

   # Instalando el Servicio
   clear
   banner
   echo

   echo "[+] Servicios:"

   echo

   echo "[1] Apache2 - Servidor Web"

   echo

   echo "[2] Mysql - Base de Datos"

   echo

   echo "[3] Samba - Compartir Archivos"

   echo

   echo "[4] FTP - Transferencia de Archivos"

   echo

   echo "[5] PPTP - Servidor VPN"

   echo

   echo "[6] Bind9 - Servidor DNS"

   echo

   echo "[7] Squid - Servidor Proxy"

   echo

   echo "[8] Dhcpd - Servidor DHCP"

   echo

   echo "[99] Menú"

   echo

   read -p $'[+] Seleccione una opción: ' opcion

   case $opcion in

        1) echo 
        echo "[+] Instalando Apache2"
        echo
        apt-get install apache2 -y
        echo
        echo "[+] Apache2 instalado"
        sleep 1.5;;

        2) echo
        echo "[+] Instalando Mysql"
        echo
        apt-get install mysql-server -y
        echo
        echo "[+] Mysql instalado"
        sleep 1.5;;

        3) echo
        echo "[+] Instalando Samba"
        echo
        apt-get install samba -y
        echo
        echo "[+] Samba instalado"
        sleep 1.5;;

        4) echo
        echo "[+] Instalando FTP"
        echo
        apt-get install vsftpd -y
        echo
        echo "[+] FTP instalado"
        sleep 1.5;;

        5) echo
        echo "[+] Instalando PPTP"
        echo
        apt-get install pptpd -y
        echo
        echo "[+] PPTP instalado"
        sleep 1.5;;

        6) echo
        echo "[+] Instalando Bind9"
        echo
        apt-get install bind9 bind9-utils -y
        echo
        echo "[+] Bind9 instalado"
        sleep 1.5;;

        7) echo
        echo "[+] Instalando Squid"
        echo
        apt-get install squid -y
        echo
        echo "[+] Squid instalado";;

        8) echo
        echo "[+] Instalando Dhcpd"
        echo
        apt-get install isc-dhcp-server -y
        echo
        echo "[+] Dhcpd instalado";;

        99) echo
        return 0;;

esac

echo

}

Herramientas(){

   #Instalando Herramientas
   clear

   banner
   echo

   echo "[+] Herramientas:"

   echo

   echo "[1] Python3"

   echo

   echo "[2] Git"

   echo

   echo "[3] Go"

   echo

   echo "[4] Docker"

   echo

   echo "[5] Kitty"

   echo

   echo "[99] Menú"
   
   echo

   read -p $'[+] Seleccione una opción: ' opcion

   case $opcion in

        1) echo
        echo "[+] Instalando python3"
        echo
        apt-get install python3-pip -y
        echo
        echo "[+] python3 instalado"
        sleep 1.5;;

        2) echo
        echo "[+] Instalando Git"
        apt-get install git -y
        echo
        echo "[+] Git instalado"
        sleep 1.5;;

        3) echo
        echo "[+] Instalando Go"
        echo
        apt-get install golang -y
        echo
        echo "[+] Go instalado"
        sleep 1.5;;

        4) echo
        echo "[+] Instalando Docker"
        echo
        apt-get install docker.io -y
        echo
        echo "[+] Docker instalado"
        sleep 1.5;;

        5) echo
        echo "[+] Instalando Kitty"
        echo
        apt-get install kitty -y 
        echo
        echo "[+] Kitty instalado"
        sleep 1.5;;

esac

echo
        
}

case $opcion in
        1) echo 
        echo "[+] Actualizando"
        echo
        Actualizar;;

        2) echo
        Servicios;;

        3) echo
        Herramientas;;

        4) echo
        echo "[+] Esta es la version del sistema"
        Version
        echo;;

        5) echo
        Exit;;

        *) echo "Opción incorrecta";;
esac

echo

done