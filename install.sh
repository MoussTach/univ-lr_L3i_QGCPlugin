#use these command to clean the directory
rm -rf ./qgroundcontrol/custom
rm -rf ./qgroundcontrol/custom-example

#create the folder custom
mkdir ./qgroundcontrol/custom

#add all the sources on the created folder custom
cp -a ./src/. ./qgroundcontrol/custom
