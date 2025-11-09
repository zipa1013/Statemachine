# Statemachine - E/E-Architektur Doktorarbeit

## Überblick

Dieses Repository enthält eine Doktorarbeit zum Thema "Aufbau des Hardware-Modells einer E/E-Architektur und dessen Transformation in ein Simulationsmodell" für Mercedes-Benz Vans.

## Projekt-Struktur

```
Statemachine/
├── thesis/
│   └── latex/           # LaTeX-Dokument
│       ├── main.tex     # Hauptdokument
│       ├── references.bib # Bibliographie
│       └── tex/         # Kapitel-Dateien
├── .github/
│   └── workflows/       # GitHub Actions Workflows
├── tests/               # Python-Tests
├── requirements.txt     # Python-Abhängigkeiten
└── requirements-dev.txt # Entwicklung-Abhängigkeiten
```

## Inhalte

Die Doktorarbeit umfasst:

- **E/E-Architektur-Modellierung** mit PREEvision
- **Transformation** in Simulationsmodelle (OMNeT++, NS-3, Simulink)
- **Simulation und Validierung** von E/E-Architekturen
- **Integration** von Bosch-Sensoren und NVIDIA DRIVE Thor
- **Cybersecurity** und Energiemanagement
- **VAN.APPVERSE** App Store und Microservices
- **Vollständiges Regelwerk** für E/E-Architekturen für MB Vans

## Technologien

- **LaTeX** für die Dokumentation
- **PREEvision** für Architektur-Modellierung
- **Python** für Tools und Automatisierung
- **GitHub Actions** für CI/CD

## Build

### LaTeX-Dokument kompilieren

```bash
cd thesis/latex
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

### Python-Tests ausführen

```bash
pip install -r requirements-dev.txt
pytest
```

## GitHub Actions

Das Projekt nutzt GitHub Actions für:

- **CI/CD** für Python-Code
- **LaTeX-Build** (optional)
- **Code-Quality** Checks (flake8, black, mypy)
- **Security** Scanning (bandit, safety)

## GitHub MCP Integration

Dieses Projekt nutzt GitHub MCP für die direkte Integration mit GitHub. Siehe [GITHUB_MCP_GUIDE.md](GITHUB_MCP_GUIDE.md) für Details.

## Lizenz

[Ihre Lizenz hier]

## Autor

[Ihr Name]

## Status

🟢 In Entwicklung - Aktuell 444 Seiten
