#!/bin/bash
set -e

# 🔍 Récupère l'adresse IP de la machine hôte vue depuis le conteneur
# → On ping la gateway Docker par défaut
PASV_IP=$(ip route | awk '/default/ {print $3}')

echo "🧠 Détection automatique de pasv_address : $PASV_IP"

# 📝 Remplace le placeholder dans la config vsftpd
sed -i "s/__PASV_ADDRESS__/$PASV_IP/" /etc/vsftpd.conf

echo "🚀 Starting vsftpd..."
exec /usr/sbin/vsftpd /etc/vsftpd.conf
