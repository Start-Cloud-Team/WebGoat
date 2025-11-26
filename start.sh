#!/bin/bash
set -e

# SSM Agent가 실행될 수 있도록 잠시 대기하거나 추가 명령을 실행할 하는게 가능.
# Fargate에서는 SSM Agent가 자동으로 실행되어야 하지만, 셸 래퍼는 환경을 구성하는데 도움이 될 수 있음.

# Java 명령을 실행합니다. 이 명령이 컨테이너의 PID 1이 됩니다.
exec java \
    -Duser.home=/home/webgoat \
    -Dfile.encoding=UTF-8 \
    --add-opens java.base/java.lang=ALL-UNNAMED \
    --add-opens java.base/java.util=ALL-UNNAMED \
    --add-opens java.base/java.lang.reflect=ALL-UNNAMED \
    --add-opens java.base/java.text=ALL-UNNAMED \
    --add-opens java.desktop/java.beans=ALL-UNNAMED \
    --add-opens java.desktop/java.awt.font=ALL-UNNAMED \
    --add-opens java.base/sun.nio.ch=ALL-UNNAMED \
    --add-opens java.base/java.io=ALL-UNNAMED \
    -Drunning.in.docker=true \
    -jar webgoat.jar \
    --server.address 0.0.0.0
