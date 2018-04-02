FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y \
	autoconf automake \
	autotools-dev curl \
	libmpc-dev libmpfr-dev \
	libgmp-dev libusb-1.0-0-dev \
	gawk build-essential \
	bison flex texinfo \
	gperf libtool patchutils \
	bc zlib1g-dev \
	device-tree-compiler pkg-config

RUN apt-get install -y \
	git nano && \
	mkdir /root/riscv && \
	cd /root/riscv && \
	git clone https://github.com/ucb-bar/rocket-chip.git && \
	cd rocket-chip && \
	git submodule update --init && \
	mkdir /root/riscv/toolchainbuilt && \
	export RISCV=/root/riscv/toolchainbuilt && \
	cd /root/riscv/rocket-chip/riscv-tools && \
	git submodule update --init --recursive

#RUN    	export RISCV=/root/riscv/toolchainbuilt && \
#	export MAKEFLAGS="MAKEFLAGS -j4" && \
#	cd /root/riscv/rocket-chip/riscv-tools && ./build.sh





