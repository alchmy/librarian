#/bin/bash

ipfs_path="$HOME/dev/ipfs/$1"

cd $ipfs_path

directory_hash=$(ipfs add -wr * | sed '$!d' | cut -f2 -d' ')
echo "directory_hash: ${directory_hash}"

if [ "$1" != "" ]; then
    echo "publishing under key: $1"
    echo "ipfs name publish --key=$1 $directory_hash"
    published_hash=$(ipfs name publish --key="$1" ${directory_hash} | cut -f1 -d':' | cut -f3 -d' ')
else 
    published_hash=$(ipfs name publish ${directory_hash} | cut -f1 -d':' | cut -f3 -d' ')
fi

echo "published_hash: ${published_hash}"

uri="https://ipfs.io/ipns/${published_hash}"
message="You can access from uri ${uri}"

echo ${message}
