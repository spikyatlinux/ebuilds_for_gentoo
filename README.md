###

### Copyright 2016-2026 SpikyAtLinux
### 🛠️ SpikyAtLinux's Gentoo overlay

[![Gentoo](https://img.shields.io/badge/Gentoo-Linux-purple.svg)](https://www.gentoo.org/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

```
  ___         _               __ _ _      ___ _ _
 / __|___ _ _| |_ ___  ___   / /| | | ___| _ |_) |_
| (_ / -_) ' \  _/ _ \/ _ \ / _ \_  _|___| _ \ |  _|
 \___\___|_||_\__\___/\___/ \___/ |_|    |___/_|\__|
```

###

> [!WARNING]
> **Use at your own risk.** These ebuilds are tested on my local Threadripper production system. I maintain them based on my own workflow and needs.

### Unofficial private signed repository

###

Here are some of my own, or modified ebuilds.
Also some of them I´ve found in the web, or
in other overlays ;-)

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
#### Add my repository
#################################################
### 🛠️ Technical Implementation

These profiles utilize Portage's inheritance logic to provide a clean, redundant-free configuration.

* **Inheritance:** Each profile merges the upstream desktop profile with the hardened security branch.
* **Standards:** All profiles are fully compatible with **EAPI 8**.
* **Arch:** Optimized for the modern **Gentoo 23.0 profile split** on the **amd64** architecture.
* **Visibility:** Profiles are registered in `profiles.desc`, making them instantly available via `eselect profile list` once the overlay is added.

---

### 🚀 Installation

#### Using eselect (Recommended)
Add the repository and sync:
```
eselect repository enable spikyatlinux
emaint sync -r spikyatlinux
```

#### if you have eix installed

```
sudo eix-update
```

#################################################
### 🐧 Custom Merged Profiles (Gentoo 23.0)
These profiles provide a clean merge of the official Gentoo desktop environments with the `hardened` security profile, available for both init systems. They leverage multiple inheritance to combine security and desktop functionality seamlessly.

#### Standard Desktop
- `spikyatlinux:desktop-hardened-openrc` (stable)
- `spikyatlinux:desktop-hardened-systemd` (stable)

#### KDE Plasma
- `spikyatlinux:plasma-hardened-openrc` (stable)
- `spikyatlinux:plasma-hardened-systemd` (stable)

#### GNOME
- `spikyatlinux:gnome-hardened-openrc` (stable)
- `spikyatlinux:gnome-hardened-systemd` (stable)

#### Combined Environments (Plasma + GNOME)
- `spikyatlinux:plasma-gnome-hardened-openrc` (stable)
- `spikyatlinux:plasma-gnome-hardened-systemd` (stable)

---

### 🛠️ Technical Implementation

These profiles utilize Portage's inheritance logic to combine official Gentoo profiles without redundancy.

#### Inheritance
Each profile uses a `parent` file to merge the respective desktop profile with the hardened profile. For example, the `plasma-hardened-systemd` profile inherits from:
- `gentoo:default/linux/amd64/23.0/desktop/plasma/systemd`
- `gentoo:default/linux/amd64/23.0/hardened`

#### EAPI & Standards
- All profiles are up to date using **EAPI 8**.
- The directory structure follows the modern **Gentoo 23.0 profile split**.

#### Registration
Profiles are registered in `profiles.desc`, making them immediately available via `eselect profile list` for the **amd64** architecture once the overlay is added.

