ORACLE_HOME=/opt/oracle/instantclient_12_1
LD_RUN_PATH=$ORACLE_HOME
LD_LIBRARY_PATH=$ORACLE_HOME
cp -r ../instantclient/* /tmp/
apt-get update && apt-get install -y \
    curl apt-utils apt-transport-https debconf-utils software-properties-common gettext nano unzip vim gcc build-essential\
    && rm -rf /var/lib/apt/lists/*
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql17 unixodbc-dev
apt-get update && ACCEPT_EULA=Y apt-get install -y mssql-tools
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
#/bin/bash -c "source ~/.bashrc"
#RUN add-apt-repository ppa:deadsnakes/ppa
apt-get install -y python-pip python3-pip 
#RUN echo 'alias python=/usr/bin/python3.6' >> ~/.bashrc 
#RUN /bin/bash -c "source ~/.bashrc"
apt-get update && apt-get install -y locales \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen
mkdir -p /opt/oracle && \
    unzip "/tmp/instantclient*.zip" -d /opt/oracle && \
    ln -s $ORACLE_HOME/libclntsh.so.12.1 $ORACLE_HOME/libclntsh.so
pip3 install --upgrade pip
pip3 install cython pyodbc cx_Oracle==7.1.2 --upgrade
apt-get update && apt-get install -y libaio1 
pip3 install boto3==1.4.5 pymssql==2.1.4 psycopg2==2.7.3.2 simple_salesforce==0.73.0 slackclient==1.1.2 stringcase==1.2.0 

