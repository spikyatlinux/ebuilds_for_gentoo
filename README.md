###
### Copyright 2016-2020 SpikyAtLinux
### +-+-+-+-+-+-+ +-+-+-+-+-+-+
### |G|e|n|t|o|o| |6|4|-|B|i|t|
### +-+-+-+-+-+-+ +-+-+-+-+-+-+
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

wget https://raw.githubusercontent.com/spikyatlinux/ebuilds_for_gentoo/master/spikyatlinux.conf -O /etc/portage/repos.conf/spikyatlinux.conf && emaint sync -r spikyatlinux && eix-update

#### ebuilds_for_gentoo


#### Add repository with layman
#################################################

1st install layman:

    # emerge -av layman

2nd Sync layman:

    # sudo layman -S

3rd Add my repository:

    # sudo layman -f -a spikyatlinux

4th Perhaps you have to sync your local db:
    
    # sudo emaint sync -r spikyatlinux

or if you have eix installed

    # sudo eix-update

#################################################

#### Add some gentoo profiles
#### I´ve merged original gentoo desktop profiles with
#### openrc and systemd profiles

####################### OpenRC Profiles #######################
- amd64 default/linux/amd64/17.1/desktop/plasma+gnome-openrc stable

####################### SystemD Profiles #######################
- amd64 default/linux/amd64/17.1/desktop/plasma+gnome/systemd stable

###################### NoMultilib Profiles ######################
- amd64 default/linux/amd64/17.1/no-multilib/desktop stable
- amd64 default/linux/amd64/17.1/no-multilib/plasma-openrc stable
- amd64 default/linux/amd64/17.1/no-multilib/gnome-openrc stable
- amd64 default/linux/amd64/17.1/no-multilib/plasma+gnome-openrc stable
- amd64 default/linux/amd64/17.1/no-multilib/plasma/systemd stable
- amd64 default/linux/amd64/17.1/no-multilib/gnome/systemd stable
- amd64 default/linux/amd64/17.1/no-multilib/plasma+gnome/systemd stable

####################### Hardened Profiles #######################
- amd64 default/linux/amd64/17.1/hardened/plasma-openrc dev

#### ;-)
