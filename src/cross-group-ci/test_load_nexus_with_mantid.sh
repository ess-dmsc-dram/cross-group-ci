#!/bin/bash

# Get current path
CWD=$(pwd);

# Update repos

cd $HOME;
cd generate-nexus-files;
echo "Updating generate-nexus-files";
git pull origin master;
cd src/nexusjson;
echo "Updating nexusjson";
git pull origin master;
cd ../nexusutils;
echo "Updating nexusutils"
git pull origin master;

cd ${HOME}/mantid/source;
echo "Updating mantid";
git pull  origin master;
cd ../build
echo "Building mantid";
make install;

# Update PYTHONPATH
export PYTHONPATH=${HOME}/mantid/install/bin:${HOME}/mantid/install/lib:${PYTHONPATH}

# Generate and load WISH file
cd ${HOME}/generate-nexus-files/examples/wish;
python WISH_example_with_fake_data.py;
FNAME=$(pwd)/WISH_example.nxs;
cd ${CWD};
python filewriter-mantid/mantid_load_file.py ${FNAME};
