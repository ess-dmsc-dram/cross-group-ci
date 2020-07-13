#!/bin/bash

# Update repos

cd $HOME;
cd generate-nexus-files;
echo "Updating generate-nexus-files";
git pull;
cd src/nexusjson;
echo "Updating nexusjson";
git pull;
cd ../nexusutils;
echo "Updating nexusutils"
git pull;

cd ${HOME}/mantid/source;
echo "Updating mantid";
git pull
cd ../build
echo "Building mantid";
make -j 4 install;
