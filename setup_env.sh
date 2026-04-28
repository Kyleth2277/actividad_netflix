#!/bin/bash

# setup_env.sh - Preparación de entorno Linux para Netflix Team
set -e # Detener el script si un comando falla

echo "--- Iniciando preparación del entorno ---"

# 1. Actualización del sistema
echo "Actualizando índices de paquetes..."
sudo apt-get update -y

# 2. Instalación de Git
echo "Instalando Git..."
sudo apt-get install git -y

# 3. Instalación de Python3 y Pip
echo "Instalando Python3 y gestor de paquetes..."
sudo apt-get install python3 python3-pip -y

# 4. Instalación de Docker
echo "Instalando motor de Docker..."
sudo apt-get install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

echo "--- Entorno preparado correctamente para el equipo de Ingeniería ---"