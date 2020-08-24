#!/bin/bash

# Get current path
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";

# Python command
PY=${HOME}/miniconda3/bin/python

# Update repos
cd $HOME;
cd generate-nexus-files;
echo "Updating generate-nexus-files";
git pull origin master;
git log | head -1;
cd src/nexusjson;
echo "Updating nexusjson";
git pull origin master;
git log | head -1;
cd ../nexusutils;
echo "Updating nexusutils"
git pull origin master;
git log | head -1;

cd ${HOME}/mantid/source;
echo "Updating mantid";
git pull origin master;
git log | head -1;
cd ../build
echo "Building mantid";
make install;

# Update PYTHONPATH
export PYTHONPATH=${HOME}/mantid/install/bin:${HOME}/mantid/install/lib:${PYTHONPATH}

# Generate and load WISH file
cd ${HOME}/generate-nexus-files/examples/wish;
${PY} WISH_example_with_fake_data.py;
mv WISH_example.nxs ${CWD}/.;

# Run the python tests
cd ${CWD};
${PY} -m pytest;
