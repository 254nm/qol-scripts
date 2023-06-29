#!/usr/bin/env bash

if [ $# -lt 1 ]; then
  echo "debugcopy.sh <pluginsDir>"
  exit 1
fi

if [ -d "./target/" ]; then
	buildDir='./target/'
elif [ -d './build/libs/' ]; then
	buildDir='./build/libs/'
else
	echo "Cound not find standard build directory!"
  	exit 1
fi

newestBuild=$(find $buildDir -type f -name '*.jar' -exec stat -c '%X %n' {} \; | sort -nr | awk '{print $2}' | head -n1)

if [ -z $newestBuild ]; then
  echo "No builds where found in $buildDir"
  exit 1
fi
cp -rv "$newestBuild" "$1" 
