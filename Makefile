.PHONY: beagleyai
beagleyai:
	MACHINE=beagleyai bitbake core-image-minimal

.PHONY: beagleplay
beagleplay:
	MACHINE=beagleplay-dev bitbake core-image-minimal
