import argparse
import mantid.simpleapi as mantid

parser = argparse.ArgumentParser(description='Load a Nexus file using Mantid.')
parser.add_argument('filename', type=str, help='a file name to be loaded')
args = parser.parse_args()

ws = mantid.Load(Filename=args.filename)
print(ws)
