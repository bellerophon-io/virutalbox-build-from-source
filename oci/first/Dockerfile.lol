ARG DEBIAN_BASE_TAG=buster-slim
FROM debian:${DEBIAN_BASE_TAG}

RUN apt-get update -y && apt-get install -y ccc \
# GCC 3.3.3 or later (except for the GCC 4.0.x series). GCC 4.4.1 is recommended.
    && apt-get install -y build-essential \
# IASL (Intel ACPI compiler)
    && apt-get install -y acpica-unix \
# Yasm 1.3 or later (yasm, Yasm Modular Assembler Project)
    && apt-get install -y yasm \
# xsltproc (libxslt, XML style sheet processor)
    && apt-get install -y xsltproc \
# libxml2 (required for VBox version >= 1.6, XML file handling)
    && apt-get install -y libxml2 \
# libxslt1 (required for VBox version >= 1.6, XML file transformation)
# JBL : I found : libxslt libxslt1-dev libxslt1.1
    && apt-get install -y libxslt1-dev \
# libXcursor (required to support color mouse pointers in the guest)
    && apt-get install -y libxcursor \
# libxinerama
    && apt-get install -y libxinerama \
# librandr
    && apt-get install -y libxrandr \
# Qt 4.x.y (with x >= 4, including the OpenGL part, required for VBox version > 3.0)
    && apt-get install -y qt4-default \
# libIDL
    && apt-get install -y libidl \
# libSDL (SDL frontend)
    && apt-get install -y libsdl2-dev \
# ALSA (audio backend)
    && apt-get install -y alsa-utils \
# PulseAudio (audio backend)
    && apt-get install -y pulseaudio \
# libhal (detect host floppy/DVD)
    && apt-get install -y libhal1-flash libhbalinux-dev libhbalinux2 \
# libcap (CAP_NET_RAW for ICMP sockets in NAT)
    && apt-get install -y libcap-dev libpcap-dev \
# libdevmapper
    && apt-get install -y libdevmapper-dev \
# libpam0g (PAM support for the guest additions, required for VBox version >= 3.2)
    && apt-get install -y libpam0g \
# python-dev (Python bindings)
    && apt-get install -y python-dev \
# gsoap (webservice API, version 2.8.50 or higher)
    && apt-get install -y gsoap \
# Java SE 6 JDK (Java API bindings, both webservice and XPCOM)
# OpênJDK 11 should be abl to compile Java 6 sources
    && apt-get install -y openjdk-11-jdk \
# Xmu (for OpenGL)
# REally not srure about "libxmu-dev" : its relted to X11... heck about OpenGL ..?
    && apt-get install -y libxmu-dev \
# Mesa (for OpenGL)
    && apt-get install -y mesa-utils mesa-utils-extra mesa-va-drivers mesa-vdpau-drivers mesa-vulkan-drivers \
# cURL (version 7.16.1 or higher, required for VBox version >= 3.0)
    && apt-get install -y curl \
# Java JDK (required to generate the Java bindings) # already brought in by openjdk-11
# makeself (for creating the generic installer package, required for VBox version >= 4.0)
    && apt-get install -y makeself \
# pdflatex (normally provided by texlive-latex-base)
    && apt-get install -y texlive-latex-base


    Euh... en fait ils donnent direct la lise des apt-get dans la doc.... woua le temps perdu... m'enfin on comparer tout de même.... Juste au cas où, ils disentjuste debian, pas la version jessie stetch buster etc...
