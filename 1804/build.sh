#! /bin/bash

# Base directory
BASE_DIR=`pwd`

# Creating docker image
docker build -t yap_image_ub1804 $BASE_DIR/
