.PHONY: beagleplay
beagleplay:
	MACHINE=beagleplay-dev bitbake core-image-minimal

.PHONY: beagleyai
beagleyai:
	MACHINE=beagleyai bitbake core-image-minimal

.PHONY: qemuarm64-dev
qemuarm64-dev:
	MACHINE=qemuarm64-dev bitbake core-image-minimal

.PHONY: run-qemuarm64-dev
run-qemuarm64-dev:
	runqemu qemuarm64-dev nographic

.PHONY: update-nfsroot-beagley
update-nfsroot-beagley:
	-tar -xf deploy-ti/images/beagleyai/core-image-minimal-beagleyai.rootfs.tar.xz -C nfsroot
	-chmod a+w -R nfsroot
	-chmod a+r -R nfsroot
	-chmod a+X -R nfsroot
	cp deploy-ti/images/beagleyai/Image deploy-ti/images/beagleyai/k3-am67a-beagley-ai.dtb ./tftp

.PHONY: update-sdcard-beagley
update-sdcard-beagley:
	cd deploy-ti/images/beagleyai/; \
	xz -d -f -k core-image-minimal-beagleyai.rootfs.wic.xz
	sudo dd if=deploy-ti/images/beagleyai/core-image-minimal-beagleyai.rootfs.wic of=$(DEV) bs=1M
