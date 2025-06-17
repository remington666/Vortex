#!/bin/bash

# chmod +x vortex.sh
# ./vortex.sh up           # Provisionne tout sauf le controller
# ./vortex.sh controller   # Lance uniquement le controller
# ./vortex.sh destroy      # Détruit tous les modules sauf le controller
# ./vortex.sh destroy-all  # Tout détruire
# ./vortex.sh list         # Affiche les modules

# ──────────────────────────────────────────────────────────────
# 🌀 VORTEX – Purple Lab CLI
# Script de gestion pour Vagrant + Ansible
# Auteur : Franck / remington666
# ──────────────────────────────────────────────────────────────

set -e

# Couleurs
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
NC='\033[0m'

# Dossiers (hors ansible-controller)
MODULES=(
  "firewall"
  "soc"
  "suricata"
  "domaine1"
  "domaine2"
  "glpi-vagrant-ansible"
  "kali-vagrant-ansible"
  "redteam"
)

ANSIBLE_CONTROLLER="ansible-controller"

# ──────────────────────────────────────────────────────────────
# Fonctions
# ──────────────────────────────────────────────────────────────

header() {
  echo -e "${PURPLE}────────────────────────────────────────────"
  echo -e " 🌀  VORTEX – Purple Lab CLI "
  echo -e "────────────────────────────────────────────${NC}"
}

list_modules() {
  echo -e "${CYAN}Modules disponibles :${NC}"
  for m in "${MODULES[@]}"; do
    echo -e " • $m"
  done
}

up_all() {
  header
  echo -e "${GREEN}📦 Provisionnement des machines (hors Ansible Controller)...${NC}"
  for m in "${MODULES[@]}"; do
    echo -e "${BLUE}➡️  $m${NC}"
    (cd "$m" && vagrant up --provision)
  done
  echo -e "${GREEN}✅ Modules déployés avec succès.${NC}"
}

up_controller() {
  header
  echo -e "${CYAN}🚀 Lancement de l’Ansible Controller...${NC}"
  (cd "$ANSIBLE_CONTROLLER" && vagrant up)
  echo -e "${GREEN}✅ Ansible Controller prêt.${NC}"
}

destroy_all() {
  header
  echo -e "${RED}⚠️ Destruction de tous les modules (hors controller)...${NC}"
  for m in "${MODULES[@]}"; do
    echo -e "${RED}🔥 $m${NC}"
    (cd "$m" && vagrant destroy -f)
  done
}

destroy_controller() {
  echo -e "${RED}🔥 Ansible Controller${NC}"
  (cd "$ANSIBLE_CONTROLLER" && vagrant destroy -f)
}

help_menu() {
  header
  echo -e "${CYAN}Usage : ./vortex.sh [option]${NC}"
  echo -e " ${GREEN}up${NC}             → Démarre tous les modules (hors Ansible)"
  echo -e " ${GREEN}controller${NC}     → Lance uniquement l'Ansible Controller"
  echo -e " ${GREEN}destroy${NC}        → Détruit tous les modules (hors controller)"
  echo -e " ${GREEN}destroy-all${NC}    → Détruit tout, y compris le controller"
  echo -e " ${GREEN}list${NC}           → Affiche les modules"
  echo -e " ${GREEN}help${NC}           → Affiche ce menu"
  echo -e "────────────────────────────────────────────"
}

# ──────────────────────────────────────────────────────────────
# Dispatch CLI
# ──────────────────────────────────────────────────────────────

case "$1" in
  up) up_all ;;
  controller) up_controller ;;
  destroy) destroy_all ;;
  destroy-all) destroy_all && destroy_controller ;;
  list) list_modules ;;
  help|"") help_menu ;;
  *)
    echo -e "${RED}❌ Option invalide : $1${NC}"
    help_menu
    exit 1
    ;;
esac
