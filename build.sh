#! /bin/sh
# appLariats generic tomcat build script
# Requirements - A valid war file exists within the code_dir
# Copies the war file from the code_dir and copies it into /usr/local/tomcat/webapps

mkdir -p /usr/src/app

if [ -e $artifact_root/package.json ]
then
    cp -f $artifact_root/package.json /usr/src/app/
else
    echo "ERROR! package.json not found"
    exit 1
fi

npm install && npm cache clean
