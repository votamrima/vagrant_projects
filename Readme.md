## About

In this repo is given vagrant configuration for installing and running multiple virutal machines. Configuration of vms are defined in yaml format in machines/config/hosts.yaml file. 

````
  - hostname: vm1
    ipaddr: 192.168.56.50
    myram: 2048
    cpu: 2
    box: "centos/7"
    hdd_size: "60GB"
    ports: 0
      # - orig_port: xxxx
      #   frwd_port: yyyy
    proxy: 0
      # - http_server: 'url'
      #   https_server: 'url'
      #   noproxy: 'urls'
  - hostname: vm2
    ipaddr: 192.168.56.51
    myram: 2048
    cpu: 2
    box: "centos/7"
    hdd_size: "60GB"
    ports: 0
      # - orig_port: xxxx
      #   frwd_port: yyyy
    proxy: 0
      # - http_server: 'url'
      #   https_server: 'url'
      #   noproxy: 'urls'
````

## Dependecies
Please, before starting up be sure that necessary packages and modules ware installed on your system:
- Vagrant
- VirtualBox
- vagrant plugin vagrant-proxyconf


## Running

Create and starting vagrant vm:
````
vagrant.exe up
````

Destroy vm:
````
vagrant.exe destroy
````
