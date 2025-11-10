#!/bin/bash
# Manueller Push zu GitHub
# Dieses Skript führt den Git Push durch

cd /Users/patrickzimmermann/Desktop/Statemachine

echo "=== Git Status ==="
git status --short | head -20

echo ""
echo "=== Letzte Commits ==="
git log --oneline -3

echo ""
echo "=== Push zu GitHub ==="
echo "Bitte führen Sie manuell aus:"
echo "  git push origin main"
echo ""
echo "Wenn Git nach Authentifizierung fragt:"
echo "  - Benutzername: zipa1013"
echo "  - Passwort: Verwenden Sie einen GitHub Personal Access Token"
echo ""
echo "Token erstellen: https://github.com/settings/tokens"
