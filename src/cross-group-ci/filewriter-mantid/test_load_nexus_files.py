from load import load
import pytest


def test_load_wish_file():
    ws = load(filename='WISH_example.nxs')
    assert ws.getNumberEvents() == 1000
    assert ws.getTofMin() == pytest.approx(0.439)
    assert ws.getTofMax() == pytest.approx(49983.7)

