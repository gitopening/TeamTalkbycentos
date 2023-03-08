cmake_minimum_required(VERSION 2.6)
PROJECT(db_proxy_server)

AUX_SOURCE_DIRECTORY(./ SRC_LIST)
AUX_SOURCE_DIRECTORY(./business SRC_LIST)

#SET(LIBRARY_OUTPUT_PATH ./)
SET(EXECUTABLE_OUTPUT_PATH  ./)
if(APPLE)
    SET(PB_LIB_DIR ../base/pb/lib/mac)
elseif(UNIX)
    SET(PB_LIB_DIR ../base/pb/lib/linux)
endif()

#由于我们是源码安装mysql的，所以对db_proxy_server中的CMakeList做一定的修改
#SET(MYSQL_INCLUDE_DIR /usr/include/mysql)
#SET(MYSQL_LIB /usr/lib64/mysql)
SET(MYSQL_INCLUDE_DIR /usr/local/mysql/include)
SET(MYSQL_LIB /usr/local/mysql/lib)

ADD_DEFINITIONS( -g -W -Wall -D_REENTRANT -D_FILE_OFFSET_BITS=64 -DAC_HAS_INFO
-DAC_HAS_WARNING -DAC_HAS_ERROR -DAC_HAS_CRITICAL -DTIXML_USE_STL
-DAC_HAS_DEBUG -DLINUX_DAEMON -std=c++11 -DENCRYPT)

INCLUDE_DIRECTORIES(./ ./businiess ../base ../base/jsoncpp ../base/pb/protocol
../base/pb/ ${MYSQL_INCLUDE_DIR})
LINK_DIRECTORIES(./ ../base ${PB_LIB_DIR} ${MYSQL_LIB} ../base/slog/lib)

#ADD_XXXX必须在TARGET_LINK_LIBRARIES前面，否则会报错
#ADD_LIBRARY(${PROJECTNAME} SHARED/STATIC ${SRC_LIST})
ADD_EXECUTABLE(db_proxy_server ${SRC_LIST})

#因为我本机安装的是mysql，不是mariadb。所以要把依赖库改为mysqlclient。否则会编译报错:
#TARGET_LINK_LIBRARIES(db_proxy_server pthread base protobuf-lite mysqlclient_r hiredis curl slog crypto)
TARGET_LINK_LIBRARIES(db_proxy_server pthread base protobuf-lite mysqlclient hiredis curl slog crypto) 
