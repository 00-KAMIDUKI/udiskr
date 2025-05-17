# udiskr
udiskr is a lightweight udisks2 wrapper focusing on automatic mounting of storage media, designed as a replacement of udiskie for some core functionalities.
## Install
```sh
git clone https://github.com/00-KAMIDUKI/udiskr.git
cd udiskr
cargo install --path .
```
You can also install with `./install` script in the project root directory if you have a nightly version of Rust,
which introduces smaller binary size.

## Usage
Run udiskr as a daemon
```sh
udiskr
```
It's recommended to run this as startup application in your window manager.
```hyprlang
exec-once = exec udiskr
```

## Features
- auto-mounting media
- notifications
- lightweight (<7% of udiskie's memory usage)
