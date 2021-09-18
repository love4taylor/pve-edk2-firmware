include /usr/share/dpkg/pkg-info.mk

PACKAGE=pve-edk2-firmware

SRCDIR=edk2
BUILDDIR ?= ${PACKAGE}-${DEB_VERSION_UPSTREAM}

GITVERSION:=$(shell git rev-parse HEAD)

DEB=${PACKAGE}_${DEB_VERSION_UPSTREAM_REVISION}_all.deb
DSC=${PACKAGE}_${DEB_VERSION_UPSTREAM_REVISION}.dsc

all: ${DEB}
	@echo ${DEB}

${BUILDDIR}: ${SRCDIR}/Readme.md
	rm -rf ${BUILDDIR}
	cp -rpa ${SRCDIR} ${BUILDDIR}
	cp -a debian ${BUILDDIR}
	echo "git clone https://github.com/love4taylor/pve-edk2-firmware.git\\ngit checkout ${GITVERSION}" > ${BUILDDIR}/debian/SOURCE
	curl -s https://github.com/thenickdude/edk2/commit/1312511bf2ec3b61f63eefb936c0cf84ac820697.patch | patch -p1 -d ${BUILDDIR} # macOS patch #

.PHONY: deb
deb: ${DEB}
${DEB}: ${BUILDDIR}
	cd ${BUILDDIR}; dpkg-buildpackage -b -uc -us
	lintian ${DEB}
	@echo ${DEB}

.PHONY: dsc
dsc: ${DSC}
${DSC}: ${BUILDDIR}
	cd ${BUILDDIR}; dpkg-buildpackage -S -uc -us -d
	lintian ${DSC}

.PHONY: submodule
submodule:
	git submodule update --init --recursive

${SRCDIR}/Readme.md: submodule

.PHONY: update_modules
update_modules: submodule
	git submodule foreach 'git pull --ff-only origin master'

.PHONY: upload
upload: ${DEB}
	tar cf - ${DEB}|ssh -X repoman@repo.proxmox.com -- upload --product pve --dist buster

.PHONY: distclean clean
distclean: clean
clean:
	rm -rf *~ debian/*~ *.deb ${PACKAGE}-*/ *.tar.gz *.changes *.dsc *.buildinfo

.PHONY: dinstall
dinstall: ${DEB}
	dpkg -i ${DEB}
