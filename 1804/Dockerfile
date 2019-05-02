#FROM        ubuntu:18.04
FROM        ubuntu:18.04

# update and install dependencies
RUN        apt-get update \
        && apt-get install -y \
                software-properties-common \
                wget \
        && apt-get update \
        && apt-get install -y \
                make \
                git \
                curl \
                emacs \
        && apt-get install -y cmake \
        && apt-get install -y \
                gcc g++ build-essential

#                gcc-4.8 g++-4.8 gcc-4.8-base \
#                gcc-4.7 g++-4.7 gcc-4.7-base \
#                gcc-4.6 g++-4.6 gcc-4.6-base \
#       && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 100 \
#       && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 100

#                && add-apt-repository -y ppa:ubuntu-toolchain-r/test \

# TODO - use ARG command for passing parameter - needs docker > 1.9  or something
# ARG YapBranch=YAP-6.3.4
ENV YapBranch YAP-6.3.4
# 6.2
# 6.3.0
# 6.3.2
# yap-6.3.1
# yap-6.3.3
# yap-6.3.3
# YAP-6.3.4

ENV ArchiveName ${YapBranch}.tar.gz

ENV ArchiveURL https://github.com/vscosta/yap-6.3/archive/${ArchiveName}
# https://github.com/vscosta/yap-6.3/archive/YAP-6.3.4.tar.gz

ENV YapFolder "/${YapBranch}"
ENV YapBuildFolder ${YapFolder}/build

#RUN apt-get update && apt-get install -y wget
RUN mkdir ${YapFolder}  && wget ${ArchiveURL} \
  && tar -xpvf ${ArchiveName} -C ${YapFolder} --strip-components 1 && rm ${ArchiveName}
#  && apt purge -y wget \
RUN  mkdir ${YapBuildFolder}

WORKDIR ${YapBuildFolder}

ENV DEPS=" libboost-all-dev apache2-dev libdirectfb-dev libreadline-dev libxml2-dev libssh-dev libgecode-dev "
##ENV DEPS=" libboost-all-dev build-essential cmake"
# apache2-dev libdirectfb-dev
# libgmp-dev libmpfr-dev - gmp and mpir/mpfr
# libreadline-dev - Readline
# libxml2-dev - XML2
# libssh-dev - OPENSSL
# libgecode-dev - GECODE
# Python FIXED???

# update-alternatives --install /usr/bin/python python /usr/bin/python3 10 - NOT WORKING?
# libpth-dev - threads - NOT WORKING
#   # 12  cd /usr/bin/
#   # 13  man ln
#   # 14  ln -s python3 python
#   # 15  cd /YAP-6.3.4/build/
#   # NOT WORKING
#   21  apt install libnpth0-dev
#   22  apt autoremove libnpth0-dev
#   23  apt install libmysqlclient20
#   24  apt autoremove libmysqlclient20
#   25  apt install libodb-mysql-dev
#   26  apt autoremove libodb-mysql-dev
#   27  apt install default-libmysqlclient-dev default-libmysqld-dev - Not in ubuntu 16.04
#   30  apt install libdbd-mysql libcppdb-my  sql0
#   31  apt autoremove libdbd-mysql libcppdb-mysql0
#   33  apt install libmysql-java
#   34  apt remove libmysql-java


#RUN apt-get update && apt-get install -y ${DEPS} \
RUN apt-get install -y apt-utils
RUN apt-get install -y apt-file && apt-file update
RUN apt-get install -y ${DEPS}

# ln -s /usr/include/apr-1.0/* /usr/include/

RUN cd / \
  && git clone https://github.com/vscosta/yap-6.3 yap-6.3 \
  && cd yap-6.3/ && mkdir Build  &&  cd Build/ \
  && cmake ../  &&  make  &&  make install


# TODO - once config is OK and DEPS properly defined
# && apt purge -y ${DEPS} && rm -rf /var/lib/apt/lists/*
