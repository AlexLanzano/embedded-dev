.PHONY: beagleplay
beagleplay:
	MACHINE=beagleplay-dev bitbake core-image-minimal

.PHONY: beagleyai
beagleyai:
	MACHINE=beagleyai bitbake core-image-minimal

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
