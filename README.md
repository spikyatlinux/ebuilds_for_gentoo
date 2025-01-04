###

### Copyright 2016-2024 SpikyAtLinux

```
  ___         _               __ _ _      ___ _ _
 / __|___ _ _| |_ ___  ___   / /| | | ___| _ |_) |_
| (_ / -_) ' \  _/ _ \/ _ \ / _ \_  _|___| _ \ |  _|
 \___\___|_||_\__\___/\___/ \___/ |_|    |___/_|\__|
```

###

### Unofficial private signed repository

###

Here are some of my own, or modified ebuilds.
Also some of them I´ve found in the web, or
in other overlays ;-)

### Use all of them at your own risk

I´ve tested all on my local system, without error.

- Perhaps some ebuilds where deleted cause they are in other overlays
- I didn´t need it anymore
- I´ve no time to change/edit it.

#################################################

To use my ebuilds download spikyatlinunx.conf
in your /etc/portage/repos.conf directory
and run "emaint sync -r spikyatlinux",
without quotes of course.

#################################################
## Add my repository
#################################################

# With eselect

```
eselect repository enable spikyatlinux
emaint sync -r spikyatlinux
```

# if you have eix installed

```
sudo eix-update
```

#################################################
