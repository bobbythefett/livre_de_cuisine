#!/bin/bash

# Script pour lancer le serveur local de recettes Cooklang
# Nécessite 'cooklang-chef' (disponible sur AUR)

# Détection de l'adresse IP locale pour faciliter l'accès sur tablette/téléphone
IP_LOCALE=$(hostname -I | awk '{print $1}')
PORT=9080

echo "-------------------------------------------------------"
echo "Lancement du serveur de recettes Cooklang..."
echo "Accès local : http://localhost:$PORT"
if [ ! -z "$IP_LOCALE" ]; then
    echo "Accès réseau : http://$IP_LOCALE:$PORT"
fi
echo "-------------------------------------------------------"
echo "Appuyez sur Ctrl+C pour arrêter le serveur."

# Lancement du serveur sur toutes les interfaces pour l'accès réseau
chef server --host 0.0.0.0 --port $PORT ./recipes
