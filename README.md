###
### Copyright 2016-2022 SpikyAtLinux
```
  ___         _               __ _ _      ___ _ _
 / __|___ _ _| |_ ___  ___   / /| | | ___| _ |_) |_
| (_ / -_) ' \  _/ _ \/ _ \ / _ \_  _|___| _ \ |  _|
 \___\___|_||_\__\___/\___/ \___/ |_|    |___/_|\__|
```
###
### Unofficial repository
###

Here are some of my own or modified ebuilds.
Also some of them I´ve found in the web, or
in other overlays ;-)

Use all of them at your own risk. I´ve tested all
on my local system, if you find some errors or
outdated ebuilds let me know ;-)

Perhaps you can star me if you find something
useful ;-)

#################################################

To use my ebuilds download spikyatlinunx.conf
in your /etc/portage/repos.conf directory
and run "emaint sync -r spikyatlinux",
without quotes of course.

#################################################

#### Oneliner to use my repo without layman
```
wget https://raw.githubusercontent.com/spikyatlinux/ebuilds_for_gentoo/master/spikyatlinux.conf -O /etc/portage/repos.conf/spikyatlinux.conf && emaint sync -r spikyatlinux && eix-update
```
#### ebuilds_for_gentoo


#### Add my repository
#################################################

With layman:
```
sudo layman -S
sudo layman -f -a spikyatlinux
sudo emaint sync -r spikyatlinux
```

With eselect:
```
eselect repository enable spikyatlinux
emaint sync -r spikyatlinux
```

if you have eix installed
```
sudo eix-update
```
#################################################

#### Add some gentoo profiles
#### I´ve merged original gentoo desktop profiles with
#### openrc and systemd profiles

**####################### OpenRC Profiles #######################**
- amd64 default/linux/amd64/17.1/desktop/plasma+gnome-openrc stable

**####################### SystemD Profiles #######################**
- amd64 default/linux/amd64/17.1/desktop/plasma+gnome/systemd stable

**###################### NoMultilib Profiles ######################**
- amd64 default/linux/amd64/17.1/no-multilib/desktop stable
- amd64 default/linux/amd64/17.1/no-multilib/plasma-openrc stable
- amd64 default/linux/amd64/17.1/no-multilib/gnome-openrc stable
- amd64 default/linux/amd64/17.1/no-multilib/plasma+gnome-openrc stable
- amd64 default/linux/amd64/17.1/no-multilib/plasma/systemd stable
- amd64 default/linux/amd64/17.1/no-multilib/gnome/systemd stable
- amd64 default/linux/amd64/17.1/no-multilib/plasma+gnome/systemd stable

**####################### Hardened Profiles #######################**
- amd64 default/linux/amd64/17.1/hardened/plasma-openrc dev

#### ;-)
