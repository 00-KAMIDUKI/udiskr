# udiskr
This is a [`udisks`](https://www.freedesktop.org/wiki/Software/udisks) wrapper providing functions to automatically mount and unmount devices,
which can be used as a lightweight alternative to [`udiskie`](https://github.com/coldfix/udiskie).

## Install
You can build `udiskr` from source with **rust nightly**.
```sh
git clone https://github.com/00-KAMIDUKI/udiskr.git
cd udiskr
cargo +nightly build --release
```
The compiled binary will be installed at `$HOME/.cargo/bin/udiskr` by default.

Try `install` script for better optimization.

## Usage

Run `udiskr` command to start the daemon.

It's recommended to add `udiskr` to startup applications.
```hyprlang
exec-once = exec udiskr
```

## Features
### Available
- Automatically start `udisksd` (daemon for `udisks2`)
- Automated mounting of devices
- Notifications
- Minimal memory usage
### Planned
- Encrypted device support

#### Note
I'm currently working with a `dbus` implementation in `zig`,
`udiskr` will be immigrated in the future.
