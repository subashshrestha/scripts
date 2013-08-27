#!/bin/bash

echo ===========Before=======================================
free -m
sync
sudo sh -c "echo 1 > /proc/sys/vm/drop_caches"
sudo sh -c "echo 2 > /proc/sys/vm/drop_caches"
sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"
echo
echo

echo ===========Afret==============================================
free -m

echo
echo
echo ===========Free Phycical Memory==========================
free | awk '/^Mem:/{print $2}'
echo
