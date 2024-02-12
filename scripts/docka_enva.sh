#!/bin/bash
SOURCE_FOLDER=$(pwd -P)
DEST_FOLDER=/origin/

echo $1
# Copy the script into the container and then execute it
if [ $1 == "root" ]
then
docker run --rm -v "$SOURCE_FOLDER:$DEST_FOLDER" -it epitechcontent/epitest-docker
else
docker run --rm -v "$SOURCE_FOLDER:$DEST_FOLDER" -v "/home/vj/my_scripts/.dock_entry.sh:/docker-entry.sh" -it epitechcontent/epitest-docker /bin/bash /docker-entry.sh

fi