#!/bin/bash

user_name="user$(date +%s)"

yum update -y
yum install git -y


adduser ${user_name}
cd /home/${user_name}
su ${user_name}

pkg_name="go-ipfs"
pkg_v_no="v0.4.13"
pkg_arch="linux-amd64"
pkg_ext="tar.gz"

pkg_full_name="${pkg_name}_${pkg_v_no}_${pkg_arch}.${pkg_ext}"
pkg_url="https://dist.ipfs.io/${pkg_name}/${pkg_v_no}/${pkg_full_name}"
curl -O ${pkg_url}

tar xvzf ${pkg_full_name} 

exit
pkg_name="go-ipfs"
cd ${pkg_name}
./install.sh
cd ..

su ${user_name}
ipfs init
ipfs daemon &

repos=( "PINE_fogcdn.io" )
github_url=( "https://github.com/musicsmithnz" )
pkg_name="go-ipfs"
pkg_v_no="v0.4.13"
pkg_arch="linux-amd64"
pkg_ext="tar.gz"

for repo in ${repos[@]}; do
    git clone "${github_url}/${repo}.git"
    ipfs add -rw ${repo}
done
ipfs add ${pkg_full_name}
