# GitHub MCP Integration Guide für Statemachine-Projekt

## Überblick

Dieses Projekt nutzt GitHub MCP (Model Context Protocol) für die Integration mit GitHub. Sie können jetzt direkt über Prompts mit dem GitHub-Repository interagieren.

## Verfügbare GitHub-MCP-Funktionen

### 1. **Dateien lesen aus GitHub**
```
"Lade die Datei main.tex aus dem GitHub-Repository"
"Zeige mir den Inhalt von thesis/latex/tex/00_einleitung.tex vom GitHub-Repository"
```

### 2. **Dateien pushen zu GitHub**
```
"Pushe alle Änderungen zu GitHub"
"Commite und pushe die neuen Kapitel zu GitHub"
```

### 3. **Branches verwalten**
```
"Erstelle einen neuen Branch 'feature/new-chapter'"
"Zeige mir alle Branches"
"Merge Branch 'feature/new-chapter' in 'main'"
```

### 4. **Pull Requests erstellen**
```
"Erstelle einen Pull Request für die neuen Änderungen"
"Zeige mir alle offenen Pull Requests"
```

### 5. **Issues verwalten**
```
"Erstelle ein Issue für 'Kapitel 24 fehlt'"
"Zeige mir alle offenen Issues"
```

### 6. **Commits durchsuchen**
```
"Zeige mir die letzten 10 Commits"
"Suche nach Commits mit 'Bosch' im Commit-Message"
```

## Beispiele für Prompts

### Dateien aus GitHub holen:
```
"Hole die Version von main.tex aus dem GitHub-Repository und vergleiche sie mit der lokalen Version"
"Lade alle .tex-Dateien aus dem 'main'-Branch"
```

### Änderungen pushen:
```
"Stage alle Änderungen, commite mit 'Update: Neue Kapitel hinzugefügt' und pushe zu GitHub"
"Pushe nur die Änderungen an thesis/latex/tex/23_ee_architektur_regelwerk.tex"
```

### Branch-Workflow:
```
"Erstelle einen neuen Branch 'feature/chapter-24', wechsle zu diesem Branch und pushe die Änderungen"
"Merge den Branch 'feature/chapter-24' in 'main'"
```

### Pull Requests:
```
"Erstelle einen Pull Request von 'feature/chapter-24' nach 'main' mit Titel 'Neues Kapitel 24'"
"Zeige mir alle Pull Requests mit Status 'open'"
```

## Aktueller Status

- **Repository**: https://github.com/zipa1013/Statemachine.git
- **Remote**: origin
- **Aktueller Branch**: main
- **GitHub-Status**: Repository ist noch leer (lokale Änderungen müssen gepusht werden)

## Nächste Schritte

1. **Erstes Push zu GitHub**:
   ```
   "Stage alle Dateien, commite mit 'Initial commit: LaTeX-Doktorarbeit' und pushe zu GitHub"
   ```

2. **GitHub Actions aktivieren**:
   - Die Workflows in `.github/workflows/` werden automatisch aktiviert, sobald sie zu GitHub gepusht werden

3. **Repository-Struktur auf GitHub**:
   - Alle LaTeX-Dateien werden zu GitHub gepusht
   - GitHub Actions werden automatisch ausgeführt
   - Sie können Issues und Pull Requests nutzen

## Wichtige Hinweise

- **PDF-Dateien**: Die `.gitignore` ignoriert aktuell PDF-Dateien. Falls Sie PDFs versionieren möchten, entfernen Sie `*.pdf` aus der `.gitignore`
- **Build-Artefakte**: LaTeX-Build-Artefakte (`.aux`, `.log`, etc.) werden ignoriert
- **Sensible Daten**: Niemals Passwörter oder API-Keys committen

## GitHub-MCP Befehle

Sie können jetzt direkt mit dem AI-Assistenten sprechen:
- "Pushe meine Änderungen zu GitHub"
- "Lade die neueste Version von main.tex aus GitHub"
- "Erstelle einen Pull Request für meine Änderungen"
- "Zeige mir alle Commits im Repository"

Der AI-Assistent wird automatisch die GitHub-MCP-Funktionen nutzen, um diese Aufgaben auszuführen.

