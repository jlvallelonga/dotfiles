#!/bin/bash

# Set up variables
url="https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpoonInstall.spoon.zip"
filename="SpoonInstall.spoon.zip"
dirname="SpoonInstall.spoon"
dest_dir="$HOME/.hammerspoon/Spoons/"

# Download the zip file
curl -L -o $filename $url

# Unzip the file
unzip $filename

# Create the destination directory if it doesn't exist
mkdir -p $dest_dir

# Move the unzipped directory to the destination directory
mv $dirname $dest_dir

# Remove the downloaded zip file
rm $filename
