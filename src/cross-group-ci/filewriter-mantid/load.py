import mantid.simpleapi as mantid

def load(filename):
    ws = mantid.Load(Filename=filename)
    return ws
