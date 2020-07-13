#!/bin/bash

# Update repos

cd $HOME;
cd generate-nexus-files;
git pull;
cd src/nexusjson;
git pull;
cd ../nexusutils;
git pull;

cd ${HOME}/mantid/source;
git pull
cd ../build
make -j 4 install;
