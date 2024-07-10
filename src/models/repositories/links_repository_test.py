import pytest
import uuid
from src.models.settings.db_connection_handler import db_connection_handler
from .links_repository import LinksRepository

db_connection_handler.connect()
link_id = str(uuid.uuid4())
trip_id = str(uuid.uuid4())


@pytest.mark.skip(reason="interacao com o banco")
def test_add_links():
    conn = db_connection_handler.get_connection()
    links_repository = LinksRepository(conn)

    link_infos = {
        "id": link_id,
        "trip_id": trip_id,
        "link": "https://google.com",
        "title": "Google"
    }

    links_repository.add_links(link_infos)


@pytest.mark.skip(reason="interacao com o banco")
def test_find_links_from_trip():
    conn = db_connection_handler.get_connection()
    links_repository = LinksRepository(conn)

    links = links_repository.find_links_from_trip(trip_id)

    assert isinstance(links, list)
    assert isinstance(links[0], tuple)
