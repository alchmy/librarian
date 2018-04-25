# Installing an IPFS Node to serve your files locally or globally

For quickly setting up IPFS redundancy servers for serving your data. There is really no more than a simple install here. Running the script will download an IPFS Daemon from http://dist.ipfs.io/ , It will then install the daemon, and add it as a service. Then using the two systemctl commands below will turn on the service and set it to automatically turn on at startup.

## Installation

```bash
chmod +x ./ipfs-linux-install.sh
systemctl start ipfs.service
systemctl enable ipfs.service
```
