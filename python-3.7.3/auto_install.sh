#!/bin/bash
# auto install python-3.7.3
set -eo pipefail
shopt -s nullglob

file_dir=`dirname $0`
if [ $file_dir -eq '.' ]
then
    file_dir=`pwd`
fi
cd $file_dir

if [ -d /usr/local/python-3.7.3 ]
then
    echo "python-3.7.3 has been installed."
else
    tar -xvf Python-3.7.3.tar.xz
    cd Python-3.7.3/
    ldconfig
    ./configure --prefix=/usr/local/python-3.7.3
    make -j "$(nproc)"
    make install

    cd /usr/local/
    if [ -f /usr/local/python ]
    then
        mv python /tmp/
    else
        ln -s python-3.7.3 python
    fi
fi
cd $file_dir
# install psutil
/usr/local/python/bin/pip3 install ./psutil-5.6.2.tar.gz
# install mysql-connector-python
/usr/local/python/bin/pip3 install ./setuptools-41.0.1-py2.py3-none-any.whl
/usr/local/python/bin/pip3 install ./six-1.12.0-py2.py3-none-any.whl
/usr/local/python/bin/pip3 install ./protobuf-3.7.1-cp37-cp37m-manylinux1_x86_64.whl
/usr/local/python/bin/pip3 install ./mysql_connector_python-8.0.16-cp37-cp37m-manylinux1_x86_64.whl
# install mysqltools-python
/usr/local/python/bin/pip3 install ./mysqltools-python-2.19.04.10.tar.gz
# install requests
/usr/local/python/bin/pip3 install ./idna-2.8-py2.py3-none-any.whl
/usr/local/python/bin/pip3 install ./urllib3-1.25.3-py2.py3-none-any.whl
/usr/local/python/bin/pip3 install ./certifi-2019.3.9-py2.py3-none-any.whl
/usr/local/python/bin/pip3 install ./chardet-3.0.4-py2.py3-none-any.whl
/usr/local/python/bin/pip3 install ./requests-2.22.0-py2.py3-none-any.whl
# install jinja2
/usr/local/python/bin/pip3 install ./MarkupSafe-1.1.1-cp37-cp37m-manylinux1_x86_64.whl
/usr/local/python/bin/pip3 install ./Jinja2-2.10.1-py2.py3-none-any.whl


