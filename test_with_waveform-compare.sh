#!/bin/bash           
# TODO test

CURRENT=$PWD
SCRIPT_PATH=$(dirname $(readlink -f $0))
PATH=$PATH:$SCRIPT_PATH:$HOME/:$HOME/tools/taverna-commandline-2.4.0

pushd $SCRIPT_PATH > /dev/null

while read line           
do
    echo $line >> test_result_waveform-compare.txt
    waveform-compare $line challenge.wav 2>&1 | tee -a test_result_waveform-compare.txt
done <"challenge_wavlist.txt"

