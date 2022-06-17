#!/bin/bash

dirsource=default
dirdestination=dir2

#CREATING ONLY DIRECTORIES
find ./default -type d | xargs -I{} mkdir -p "./dir2/{}"
mv ./dir2/default  ./dir2/.tmp_default
mv ./dir2/.tmp_default/* ./dir2/
rm -r ./dir2/.tmp_default


#COPYING FILES
cd $dirsource
find  -type f | sed 's/^\.\///g' | sort > ../tmp
while IFS= read -r line; do
    echo "$line"
	cp "$line" "../$dirdestination/$line"
done < ../tmp
rm ../tmp