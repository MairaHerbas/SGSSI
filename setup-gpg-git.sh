#!/bin/bash
set -e

echo "🔹 Limpiando configuración antigua de Git..."
git config --global --unset user.signingkey || true
git config --global --unset gpg.program || true
git config --global --unset gpg.format || true

echo "🔹 Configurando Git con tus datos..."
git config --global user.name "MairaHerbas"
git config --global user.email "mairaherbas18@gmail.com"

# Forzamos a Git a usar GPG clásico
echo "🔹 Configurando Git para usar GPG..."
git config --global gpg.program gpg2
git config --global gpg.format openpgp
git config --global user.signingkey 89DB2BF4D950B4E0
git config --global commit.gpgsign true

# Asegurar que el TTY está configurado
if ! grep -q "export GPG_TTY" ~/.bashrc; then
    echo "export GPG_TTY=\$(tty)" >> ~/.bashrc
fi
export GPG_TTY=$(tty)

echo "✅ Configuración completada."
echo "Ahora prueba con: git commit -S -m \"commit firmado\""
