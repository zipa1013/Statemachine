"""
Beispiel-Tests für das Projekt.
Ersetzen Sie diese Tests mit Ihren tatsächlichen Tests.
"""

import pytest


def test_basic():
    """Grundlegender Test."""
    assert 1 + 1 == 2


@pytest.mark.unit
def test_unit_example():
    """Beispiel für einen Unit-Test."""
    result = add(1, 2)
    assert result == 3


@pytest.mark.integration
def test_integration_example():
    """Beispiel für einen Integration-Test."""
    # Hier würde normalerweise Integration-Test-Code stehen
    assert True


@pytest.mark.slow
def test_slow_example():
    """Beispiel für einen langsamen Test."""
    # Hier würde normalerweise ein langsamer Test stehen
    import time
    time.sleep(0.1)  # Simuliert einen langsamen Test
    assert True


def add(a, b):
    """Einfache Additionsfunktion für Tests."""
    return a + b


class TestExample:
    """Beispiel-Test-Klasse."""
    
    def test_class_method(self):
        """Test-Methode in einer Klasse."""
        assert True
    
    def test_with_fixture(self, sample_fixture):
        """Test mit Fixture."""
        assert sample_fixture == "sample"


@pytest.fixture
def sample_fixture():
    """Beispiel-Fixture."""
    return "sample"


@pytest.mark.parametrize("a,b,expected", [
    (1, 2, 3),
    (2, 3, 5),
    (5, 5, 10),
])
def test_parametrized(a, b, expected):
    """Parametrisierter Test."""
    assert add(a, b) == expected

