import argparse
import mantid.simpleapi as mantid

parser = argparse.ArgumentParser(description='Load a Nexus file using Mantid.')
parser.add_argument('filename', type=str, nargs=1,
                    help='a file name to be loaded')
args = parser.parse_args()
print(args.filename)
ws = mantid.Load(Filename=args.filename)
print(ws)
