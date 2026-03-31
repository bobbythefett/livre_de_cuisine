#!/bin/bash

# Script pour lancer le serveur local de recettes Cooklang
# Nécessite 'cooklang-chef' (disponible sur AUR)

# Détection de l'outil disponible (chef ou cook)
if command -v chef >/dev/null 2>&1; then
    CMD="chef"
elif command -v cook >/dev/null 2>&1; then
    CMD="cook"
else
    echo "ERREUR : Aucun outil Cooklang détecté (chef ou cook)."
    echo "Veuillez installer 'cooklang-chef' (AUR) ou 'cookcli' (GitHub)."
    exit 1
fi

# Détection de l'adresse IP locale pour faciliter l'accès sur tablette/téléphone
IP_LOCALE=$(hostname -I | awk '{print $1}')
PORT=9080

echo "-------------------------------------------------------"
echo "Lancement du serveur de recettes avec : $CMD"
echo "Accès local : http://localhost:$PORT"
if [ ! -z "$IP_LOCALE" ]; then
    echo "Accès réseau : http://$IP_LOCALE:$PORT"
fi
echo "-------------------------------------------------------"
echo "Appuyez sur Ctrl+C pour arrêter le serveur."

# Lancement du serveur sur toutes les interfaces pour l'accès réseau
$CMD server --host 0.0.0.0 --port $PORT ./recipes
