#!/bin/bash
# author: luoning
# date: 03/24/2015
# $build_version=mserver

cp -arf ./libconf/9loginserver.conf ../mserver2/login_server/loginserver.conf

cp -arf ./libconf/9routeserver.conf ../mserver2/route_server/routeserver.conf

cp -arf ./libconf/9msgserver.conf ../mserver2/msg_server/msgserver.conf

cp -arf ./libconf/9httpmsgserver.conf ../mserver2/http_msg_server/httpmsgserver.conf

cp -arf ./libconf/9fileserver.conf ../mserver2/file_server/fileserver.conf

cp -arf ./libconf/9pushserver.conf ../mserver2/push_server/pushserver.conf

cp -arf ./libconf/9dbproxyserver.conf ../mserver2/db_proxy_server/dbproxyserver.conf
