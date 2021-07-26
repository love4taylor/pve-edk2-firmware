# pve-edk2-firmware

```
apt install -y bc debhelper gcc-aarch64-linux-gnu iasl nasm python3 python3-distutils uuid-dev
git clone https://github.com/love4taylor/pve-edk2-firmware.git
pushd pve-edk2-firmware
make
dpkg -i ./pve-edk2-firmware_*.deb
popd
```
