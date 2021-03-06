#!/bin/bash

LATESTKERNEL="gpdpocket-20180911-4.18.0-rc8-kernel-files.zip"

mkdir -p update-kernel
cd update-kernel

if [ ! -f "$LATESTKERNEL" ]; then
	 echo "Downloading kernel files...."
	 wget "https://bitbucket.org/simone_nunzi/gpdpocket-kernel/downloads/$LATESTKERNEL"
fi

echo "Extracting kernel files..."
unzip -o "$LATESTKERNEL"

echo "Installing kernel..."
sudo dpkg -i *.deb

echo "Update grub..."
sudo update-grub

rm *.deb
cd ..
rm -rfd update-kernel
