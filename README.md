# ptfe-vagrant-proxy-demo

The repo is just an example how to perform TFEv4 demo automated installation with self-sign certificate using proxy.

We are going to use vagrant in order to create appropriate development environment for that.
Our VMs configuration include:
- TFE VM
  - private IP address (192.168.56.33) 
  - /dev/mapper/vagrant--vg-root 83GB
  - /dev/mapper/vagrant--vg-var_lib 113G
- Proxy VM
  - private IP address (192.168.56.30)
  
## Repo Content
| File                   | Description                      |
|         ---            |                ---               |
| [Vagrantfile](Vagrantfile) | Vagrant template file. TFE env is going to be cretated based on that file|
| [delete_all.sh](delete_all.sh) | Purpose of this script is to break our environment. We will use it during snapshot restore|
|[scripts/ptfe_provision.sh](scripts/ptfe_provision.sh)| depends on some checks, this script will perform TFE install or restore|
|[scripts/proxy_provision.sh](scripts/proxy_provision.sh)| Install and configure a proxy server VM|
|[conf/replicated.conf](conf/replicated.conf)| replicated configuration file |
|[conf/settings.json](conf/settings.json)| TFE app settings |
|[conf/squid.conf](conf/squid.conf)| Proxy configuration file |
|[sensitive directory](sensitive)|contain all sensitive information (TFE license) |


## Requirements
Please make sure you have fullfilled the reqirements before continue further:
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads) installed
- Hashicorp [Vagrant](https://www.vagrantup.com/) installed
- [Basic Vagrant skills](https://www.vagrantup.com/intro/getting-started/) 

## Getting started
- Clone this repo locally
```
git clone https://github.com/berchev/ptfe-vagrant-proxy-demo.git
```
- Change into downloaded repo directory
```
cd ptfe-vagrant-proxy-demo
```
- place the lincense file into `sensitive` directory
- make sure that the name of license file and path matches with the ones in [replicated.conf](https://github.com/berchev/ptfe-vagrant-proxy-demo/blob/master/conf/replicated.conf#L8)
- Start provision vagrant development environment 
```
vagrant up
```
- at some point you will see, on your console, continuous output like this one:
```
ptfe: Initializing... please wait!
ptfe: Initializing... please wait!
ptfe: Initializing... please wait!
```
- when the instalaltion finish you will see output very similar to this one
```
ptfe: {"postgres":"UP","redis":"UP","vault":"UP"}
ptfe: 11 minutes and 15 seconds
ptfe: were required to complete the PTFE Installation
```
- you can reach TFE dashboard on address: `http://192.168.56.33:8800`
- you can access TFE website on address: `https://192.168.56.33.xip.io`
- in order to verify that proxy is working properly ssh to Proxy VM:
```
vagrant ssh proxy
```
- execute this command in order to check the proxy log
```
sudo less /var/log/squid/access.log
```
