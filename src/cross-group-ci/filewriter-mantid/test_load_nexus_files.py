from load import load
import pytest


def test_load_wish_file():
    ws = load(filename='WISH_example.nxs')
    assert ws.getNumberEvents() == 1000
