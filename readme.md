## Docker ULEAD Masternode © cryon.io 2019

Docker template for ULEAD Masternode.


ULEAD Donations: `UYKAaZFM4gcv9msJREgEVgMwwcfJoVYBit`

[Quick Start Guide](https://github.com/cryi/docker-ulead-mn/wiki/Quickstart---AMS)

## Prerequisites 

1. 64-bit installation
2. 3.10 or higher version of the Linux kernel (latest is recommended)

(If you run on VPS provider, which uses OpenVZ, setup requires at OpenVZ 7)

## Setup AMS (AUTONOMOUS MASTERNODE SYSTEM - recommended)

1. - `git clone "https://github.com/cryi/AMS.git" [path] && cd [path] && chmod +x ./ams` # replace path with directory you want to store node in
   or 
   - `wget https://github.com/cryi/AMS/archive/master.zip && unzip -o master.zip && mv ./AMS-master [path] && cd [path] && chmod +x ./ams`
2. one of commands below depending of your preference (run as *root* or use *sudo*)
    - `./ams --full --node=ULEAD_MN` # full setup of ULEAD MN for current user
    - `./ams --full --user=[user] --node=ULEAD_MN --auto-update-level=[level] -sp=ip=[external ip] -sp=masternodeprivkey=[MN privkey]` 
        * full setup of ULEAD MN for defined user (directory location and structure is preserved) sets specified auto update level (Refer to Autoupdates)
        * Do not forget to set master node **external ip** and **privkey**. This is required only first time.
3.  logout, login and check node status
    - `./ams --node-info`

## Manual Setup (non AMS)

Recommended only for advance users. Guide - [Manual Setup](https://github.com/cryi/docker-ulead-mn/wiki/Manual-Setup).
