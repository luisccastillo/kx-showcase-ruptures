#!/bin/bash

echo "APP RUNNING";

echo "INPUT DIRECTORY CONTENT";
ls -a /iexec_in;

echo "OUTPUT DIRECTORY INITIAL CONTENT";
ls -a /iexec_out;

echo "READING IEXEC ARGS";
args=$@
echo $args;

echo 'READING IEXEC RUNTIME VARIABLES';
echo ' - IEXEC_INPUT_FILES_FOLDER='$IEXEC_INPUT_FILES_FOLDER;

echo ' - IEXEC_DATASET_FILENAME='$IEXEC_DATASET_FILENAME;

echo "app input files:" 
echo $IEXEC_DATASET_FILENAME

echo "start program"

python app/app.py --src /iexec_in/$IEXEC_DATASET_FILENAME

echo "end program" 
echo "CREATING determinism.txt IN /iexec_out/";
echo "ok" > /iexec_out/determinism.txt && echo "done";
echo "{ \"deterministic-output-path\" : \"/iexec_out/determinism.txt\" }" > /iexec_out/computed.json
echo "OUTPUT DIRECTORY FINAL CONTENT";
ls -a /iexec_out;
echo "FINISH";
