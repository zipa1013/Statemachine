# Tests

Dieses Verzeichnis enthält die Test-Dateien für das Projekt.

## Struktur

```
tests/
├── __init__.py
├── test_example.py
├── unit/
│   ├── __init__.py
│   └── test_unit_example.py
├── integration/
│   ├── __init__.py
│   └── test_integration_example.py
└── fixtures/
    └── test_data.json
```

## Ausführung

### Alle Tests ausführen
```bash
pytest
```

### Spezifische Tests ausführen
```bash
pytest tests/unit/
pytest tests/integration/
```

### Tests mit Coverage
```bash
pytest --cov=. --cov-report=html
```

### Tests mit Markern
```bash
pytest -m unit
pytest -m integration
pytest -m "not slow"
```

## Test-Beispiel

```python
import pytest

def test_example():
    """Beispiel-Test."""
    assert 1 + 1 == 2

@pytest.mark.unit
def test_unit_example():
    """Unit-Test-Beispiel."""
    result = add(1, 2)
    assert result == 3

@pytest.mark.integration
def test_integration_example():
    """Integration-Test-Beispiel."""
    # Integration-Test-Code hier
    pass
```

## Marker

- `@pytest.mark.unit`: Unit-Tests
- `@pytest.mark.integration`: Integration-Tests
- `@pytest.mark.e2e`: End-to-End-Tests
- `@pytest.mark.slow`: Langsame Tests

## Weitere Informationen

Für weitere Informationen zu pytest besuchen Sie:
- [Pytest Documentation](https://docs.pytest.org/)
- [Pytest Best Practices](https://docs.pytest.org/en/stable/goodpractices.html)


