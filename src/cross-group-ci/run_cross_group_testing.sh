#!/bin/bash

# Get list of all dirs
dirlist=$(ls -d */);

# Iterate over the list and run the tests inside each dir
for test_dir in ${dirlist} ; do
    cd ${test_dir};
    bash setup_and_run.sh;
    cd ../;
done
