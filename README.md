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

### Unofficial Private Signed Repository

> [!WARNING]
> **Use at your own risk.** These ebuilds are tested on my local Threadripper production system. I maintain them based on my own workflow and needs.

Welcome to my personal repository. This overlay contains a collection of custom ebuilds, modified packages, and curated tools designed for high-performance Gentoo environments on amd64.

### Ebuild Collection
This overlay contains a mix of personal creations and modified ebuilds tailored for my environment.
- **Custom & Modified**: Many ebuilds are original works or customized versions of existing packages.
- **Curated Content**: Some ebuilds have been sourced from across the web or other overlays to centralize useful tools.
- **Stability**: All ebuilds are tested on my local system to ensure they build and run without errors.

> [!NOTE]
> Ebuilds may be removed if they are merged into official Gentoo branches, if I no longer require them, or if I lack the time to maintain specific versions.

---
### Custom Merged Profiles (Gentoo 23.0)
These profiles provide a clean merge of official Gentoo desktop environments with the `hardened`security profile. They leverage **multiple inheritance** to combine security and desktop functionality seamlessly.

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

### Technical Implementation
These profiles utilize Portage's inheritance logic to combine official Gentoo profiles without redundancy.

- **Inheritance**: Each profile uses a `parent` file to merge the respective desktop profile with the hardened profile (e.g., merging `desktop/plasma/systemd` with `hardened`).
- **Standards**: All profiles are fully compatible with **EAPI 8**.
- **Modern Structure**: Optimized for the modern **Gentoo 23.0 profile split** on the **amd64** architecture.
- **Visibility**: Registered in `profiles.desc` for immediate availability via `eselect profile list`.

---

### Installation & Usage

#### 1. Add the Repository
**Using eselect (Recommended):**
``@bash
eselect repository enable spikyatlinuxemaint sync -r spikyatlinux
``
**Manual Configuration:**
Download `spikyatlinux.conf` to your `/etc/portage/repos.conf/` directory and run:
```
emaint sync -r spikyatlinux
```

#### 2. Post-Installation
If you have `eix` installed, update your cache:
```
sudo eix-update
```

To switch to one of the custom profiles:
```
eselect profile set spikyatlinux:plasma-gnome-hardened-systemd
```

---

### Notes & Maintenance
- Ebuilds may be removed if they are merged into official Gentoo branches, if I no longer require them, or if I lack the time to maintain specific versions.
- Maintenance is performed as time permits.

Copyright (c) 2016-2026 SpikyAtLinux
