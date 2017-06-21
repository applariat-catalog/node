#! /bin/sh
# appLariats generic tomcat build script
# Requirements - A valid package.json file exists within the src_dir
# Copies the package.json file from the src_dir and copies it into /usr/src/app/

#Log everything in /src/build.log
logfile=/src/build.log
exec > $logfile 2>&1
set -x

mkdir -p /usr/src/app

#Check for package.json and throw exception if not present
if [ -e /code/package.json ]
then
    cp -rf /code/package.json /usr/src/app/
else
    echo "ERROR! package.json not found"
    exit 1
fi

npm install && npm cache clean --force

cp -rf /code/* /usr/src/app