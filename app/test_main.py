import pytest

from main import app


@pytest.fixture
def client():
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client


def test_health_check(client):
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json == {"status": "healthy"}


def test_hello_world(client):
    response = client.get("/")
    assert response.status_code == 200
    assert response.json == {"message": "Hello from Platform Engineering!"}
