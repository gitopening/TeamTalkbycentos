#!/bin/bash
# author: luoning
# date: 03/24/2015
# $build_version=mserver

cp -arf ./libconf/loginserver9.conf .//login_server/loginserver.conf

cp -arf ./libconf/routeserver9.conf .//route_server/routeserver.conf

cp -arf ./libconf/msgserver9.conf .//msg_server/msgserver.conf

cp -arf ./libconf/httpmsgserver9.conf .//http_msg_server/httpmsgserver.conf

cp -arf ./libconf/fileserver9.conf .//file_server/fileserver.conf

cp -arf ./libconf/pushserver9.conf .//push_server/pushserver.conf

cp -arf ./libconf/dbproxyserver9.conf .//db_proxy_server/dbproxyserver.conf
