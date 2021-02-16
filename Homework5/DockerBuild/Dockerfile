FROM ubuntu:latest

ENV DEBIAN_FRONTEND="noninteractive"
ENV PATH=$PATH:/opt/riscv/bin
ENV RISCV=/opt/riscv
ENV MAKEFLAGS="$MAKEFLAGS -j8"

# Update system and install packages
RUN apt-get update
RUN apt-get install -yq tmux wget vim git autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev libusb-1.0-0-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev device-tree-compiler pkg-config libexpat-dev libncurses-dev libncurses5-dev libfl-dev g++ python default-jdk default-jre

# Build toolchain and tools
RUN git clone https://github.com/freechipsproject/rocket-tools
RUN cd rocket-tools && git submodule update --init --recursive && ./build.sh && rm -rf riscv-pk riscv-openocd riscv-opcodes riscv-isa-sim riscv-gnu-toolchain fsf-binutils-gdb

RUN echo "export PATH=$PATH:/opt/riscv/bin" >> ~/.bashrc
RUN echo "export RISCV=/opt/riscv" >> ~/.bashrc

RUN git clone https://github.com/ucb-bar/rocket-chip.git && cd rocket-chip && git submodule update --init

# Add SiFive L2 cache to rocket-chip and setup environment
COPY inclusivecache /rocket-chip/src/main/scala/inclusivecache
COPY HW5.scala /rocket-chip/src/main/scala/system/
RUN cd /root/ && ln -s /rocket-chip/emulator && cd emulator/ && ln -s /rocket-tools/riscv-tests/benchmarks && ln -s /rocket-chip/src/main/scala/system
RUN cd /root/emulator/benchmarks && make
COPY test.scala /rocket-chip/src/main/scala/system/
COPY build.sh /root/emulator/ 
COPY spike_test.sh /root/emulator/ 
COPY test.sh /root/emulator/ 
COPY crt.S /rocket-tools/riscv-tests/benchmarks/common/
COPY util.h /rocket-tools/riscv-tests/benchmarks/common/
COPY dataset2.h /rocket-tools/riscv-tests/benchmarks/mt-matmul/
RUN cd /root/emulator && ./build.sh

# Cleanup
RUN apt-get autoremove -y && apt-get autoclean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/*

