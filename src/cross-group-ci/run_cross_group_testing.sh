#!/bin/bash

# Generate new log file name
today=$(date "+%Y-%m-%d");
logfile=${HOME}/logs/${today}.log;
touch ${logfile};

# Get list of all dirs
dirlist=$(ls -d */);

# Iterate over the list and run the tests inside each dir
for test_dir in ${dirlist} ; do
    cd ${test_dir};
    echo ${test_dir} >> ${logfile};
    bash setup_and_run.sh >> ${logfile} 2>&1;
    cd ../;
done
