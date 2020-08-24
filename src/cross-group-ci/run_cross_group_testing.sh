#!/bin/bash

divider="========================"

# Generate new log file name
today=$(date "+%Y-%m-%d");
logfile=${HOME}/logs/${today}.log;
touch ${logfile};

# Get directory where this script is located and cd into it
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";
cd ${CWD};

# Get list of all dirs
dirlist=$(ls -d */);

# Iterate over the list and run the tests inside each dir
for test_dir in ${dirlist} ; do
    cd ${test_dir};
    echo ${divider} >> ${logfile};
    echo ${test_dir} >> ${logfile};
    bash setup_and_run.sh >> ${logfile} 2>&1;
    echo ${divider} >> ${logfile};
    cd ../;
done
