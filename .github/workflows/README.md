# GitHub Actions Workflows

Dieses Verzeichnis enthält GitHub Actions Workflows für das Projekt.

## Workflows

### test.yml
Hauptworkflow für Python-Tests:
- Testet gegen mehrere Python-Versionen (3.9, 3.10, 3.11, 3.12)
- Testet auf verschiedenen Betriebssystemen (Ubuntu, Windows, macOS)
- Führt Linting mit flake8 durch
- Prüft Code-Formatierung mit black
- Führt Type-Checking mit mypy durch
- Führt Tests mit pytest aus
- Generiert Coverage-Reports
- Uploadet Coverage zu Codecov (optional)

### ci.yml
Einfacher CI-Workflow:
- Testet gegen Python-Versionen 3.10, 3.11, 3.12
- Testet auf verschiedenen Betriebssystemen
- Führt Tests aus
- Baut das Paket

## Verwendung

### Voraussetzungen

1. Erstellen Sie eine `requirements.txt` Datei mit Ihren Abhängigkeiten
2. Optional: Erstellen Sie eine `requirements-dev.txt` für Entwicklungs-Abhängigkeiten
3. Erstellen Sie einen `tests/` Ordner mit Ihren Test-Dateien
4. Optional: Erstellen Sie eine `setup.py` oder `pyproject.toml` für Paket-Installation

### Konfiguration

Die Workflows sind so konfiguriert, dass sie automatisch ausgeführt werden bei:
- Push auf `main`, `develop`, oder `master` Branch
- Pull Requests auf diese Branches
- Manueller Auslösung (workflow_dispatch)

### Anpassungen

Sie können die Workflows anpassen, indem Sie:
- Python-Versionen in der Matrix ändern
- Betriebssysteme in der Matrix hinzufügen oder entfernen
- Test-Befehle anpassen
- Linting-Tools ändern oder entfernen
- Coverage-Schwellenwerte setzen

## Abhängigkeiten

Die Workflows installieren automatisch:
- pytest (Testing)
- pytest-cov (Coverage)
- pytest-xdist (Parallel Testing)
- flake8 (Linting)
- black (Code Formatting)
- mypy (Type Checking)
- bandit (Security Scanning)
- safety (Dependency Security)

## Code Coverage

Coverage-Reports werden automatisch generiert und können optional zu Codecov hochgeladen werden. 
Stellen Sie sicher, dass Sie einen Codecov-Token in den Repository-Secrets konfigurieren, wenn Sie Codecov verwenden möchten.

## Security Scanning

Der `test.yml` Workflow enthält einen Security-Job, der:
- Bandit für Security-Scanning verwendet
- Safety für Dependency-Security-Checks verwendet

## Weitere Informationen

Für weitere Informationen zu GitHub Actions besuchen Sie:
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Python Setup Action](https://github.com/actions/setup-python)
- [Pytest Documentation](https://docs.pytest.org/)


