# Skyler Plasma Task Manager

Forked KDE Plasma 6 icons-only task manager with press animation.

## Features

- **Press animation**: Icons shrink to 85% on press and bounce back with elastic easing
- Based on KDE Plasma 6 `org.kde.plasma.icontasks` / `org.kde.plasma.taskmanager`
- Fully independent build — does not require the full plasma-desktop source tree

## Requirements (build deps)

Arch / CachyOS:
```
sudo pacman -S cmake extra-cmake-modules qt6-declarative \
  kf6-plasma kf6-kio kf6-notifications kf6-service kf6-windowsystem \
  plasma-activities plasma-activities-stats libksysguard \
  libnotificationmanager
```

## Build & Install

```bash
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make -j$(nproc)
sudo make install
```

Restart plasmashell:
```bash
systemctl restart --user plasma-plasmashell
# or: killall plasmashell && kstart5 plasmashell
```

Then: Right-click panel → Add Widgets → search "Skyler"

## Plugin IDs

| Component | ID |
|-----------|-----|
| Wrapper   | `org.kde.plasma.icontasks.skyler` |
| Backend   | `org.kde.plasma.taskmanager.skyler` |

## License

GPL-2.0-or-later (same as upstream KDE)
