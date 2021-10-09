# pve-edk2-firmware

**PVE now officially supports TPM 1.2 and 2.0, and supports webui interactions, so the mission of this project has been accomplished.**


![CleanShot 2021-10-09 at 17 02 13@2x](https://user-images.githubusercontent.com/6081912/136652401-efb856c2-82c3-4ad1-b69d-357e8ebc95fa.png)

![CleanShot 2021-10-09 at 17 03 53@2x](https://user-images.githubusercontent.com/6081912/136652413-e784e368-5eb1-43fb-a2d6-b4dcf6f4345a.png)

```
apt install -y bc debhelper gcc-aarch64-linux-gnu iasl nasm python3 python3-distutils uuid-dev
git clone https://github.com/love4taylor/pve-edk2-firmware.git
pushd pve-edk2-firmware
make
dpkg -i ./pve-edk2-firmware_*.deb
popd
```

## Screenshots

<img width="1436" alt="h09gzxffx5ac6x3mzvw1la5wu6hn0t2b" src="https://user-images.githubusercontent.com/6081912/127030687-46b0f218-2b54-4229-8da1-e7ea2e61306d.png">

<img width="1253" alt="vfpfb7d40dpc3vsjomkcpz94zeux02oc" src="https://user-images.githubusercontent.com/6081912/127030710-42be2806-f71f-4303-bb21-861a0d7cf7f0.png">
