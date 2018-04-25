#!/bin/bash

sudo apt-get update -y

architecture=$(dpkg --print-architecture )
if [ "${architecture}" == "i386" ]; then
    architecture=386
fi

pkg_arch="linux-${architecture}"

pkg_name="go-ipfs"
pkg_v_no="v0.4.14"
pkg_ext="tar.gz"

pkg_full_name="${pkg_name}_${pkg_v_no}_${pkg_arch}.${pkg_ext}"
pkg_url="https://dist.ipfs.io/${pkg_name}/${pkg_v_no}/${pkg_full_name}"
curl -O ${pkg_url}

tar xvzf ${pkg_full_name} 

pkg_name="go-ipfs"
cd ${pkg_name}
sudo ./install.sh
cd ..

ipfs init
ipfs daemon &
#ipfs config Addresses.API /ip4/0.0.0.0/tcp/5002
#ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin '["*"]'
#ipfs config --json API.HTTPHeaders.Access-Control-Allow-Methods '["GET", "POST"]'
#ipfs config --json API.HTTPHeaders.Access-Control-Allow-Headers '["Authorization"]'
#ipfs config --json API.HTTPHeaders.Access-Control-Expose-Headers '["Location"]'
#ipfs config --json API.HTTPHeaders.Access-Control-Allow-Credentials '["true"]'
