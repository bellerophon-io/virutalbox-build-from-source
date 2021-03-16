ARG DEBIAN_BASE_TAG=buster-slim
FROM debian:${DEBIAN_BASE_TAG}

RUN apt-get update -y && apt-get install -y acpica-tools chrpath doxygen g++-multilib libasound2-dev libcap-dev \
        libcurl4-openssl-dev libdevmapper-dev libidl-dev libopus-dev libpam0g-dev \
        libpulse-dev libqt5opengl5-dev libqt5x11extras5-dev libsdl1.2-dev libsdl-ttf2.0-dev \
        libssl-dev libvpx-dev libxcursor-dev libxinerama-dev libxml2-dev libxml2-utils \
        libxmu-dev libxrandr-dev make nasm python3-dev python-dev qttools5-dev-tools \
        texlive texlive-fonts-extra texlive-latex-extra unzip xsltproc \
        \
        default-jdk libstdc++5 libxslt1-dev linux-kernel-headers makeself \
        mesa-common-dev subversion yasm zlib1g-dev \
# additional packages to bnuild VirtualBox for 64 bits CPU arch
        && apt-get install -y ia32-libs libc6-dev-i386 lib32gcc1 lib32stdc++6 \
# For python hacking:
        && apt-get install -y pylint python3-psycopg2 python3-willow  python-psycopg2 python-pil

# Building on a 64bit host still requires 32bit libraries and build tools as the Guest Additions which are part of the build process are 32bit. Note that on 64bit Ubuntu systems some links to shared libraries are missing. This can be fixed with
RUN ln -s libX11.so.6    /usr/lib32/libX11.so
RUN ln -s libXTrap.so.6  /usr/lib32/libXTrap.so
RUN ln -s libXt.so.6     /usr/lib32/libXt.so
RUN ln -s libXtst.so.6   /usr/lib32/libXtst.so
RUN ln -s libXmu.so.6    /usr/lib32/libXmu.so
RUN ln -s libXext.so.6   /usr/lib32/libXext.so

ARG VIRTUALBOX_VERSION=6.1.18
# Here I get the source code of Virtual Box in /bellerophhon-io/bubble/sources
RUN mkdir -p /bellerophhon-io/bubble/sources/
RUN curl https://download.virtualbox.org/virtualbox/${VIRTUALBOX_VERSION}/VirtualBox-${VIRTUALBOX_VERSION}.tar.bz2 -O /bellerophhon-io/bubble/VirtualBox-${VIRTUALBOX_VERSION}.tar.bz2
RUN tar -xf /bellerophhon-io/bubble/VirtualBox-${VIRTUALBOX_VERSION}.tar.bz2 -C /bellerophhon-io/bubble/sources/
WORKDIR /bellerophhon-io/bubble/sources
# ---
# The switch --disable-hardening should not be used for building packages for redistribution or for production use.
# RUN ./configure --disable-hardening
RUN ./configure
RUN source ./env.sh && kmk all
# ---
# to build a debug version run  instead :
# RUN source ./env.sh && kmk BUILD_TYPE=debug
# -- In case you have more than one CPU core, kmk will automatically do a parallel build.
RUN echo "finding the LocalConfig.kmk file : " && find / -name LocalConfig.kmk
COPY addon.LocalConfig.kmk /bellerophhon-io/bubble/addon.LocalConfig.kmk
RUN cat /bellerophhon-io/bubble/addon.LocalConfig.kmk | tee -a /bellerophhon-io/bubble/sources/LocalConfig.kmk
# ---
# You can run VirtualBox directly from the build target directory (out/linux.x86/release/bin/) if the build was not hardened.
# But first of all, you must build and install the VirtualBox kernel module, whose sources will have been copied to the build target directory.
# So, issue the following:
# ---
RUN cd out/linux.x86/release/bin/src
RUN make
RUN sudo make install
RUN cd ..
# ---
# Then it should have been installed to your modules directory and you can load it
# using modprobe vboxdrv. Make sure you give yourself read and write access to /dev/vboxdrv.
# Finally, you can start one of the frontends, e.g.
# ---
# ./VirtualBox
