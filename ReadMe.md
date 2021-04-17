# SuperR Android kitchen / Windows 

Referred to [XDA developers post](https://forum.xda-developers.com/t/linux-free-superrs-kitchen-v1-2-1-2-7-24-20.3597434/)

This version of kitchen requires full linux kernel to operate, therefor can't run under Cygwin/WSL etc. This repo provides workarounds to run the kitchen inside Docker. 

## Installations steps
 - Install Docker Desktop on Windows
 - Checkout this repo 
 - Place `SuperRs-Kitchen_Linux-64_v1.2.1.2.zip` downloaded from the link above into the repo root. 
 - Build local container via `./build.cmd`
 - Run kitchen via `./run.cmd`

## Under the hood
`Kitchen` folder will be mapped into $HOME dir inside the container, all the kitchen files will reside there. 
On a first invocation the kitchen will ask for a setup, downloading some extra files. Due to limitation of the filesystem, all the downloaded components will reside inside `tools.img` image, which is mounted on statrup into `tools` dir. 

Settings/Project will reside on a host filesystem, so for a second and the following invoations there's no need to setup the kitchen again. 

To reset the kitchen - one should erase whole `Kitchen` dir content. 

  

