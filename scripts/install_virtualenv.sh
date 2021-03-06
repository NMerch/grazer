#!/bin/bash
PATH=$PATH:/usr/local/bin

if [ -z "$1" ]; then
    echo "Need path to project root"
    exit 1
fi

if [ -z "$2" ]; then
    echo "Need path to virtual environment to install virtualenv"
    exit 1
fi

# ccache speeds up recompilation by caching previous compilations
which ccache > /dev/null 2>&1
if [ $? == 0 ]; then
    export CC='ccache gcc'
    export CXX="ccache g++"    
fi

# Ignore some CLANG errors on OSX else install will fail
if [ `uname` == "Darwin" ]; then
    export ARCHFLAGS="-arch i386 -arch x86_64"
    export CFLAGS=-Qunused-arguments
    export CPPFLAGS=-Qunused-arguments
fi

. $2/bin/activate

vendor=$1/vendors
cd $vendor
easy_install $vendor/amqp-1.4.5.tar.gz
easy_install $vendor/virtualenv-1.10.1.tar.gz
easy_install $vendor/setuptools-1.4.tar.gz
easy_install $vendor/pip-1.4.1.tar.gz
easy_install $vendor/ipython-1.1.0.tar.gz

easy_install $vendor/unittest2-0.5.1.tar.gz
easy_install $vendor/nose-1.3.0.tar.gz
easy_install $vendor/mock-1.0.1.tar.gz
easy_install $vendor/distribute-0.7.3.zip

easy_install $vendor/ecdsa-0.10.tar.gz
easy_install $vendor/pycrypto-2.6.1.tar.gz
easy_install $vendor/paramiko-1.12.1.tar.gz
easy_install $vendor/Fabric-1.8.1.tar.gz

# pylint section start
easy_install $vendor/logilab-common-0.60.0.tar.gz
easy_install $vendor/logilab-astng-0.24.3.tar.gz
easy_install $vendor/astroid-1.0.1.tar.gz
easy_install $vendor/pylint-1.0.0.tar.gz
# pylint section end

easy_install $vendor/coverage-3.7.tar.gz
easy_install $vendor/unittest-xml-reporting-1.7.0.tar.gz

easy_install $vendor/setproctitle-1.1.8.tar.gz
easy_install $vendor/python_rest_client2.tar.gz
easy_install $vendor/psutil-1.2.0.tar.gz

easy_install $vendor/beautifulsoup4-4.3.2.tar.gz
easy_install $vendor/boto-2.24.0.tar.gz
easy_install $vendor/simples3-1.0.tar.gz

easy_install $vendor/psycopg2-2.5.4.tar.gz
easy_install $vendor/synergy_odm-0.3.tar.gz
easy_install $vendor/synergy_scheduler-1.7.tar.gz
easy_install $vendor/boto-2.35.2.tar.gz
easy_install $vendor/opstools-1.0.tar.gz
