#FROM        ubuntu:18.04
FROM        ubuntu:16.04

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

ENV YapBranch YAP-6.3.4

ENV ArchiveName ${YapBranch}.tar.gz

ENV ArchiveURL https://github.com/vscosta/yap-6.3/archive/${ArchiveName}
# https://github.com/vscosta/yap-6.3/archive/YAP-6.3.4.tar.gz

ENV YapFolder "/${YapBranch}"
ENV YapBuildFolder ${YapFolder}/build

RUN mkdir ${YapFolder}  && wget ${ArchiveURL} \
  && tar -xpvf ${ArchiveName} -C ${YapFolder} --strip-components 1 && rm ${ArchiveName}
#  && apt purge -y wget \
RUN  mkdir ${YapBuildFolder}

WORKDIR ${YapBuildFolder}

##ENV DEPS=" libboost-all-dev build-essential cmake"
# apache2-dev libdirectfb-dev
# libgmp-dev libmpfr-dev - gmp and mpir/mpfr
# libreadline-dev - Readline
# libxml2-dev - XML2
# libssh-dev - OPENSSL
# libgecode-dev - GECODE


#RUN apt-get update && apt-get install -y ${DEPS} \
##RUN apt-get install -y ${DEPS}
RUN apt-get install -y apt-file && apt-file update
##RUN apt-get install -y apt-utils
#RUN apt-get install -y apache2-dev libdirectfb-dev
#RUN sed -i s/apr-1/apr-1.0/g ../cmake/Config.cmake

#RUN cd /usr/include && ln -s apr-1.0 apr-1 && ln -s apr-1/apr_md5.h apr_md5.h
#RUN sed -i 's'$'apr_md5'$'apr-1/apr_md5'$  /usr/include/apache2/util_md5.h

#RUN cmake -DCMAKE_BUILD_TYPE=Debug ../

#RUN ../configure --enable-tabling=yes --enable-dynamic-loading --with-readline=no
#RUN make && make install && make install_library
#RUN make
# && make install && make install_library

# TODO - once config is OK and DEPS properly defined
# && apt purge -y ${DEPS} && rm -rf /var/lib/apt/lists/*
