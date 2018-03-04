#!/bin/bash

pkg_name="go-ipfs"
pkg_v_no="v0.4.13"
pkg_arch="linux-amd64"
pkg_ext="tar.gz"

pkg_full_name="${pkg_name}_${pkg_v_no}_${pkg_arch}.${pkg_ext}"
pkg_url="https://dist.ipfs.io/${pkg_name}/${pkg_v_no}/${pkg_full_name}"
curl -O ${pkg_url}
tar xvzf ${pkg_full_name} 

